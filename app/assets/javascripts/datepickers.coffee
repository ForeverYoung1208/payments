angular
	.module('datepickers', [])
	.directive('datepickershere', ()->
		{
			restrict: 'E',
			templateUrl: 'datepickers_tplt.html',
			controller: 'datepickersCtrl'
		}
	)
	.controller("datepickersCtrl", [ '$scope',	($scope)->
			
		$scope.dateOptions =
			startingDay: 1

		$scope.calendar1 =
			opened: false
		$scope.calendar2 =
			opened: false

		$scope.open_calendar1 = ()->
			$scope.calendar1.opened = true;
		$scope.open_calendar2 = ()->
			$scope.calendar2.opened = true;

		$scope.calendar_ok = (d1,d2)->
			bootbox.confirm( "Изменить интервал? (все несохраненные изменнеия будут потяряны!)"	, (result) ->
				if result == true
					$scope.date_from = d1 if d1
					$scope.date_to = d2 if d2
					$scope.fetch_requests(d1, d2)
			)
			return true				
	])

