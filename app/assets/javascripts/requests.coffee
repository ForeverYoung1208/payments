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

		$scope.getAPayments = (requestId)->
			RequestOne = $resource('/requests/:requestId/aPayments', { requestId, format: 'json' },
			{ 
				'query':  {method:'GET', isArray:true},
				'save':   {method:'PUT'},
				'create': {method:'POST'}
			});

			RequestOne.query( (results) ->
				$scope.rowCollection[requestId].APayments = results
			);




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

