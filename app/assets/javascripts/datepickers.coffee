angular
	.module('datepickers', [])
	.directive('datepickershere', ()->
		{
			restrict: 'E',
			scope: {
        'datefrom': "=",
        'dateto': "=",
        'warnmessage': "=",
        'callback': "&"
			},

			templateUrl: 'datepickers_tplt.html',
			# а можно бы было и через контроллер:
			# controller: 'datepickersCtrl'
			link: (scope, elm, attrs, ctrl) ->
				scope.dateOptions =
					startingDay: 1

				scope.calendar1 =
					opened: false
				scope.calendar2 =
					opened: false

				scope.open_calendar1 = ()->
					scope.calendar1.opened = true;
				scope.open_calendar2 = ()->
					scope.calendar2.opened = true;

				scope.calendar_ok = (d1,d2)->
					bootbox.confirm( scope.warnmessage	, (result) ->
						if result == true
							scope.datefrom = d1 if d1
							scope.dateto = d2 if d2
							scope.callback({date_from: d1, date_to: d2})
					)
					return true								

		}
	)

	# А так можно сделать для директивы свой контроллер, но он будет работать с родительским скопом.
	# во всяком случае, этот будет работать с родительским скопом. МОжет, можно и изолировать, но я решил
	# сделать через link, что вроде бы каноничнее.

	# .controller("datepickersCtrl", [ '$scope',	($scope)->
			
	# 	$scope.dateOptions =
	# 		startingDay: 1

	# 	$scope.calendar1 =
	# 		opened: false
	# 	$scope.calendar2 =
	# 		opened: false

	# 	$scope.open_calendar1 = ()->
	# 		$scope.calendar1.opened = true;
	# 	$scope.open_calendar2 = ()->
	# 		$scope.calendar2.opened = true;

	# 	$scope.calendar_ok = (d1,d2)->
	# 		bootbox.confirm( "Изменить интервал? (все несохраненные изменнеия будут потяряны!)"	, (result) ->
	# 			if result == true
	# 				$scope.date_from = d1 if d1
	# 				$scope.date_to = d2 if d2
	# 				$scope.fetch_requests(d1, d2)
	# 		)
	# 		return true				
	# ])

