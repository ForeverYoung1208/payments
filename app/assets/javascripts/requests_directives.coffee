angular
	.module('payments_directives', [])
	.directive('bpaymentshere', ()->
		{
			restrict: 'E',
			templateUrl: 'bpayments_tplt.html'
		}
	)

	.directive('apaymentshere', ()->
		{
			restrict: 'E',
			templateUrl: 'apayments_tplt.html'
		}
	)

	.directive 'myeditablecell', ->
		{
			scope: {
				myeditablecell: "="
				};
			link: (scope, elm, attrs, ctrl) ->
				elm.bind 'blur', ->
					elm.addClass 'no_border'
				elm.bind 'focus', ->
					elm.removeClass 'no_border'
				elm.bind 'keydown', (event) ->
					scope.myeditablecell.is_changed = true

				scope.$watch('myeditablecell.is_deleted', (d)->
					elm.addClass 'deleted' if d
					elm.removeClass 'deleted' if !d
				)
				

		}

	.directive('datepickershere', ()->
		{
			restrict: 'E',
			templateUrl: 'datepickers_tplt.html',
			controller: ''
		}
	)
