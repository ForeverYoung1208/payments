app = angular.module('payments',[
	'ngResource',
	'controllers'
]);

controllers = angular.module('controllers',[])
controllers.controller("PaymentsListController", [ '$scope',
	($scope)->
		$scope.activeMenu = 1;
		$scope.isActive = (current)->
			current == $scope.activeMenu;
		$scope.clickMenu = (clicked)->
			$scope.activeMenu = clicked;
		$scope.rowCollection = tabledata;
]);

tabledata= [
	{name: "Moroni", age: 50},
	{name: "Lorem", age: 51},
	{name: "Ipsum", age: 52}
];