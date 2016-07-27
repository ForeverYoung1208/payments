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



#прикольно,ангуляр фильтр работает )))
#выделим их в отдельный модуль
#angular.module('filters',[])

angular.module('filters',[])
	.filter('rusBoolean',->
		(input)->
			if input
			then 'да'
			else 'нет'
)