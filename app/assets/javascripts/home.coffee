app = angular.module('payments',[
	'ngResource',
	'ngTable',
	'controllers'
]);

controllers = angular.module('controllers',[])
controllers.controller("PaymentsListController", [ '$scope', 'NgTableParams'
	($scope, NgTableParams)->
		self = this;
		tabledata = [{name: "Moroni", age: 50},{name: "Lorem", age: 51},{name: "Ipsum", age: 52}];
		self.tableParams = new NgTableParams({}, { dataset: tabledata});
		self.test = 'tteesstt';
]);

