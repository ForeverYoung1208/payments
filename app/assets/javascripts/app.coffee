angular.module('payments',[
	'ngResource',
	'filters',
	'smart-table',
	'ngAnimate',
	'ui.bootstrap'
]);

#прикольно,ангуляр фильтр работает )))
#выделим их в отдельный модуль
angular.module('filters',[])
angular
	.module('filters')
	.filter('rusBoolean',->
		(input)->
			if input
			then 'да'
			else 'нет'
)