//= require jquery3
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree 

$(document).on('turbolinks:load', function() {

		$('#going').on('click', function(){
			location.reload();
		})

		$('#not-going').on('click', function(){
			location.reload();
		})
		
	$("tr").click(function() {
	  window.location = $(this).data("link")
	})

});

