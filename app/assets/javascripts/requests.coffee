angular
	.module('payments')
	.controller("PaymentsListController", [ '$scope', '$resource', '$filter'
	($scope, $resource, $filter)->

#main menu functions			
		$scope.activeMenu = 2;

		$scope.isActive = (current)->
			current == $scope.activeMenu;
		
		$scope.clickMenu = (clicked)->
			$scope.activeMenu = clicked;
			$scope.isCollapsed = true;

# calendar functions	  
		
		$scope.inlineOptions = 
			showWeeks: true

		$scope.dateOptions =
			startingDay: 1

		#$scope.date_from = new Date();
		#$scope.date_to = new Date();
		$scope.date_from = '09.12.2015';
		$scope.date_to = '11.12.2015';

		$scope.calendar1 =
			opened: false
		$scope.calendar2 =
			opened: false

		$scope.open_calendar1 = ()->
			$scope.calendar1.opened = true;
		$scope.open_calendar2 = ()->
			$scope.calendar2.opened = true;

		$scope.calendar_ok = (d1,d2)->
			bootbox.confirm('Изменить интервал? (все несохраненные изменнеия будут потяряны!)' , (result) ->
				if result == true
					$scope.date_from = d1 if d1
					$scope.date_to = d2 if d2
					get_requests($scope.date_from, $scope.date_to)
			)
			return true
# dictionaries prepare

		Baccounts_resource = $resource('/b_accounts/:baccountid',{ baccountid: '@id', format: 'json'},
		{
			'query':  {method:'GET', isArray:true},
			'save':   {method:'PUT'},
			'create': {method:'POST'}
		});
		$scope.baccounts = Baccounts_resource.query()


# requests and payments data management

		Requests = ( date_from, date_to, id )->
			return $resource('/requests/:id', { id, date_from, date_to, format: 'json' },
			{ 
				'query':  {method:'GET', isArray:true},
				'save':   {method:'PUT'},
				'create': {method:'POST'}
			});

		$scope.rowCollection = Requests($scope.date_from, $scope.date_to).query()


		save_payment = (payment, typepayments, request) ->
			paymentid = payment.id if payment.id
			requestid = request.id if request.id
			payment_resource = $resource('/:typepayments/:paymentid', { typepayments, paymentid, requestid, format: 'json' },
			{ 
				'save':   {method:'PUT'},
				'create':   {method:'POST'},
			});

			if payment.id
				payment_resource.save( 
					payment, 
					(data) ->
						console.log 'success save: ' + data.id
						payment.is_changed = false
						# payment.id = data.id
					(err) ->
						bootbox.alert 'Сохранение не удалось: ' + err.status
						payment.is_changed = true
				)
			else
				payment_resource.create(
					payment, 
					(data) ->
						console.log 'success create: ' + data.id
						payment.is_changed = false
						payment.id = data.id
					(err) ->
						bootbox.alert 'Создание не удалось: ' + err.status
						payment.is_changed = true
				)

		refresh_request_sum = (request) ->
			total_a_sum = 0
			for index, apayment of request.a_payments
				total_a_sum += parseFloat(apayment.sum) if !apayment.is_deleted
			total_b_sum = 0
			for index, bpayment of request.b_payments
				total_b_sum += parseFloat(bpayment.sum) if !bpayment.is_deleted

			if total_a_sum != total_b_sum 
				request.sum = total_b_sum + ' / ' + total_a_sum 
				request.is_changed = true
			else
				request.sum = total_a_sum


		$scope.togglePayments = (request)->
			request.is_bpayments_visible = !request.is_bpayments_visible;
			request.is_visible = true


#=========================================================================================== B

		$scope.setbaccount = (bpayment, baccountid) ->
			bpayment.b_account = baccountid
			bpayment.is_changed = true

		$scope.addBpayment = (request)->
			request.is_visible = true
			request.b_payments.push({
				'b_account': '1',
				'sum_allowed': '0.00',
				'sum_rest': '0.00',
				'sum': '0.00',
				'recipient': 'Введите получателя',
				'detail': 'Назначение платежа',
				'note': '',
				'is_new': true,
				'is_changed': true
			})

		$scope.removeBpayment = (b_payment, request) ->
			b_payment.is_deleted = !b_payment.is_deleted
			b_payment.is_changed = true

		$scope.saveBpayment = (b_payment, request)->
			save_payment(b_payment, 'bpayments', request)
			refresh_request_sum( request )			

		$scope.baccount_changed = ( new_baccount, bpayment ) ->
			bpayment.sum_allowed = new_baccount.plan
			bpayment.sum_rest = new_baccount.plan-new_baccount.fact
			bpayment.is_changed = true

#============================================================================================== A
		$scope.addApayment = (request)->
			request.a_payments.push({
				'payer': 'Наименование плательщика',
				'payer_account': 'Счет плат.',
				'payer_mfo': 'МФО банка плат.',
				'recipient': 'Наименование получателя',
				'detail': 'Введите назначение платежа',
				'recipient_account': 'Счет получ.',
				'recipient_bank': 'Наименов. банка получ.',
				'recipient_mfo': 'МФО банка получ.',
				'recipient_egrpou': 'ЕГРПОУ получ.',
				'sum': '0.00',
				'is_new': true,
				'is_changed': true
			})	

		$scope.removeApayment = (a_payment, request) ->
			a_payment.is_deleted = !a_payment.is_deleted
			a_payment.is_changed = true

		$scope.saveApayment = (a_payment, request)->
			a_payment.id = save_payment(a_payment, 'apayments', request).id
			refresh_request_sum( request )


#============================================================================================= R
		$scope.addRequest = (requests)->
			date = $filter('date')($scope.date_to, "dd.MM.yyyy")
			requests.push({
				'date': date,
				'project_name': 'введите проект',
				'sum': '0.00',
				'is_approved': false,
				'b_payments': [],
				'a_payments': [],
				'is_visible': false,
				'is_bpayments_visible': true,
				'is_new': true,
				'is_changed': true
			})

		$scope.saveRequest = (request)->
			request.is_changed = false
			alert('saved Request '+request.id)

		$scope.removeRequest = (request)->
			request.is_deleted = !request.is_deleted
			request.is_changed = true
	])

