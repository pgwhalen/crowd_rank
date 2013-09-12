# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	$("#teams").sortable({
		cancel: ".already-ranked"
	})

	$("#rank_button").click ->
		ranks = $("#teams").sortable("toArray")
		ranks = $(".list-group-item")
		rankings_json = {}
		actual_rank = 0
		for rank in ranks
			actual_rank++
			team_id = rank.id.split(" ")[1]
			comment = "comment"
			rank_data = 
				rank: actual_rank
				comment: comment
			rankings_json[team_id] = rank_data

		$('<input>').attr({
			type: 'hidden'
			id: 'json'
			name: 'ranking_json'
			value: JSON.stringify(rankings_json)
		}).appendTo('#ranking_form')
		rankings_json