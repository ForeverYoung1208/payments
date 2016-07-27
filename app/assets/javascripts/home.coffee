angular
	.module('budget',['requests'])
	.controller("HomeController", [ '$scope',
	($scope)-> 
		$scope.activeMenu = 1;
		
		$scope.isActive = (current)->
			current == $scope.activeMenu;
		
		$scope.clickMenu = (clicked)->
			$scope.activeMenu = clicked;
			$scope.isCollapsed = true;

	]);