#=================================================================================================      DIRECTIVES


	.directive('bpaymentshere', ()->
		{
			restrict: 'E',
			templateUrl: 'bpayments_tplt.html'
		}
	)

	.directive('apaymentshere', ()->
		{
			restrict: 'E',
			templateUrl: 'apayments_tplt.html'
		}
	)

	.directive 'myeditablecell', ->
		{
			scope: {
				myeditablecell: "="
				};
			link: (scope, elm, attrs, ctrl) ->
				elm.bind 'blur', ->
					elm.addClass 'no_border'
				elm.bind 'focus', ->
					elm.removeClass 'no_border'
				elm.bind 'keydown', (event) ->
					scope.myeditablecell.is_changed = true

				scope.$watch('myeditablecell.is_deleted', (d)->
					elm.addClass 'deleted' if d
					elm.removeClass 'deleted' if !d
				)
				

		}


# Интересная штука редактировать нередактируемые тэги, например, <div>
	# .directive 'contenteditable', ->
 #  {
 #    require: 'ngModel'
 #    link: (scope, elm, attrs, ctrl) ->
 #      # view -> model
 #      elm.bind 'blur', ->
 #        scope.$apply ->
 #          ctrl.$setViewValue elm.html()
 #        elm.addClass('no_border')

 #      # model -> view
 #      ctrl.render = (value) ->
 #        elm.html value
 #        return

 #      elm.bind 'keydown', (event) ->
 #        console.log 'keydown ' + event.which
 #        esc = event.which == 27
 #        el = event.target
 #        if esc
 #          console.log 'esc'
 #          ctrl.$setViewValue elm.html()
 #          el.blur()
 #          event.preventDefault()
 #        return

 #      elm.bind 'focus', ->
 #      	elm.removeClass('no_border')
 #  }


#		$scope.clickExpandBpayments = (to_show) ->
#			$scope.rowCollection[to_show].is_visible = true


#		$scope.rowCollection = tabledata.data;
		# $scope.displayedCollection = [].concat($scope.rowCollection);


# #оставил просто как пример итерации по своему массиву
# tabledata.prepare =->
# 	for element in this.data
# 		if element.is_approved
# 		then element.is_approved_rus = 'да' 
# 		else element.is_approved_rus = 'нет' 

