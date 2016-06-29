angular
	.module('payments')
	.controller("PaymentsListController", [ '$scope', '$resource'
	($scope, $resource)->
		$scope.activeMenu = 1;
		
		$scope.isActive = (current)->
			current == $scope.activeMenu;
		
		$scope.clickMenu = (clicked)->
			$scope.activeMenu = clicked;
			$scope.isCollapsed = true;


		RequestAll = $resource('/requests', { format: 'json' },
		{ 
			'query':  {method:'GET', isArray:true},
			'save':   {method:'PUT'},
			'create': {method:'POST'}
		});

		RequestAll.query( (results) ->
			$scope.rowCollection = results
		);

		get_payments = (request, typePayments) ->
			r_id = request.id
			RequestOne = $resource('/requests/:r_id/:typePayments', { r_id, typePayments, format: 'json' },
			{ 
				'query':  {method:'GET'},
				'save':   {method:'PUT'},
				'create': {method:'POST'}
			});

			RequestOne.query( (results) ->
				request.a_payments = results.a_payments if typePayments == 'aPayments'
				request.b_payments = results.b_payments if typePayments == 'bPayments'
			);


		$scope.togglePayments = (request)->
			r_id = request.id
			if request.is_bpayments_visible
				get_payments(request, 'aPayments')
			if !request.is_bpayments_visible
				get_payments(request, 'bPayments')
			request.is_bpayments_visible = !request.is_bpayments_visible;
	  
		$scope.inlineOptions = 
	    showWeeks: true

	  $scope.dateOptions =
	    startingDay: 1

	  $scope.calendar1 =
	  	opened: false


	  $scope.open_calendar1 = () ->
	  	$scope.calendar1.opened = true;


	]);








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

