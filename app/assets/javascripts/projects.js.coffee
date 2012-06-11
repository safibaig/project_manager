# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	
	$('#project_client_id').tokenInput("/clients.json", {
		crossDomain: false
		tokenLimit: 1
		propertyToSearch: "company_name"
		theme: "facebook",
		hintText: "Type a client"
		prePopulate: $('#project_client_id').data('client')
	})
	
	$('#project_business_unit_id').tokenInput("/business_units.json", {
		crossDomain: false
		tokenLimit: 1
		theme: "facebook"
		hintText: "Type a business unit"
		prePopulate: $('#project_business_unit_id').data('business_unit')
	})
	
	$('#project_user_id').tokenInput("/users.json", {
		crossDomain: false
		tokenLimit: 1
		theme: "facebook"
		hintText: "Type a sales rep"
		prePopulate: $('#project_user_id').data('sales-rep')
	})
	
	$('#project_project_manager_id').tokenInput("/users.json", {
		crossDomain: false
		tokenLimit: 1
		theme: "facebook"
		hintText: "Type a project manager"
		prePopulate: $('#project_project_manager_id').data('pm')
	})
	
	$('#project_supplier_tokens').tokenInput("/suppliers.json", {
		crossDomain: false
		theme: "facebook"
		hintText: "Type the suppliers"
		prePopulate: $('#project_supplier_tokens').data('suppliers')
		propertyToSearch: "company_name"
		preventDuplicates: true
	})
	
	$('#project_employee_tokens').tokenInput("/users.json", {
		crossDomain: false
		theme: "facebook"
		hintText: "Type the employees"
		prePopulate: $('#project_employee_tokens').data('employees')
		preventDuplicates: true
	})
	
	$(".calendar").datepicker({
		dateFormat: "yy-mm-dd"
	})
	
$(".project_link").tooltip('hide')	
