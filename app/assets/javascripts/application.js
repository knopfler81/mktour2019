//= require turbolinks
//= require jquery
//= require rails-ujs
//= require_tree .

$(document).on('turbolinks:load', function() {

		$('#going').on('click', function(){
			location.reload();
		})

		$('#not-going').on('click', function(){
			location.reload();
		})
});