//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {

		$('#going').on('click', function(){
			location.reload();
		})

		$('#not-going').on('click', function(){
			location.reload();
		})

 

});


$(document).ready(function () {
   jQuery(".best_in_place").best_in_place();
});
