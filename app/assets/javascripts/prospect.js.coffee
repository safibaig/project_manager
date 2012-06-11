# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	
	$('#prospect_business_unit_tokens').tokenInput("/business_units.json", {
		crossDomain: false,
		prePopulate: $('#prospect_business_unit_tokens').data("interests"),
		theme: "facebook",
		preventDuplicates: true,
		tokenLimit: 5,
		hintText: "Type an interest"
	})
	
	$('.prospect_link').tooltip('hide')
