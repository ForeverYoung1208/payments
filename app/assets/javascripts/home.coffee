app = angular.module('payments',[
	'ngResource',
	'controllers',
	'filters',
	'smart-table'
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
		$scope.displayedCollection = [].concat($scope.rowCollection);
]);

tabledata = {}
tabledata.data= [
	{ 
		date: "11.12.2015"
		project_name: "ISR"
		sum: "100.01"
		is_approved: true
		created_at: "09.12.2015"
		updated_at: "10.12.2015"		
	},{ 
		date: "11.11.2015"
		project_name: "CPR"
		sum: "101.11"
		is_approved: false
		created_at: "09.12.2015"
		updated_at: "10.12.2015"		
	},{ 
		date: "11.10.2015"
		project_name: "Архив ЦИК"
		sum: "102.21"
		is_approved: true
		created_at: "09.12.2015"
		updated_at: "10.12.2015"		
	}
];

#оставил просто как пример итерации по своему массиву
tabledata.prepare =->
	for element in this.data
		if element.is_approved
		then element.is_approved_rus = 'да' 
		else element.is_approved_rus = 'нет' 

#прикольно,ангуляр фильтр работает )))
filters = angular.module('filters',[])
filters.filter('rusBoolean',->
	(input)->
		if input
		then 'да'
		else 'нет'
)
