# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	$("#container").highcharts({
		chart:
			type: 'spline'
		title:
			text: 'NFL Rankings'
		xAxis:
			categories: ['Week 1', 'Week 2', 'Week 3']
		yAxis:
			title:
				text: 'Rank'
			reversed: true
		series: [{
			name: 'Bears'
			data: [1,2,4,3]
		}, {
			name: 'Packers'
			data: [4,3,1,2]
		}]

	})