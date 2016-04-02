app = angular.module('payments',[
	'ngResource',
	'controllers',
	'filters',
	'smart-table',
	'ngAnimate',
	'ui.bootstrap'
]);



controllers = angular.module('controllers',[])
controllers.controller("PaymentsListController", [ '$scope', '$resource'
	($scope, $resource)->
		$scope.activeMenu = 1;
		
		$scope.isActive = (current)->
			current == $scope.activeMenu;
		
		$scope.clickMenu = (clicked)->
			$scope.activeMenu = clicked;
			$scope.isCollapsed = true;

		$scope.clickExpandBpayments = (to_show) ->
			$scope.rowCollection[to_show].is_visible = true

		Request = $resource('/requests/:requestId', { reqestId: "@id", format: 'json' },
		{ 
			'query':  {method:'GET', isArray:true},
			'save':   {method:'PUT'},
			'create': {method:'POST'}
		});

		Request.query( (results) ->
			$scope.rowCollection = results
		);

#		$scope.rowCollection = tabledata.data;
		# $scope.displayedCollection = [].concat($scope.rowCollection);
]);

#прикольно,ангуляр фильтр работает )))
filters = angular.module('filters',[])
filters.filter('rusBoolean',->
	(input)->
		if input
		then 'да'
		else 'нет'
)


# #оставил просто как пример итерации по своему массиву
# tabledata.prepare =->
# 	for element in this.data
# 		if element.is_approved
# 		then element.is_approved_rus = 'да' 
# 		else element.is_approved_rus = 'нет' 

