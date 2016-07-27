angular.module('requests',[
	'ngResource',
	'filters',
	'smart-table',
	'ngAnimate',
	'ui.bootstrap',
	'templates',
	'ui.select', 
	'ngSanitize',
	'datepickers'
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