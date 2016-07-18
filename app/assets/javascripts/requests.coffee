angular
	.module('payments')
	.controller("PaymentsListController", [ '$scope', '$resource'
	($scope, $resource)->

#main menu functions			
		$scope.activeMenu = 1;

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

# requests and payments data management

		get_requests = ( date_from, date_to )->
			RequestAll = $resource('/requests', { date_from, date_to, format: 'json' },
			{ 
				'query':  {method:'GET', isArray:true},
				'save':   {method:'PUT'},
				'create': {method:'POST'}
			});

			RequestAll.query( (results) ->
				$scope.rowCollection = results
			);

		get_requests($scope.date_from, $scope.date_to)

		get_payments = (request, typepayments, date_from, date_to) ->
			r_id = request.id
			GetPayments = $resource('/requests/:r_id/:typepayments', { r_id, typepayments, date_from, date_to, format: 'json' },
			{ 
				'query':  {method:'GET'},
				'save':   {method:'PUT'},
				'create': {method:'POST'}
			});
			GetPayments.query( (results) ->
				request.a_payments = results.a_payments if typepayments == 'apayments'
				request.b_payments = results.b_payments if typepayments == 'bpayments'
			);

		save_payment = (payment, typepayments) ->
			id = payment.id
			Savepayment = $resource('/:typepayments/:id', { typepayments, id, format: 'json' },
			{ 
				'query':  {method:'GET'},
				'save':   {method:'PUT'},
				'create': {method:'POST'}
			});
			Savepayment.save( 
				payment, 
				(data) ->
					console.log 'success: ' + data.id
					payment.is_changed = false
				(err) ->
					bootbox.alert 'Сохранение не удалось: ' + err.status
					payment.is_changed = true

			)

			return true

		$scope.togglePayments = (request, date_from, date_to)->
			# r_id = request.id
			# if request.is_bpayments_visible
			# 	get_payments(request, 'apayments', date_from, date_to)
			# if !request.is_bpayments_visible
			# 	get_payments(request, 'bpayments', date_from, date_to)
			request.is_bpayments_visible = !request.is_bpayments_visible;
			request.is_visible = true


#========================== B
		$scope.addBpayment = (request)->
			request.is_visible = true
			request.b_payments.push({
				'b_acc_number': '0.00',
				'b_acc_name': 'Введите статью',
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
			save_payment(b_payment, 'bpayments')


#========================== A
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
			b_payment.is_deleted = !b_payment.is_deleted
			b_payment.is_changed = true

		$scope.saveApayment = (a_payment, request)->
			save_payment(a_payment, 'apayments')




		$scope.addRequest = (requests)->
			requests.push({
				'date': $scope.date_to,
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

