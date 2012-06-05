$ ->
	convert_array_elements_to_integers = (string)->
		array = string.split(",")
		array.map (i)->
			parseInt(i, 10)
	
	convert_to_array = (string) ->
		array = string.split(",")
		array
	
	parse_pipe_array = (string) ->
		array = string.split("|")
		array.map(e) ->
			console.log(e.split(","))
	
	#Transforms the number into currency
	to_currency = (num) ->
		num = num.toString().replace(/\$|\,/g, '')
		if (isNaN(num)) 
			num = "0"
		sign = (num == (num = Math.abs(num)))
		num = Math.floor(num * 100 + 0.50000000001)
		cents = num % 100
		num = Math.floor(num / 100).toString()
		if (cents < 10) 
			cents = "0" + cents
		i = 0
		while Math.floor((num.length - (1 + i)) / 3) > i
			num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3))
			i++
		(((if sign then '-' else '')) + '$' + num + '.' + cents)
	
	#G0.0
	chart = ''
	$(document).ready ->
		chart = new Highcharts.Chart({
			chart: {
				renderTo: 'general_management'
			}
			title: {
				text: 'Project General Management'
			}
			xAxis: {
				categories: ['Lost Projects', 'Potential Projects', 'Billed Projects', 'Paid Projects']
			}
			yAxis: {
                min: 0,
                title: {
                    text: '# of Projects'
                }
            }
			tooltip: {
				formatter: ->
					s = ''
					if this.point.name
					  s = '' + this.point.name + ': ' + this.y + ' projects'
					else
					  s = '' + this.series.name + ': ' + this.y
					s
			}
			labels: {
				items: [{
					html: "Total projects | #{$('#general_management').data('total-count')}"
					style: {
						left:'40px'
						top: '8px'
						color: 'white'
					}
				}]
			}
			series: [
				{
					type: 'column'
					name: 'Business Planning'
					data: convert_array_elements_to_integers $('#general_management').data('business')
					
					
				}
				{
					type: 'column'
					name: 'Graphic Design'
					data: convert_array_elements_to_integers $('#general_management').data('gdesign')
				}
				{
					type: 'column'
					name: 'Industrial Design'
					data: convert_array_elements_to_integers $('#general_management').data('industrial')
				}
				{
					type: 'column'
					name: 'Software'
					data: convert_array_elements_to_integers $('#general_management').data('software')
				}
				{
					type: 'column'
					name: 'Research & Development'
					data: convert_array_elements_to_integers $('#general_management').data('rd')
				}
				{
					type: 'pie'
					name: "Total Projects"
					data:[
						{
							name: 'Business Planning'
							y: $('#general_management').data('bp-count')
							color: '#dddf0d'
						}
						{
							name: 'Graphic Design'
							y: $('#general_management').data('gd-count')
							color: '#7798bf'
						}
						{
							name: 'Industrial Design'
							y: $('#general_management').data('id-count')
							color: '#55bf3b'
						}
						{
							name: 'Software'
							y: $('#general_management').data('software-count')
							color: '#df5353'
						}
						{
							name: 'Research & Development'
							y: $('#general_management').data('rd-count')
							color: '#aaeeee'
						}
					]
					center: [100, 80]
					size: 100
					showInLegend: false
					dataLabels: {
						enabled: false
					}
				}
			]
		})
	
	#BusinessUnits G1.0
	chart = ''
	$(document).ready ->
		chart = new Highcharts.Chart({
			chart: {
				renderTo: 'business_units_graph'
			}
			title: {
				text: 'Business Units'
			}
			xAxis: {
				categories: ['Business Planning', 'Graphic Design', 'Industrial Design', 'Software', 'Research & Development']
			}
			yAxis: {
                min: 0,
                title: {
                    text: '# of Projects'
                }
            }
			tooltip: {
				formatter: ->
					s = ''
					if this.point.name
					  s = '' + this.point.name + ': ' + this.y + ' projects'
					else
					  s = '' + this.series.name + ': ' + this.y
					s
			}
			series: [
				{
					type: 'column'
					name: 'Lost Projects'
					data: convert_array_elements_to_integers $('#business_units_graph').data('lost')
					color: '#df5353'
				}
				{
					type: 'column'
					name: 'Potential Projects'
					data: convert_array_elements_to_integers $('#business_units_graph').data('potential')
					color: '#dddf0d'
				}
				{
					type: 'column'
					name: 'Billed Projects'
					data: convert_array_elements_to_integers $('#business_units_graph').data('billed')
					color: '#55bf3b'
				}
				{
					type: 'column'
					name: 'Paid Projects'
					data: convert_array_elements_to_integers $('#business_units_graph').data('paid')
					color: '#7798bf'
				}
			]
		})

	#G2.0
	chart = ''
	$(document).ready ->
		chart = new Highcharts.Chart({
			chart: {
				renderTo: 'employees_projects'
				type: 'column'
			}
			title: {
				text: 'Type of projects by employees'
			}
			xAxis: {
				categories: convert_to_array $('#employees_projects').data('employees')
			}
			yAxis: {
				min: 0
				title: {
					text: 'Total of projects'
				}
				stackLabels: {
					enabled: true
					style: {
						fontWeight: 'bold'
						color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
					}
				}
			}
			plotOptions: {
                column: {
                    stacking: 'normal'
                    dataLabels: {
                        enabled: false
                        color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                    }
                }
            }
			series: [
				{
					name: 'Business Planning'
					data: convert_array_elements_to_integers $('#employees_projects').data('employees-bp')
				}
				{
					name: 'Graphic Design'
					data: convert_array_elements_to_integers $('#employees_projects').data('employees-gd')
				}
				{
					name: 'Industrial Design'
					data: convert_array_elements_to_integers $('#employees_projects').data('employees-id')
				}
				{
					name: 'Software'
					data: convert_array_elements_to_integers $('#employees_projects').data('employees-software')
				}
				{
					name: 'Research & Development'
					data: convert_array_elements_to_integers $('#employees_projects').data('employees-rd')
				}
			]
		})
		
	#G2.1
	chart = ''
	$(document).ready ->
		chart = new Highcharts.Chart({
			chart: {
				renderTo: 'employees_projects_money'
				type: 'column'
			}
			title: {
				text: '$$ by Employee'
			}
			xAxis: {
				categories: convert_to_array $('#employees_projects_money').data('employees')
			}
			yAxis: {
				min: 0
				title: {
					text: 'Total of projects'
				}
				stackLabels: {
					enabled: true
					style: {
						fontWeight: 'bold'
						color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
					}
					formatter: ->
						to_currency this.total
				}
			}
			plotOptions: {
                column: {
                    stacking: 'normal'
                    dataLabels: {
                        enabled: false
                        color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                    }
                }
            }
			series: [
				{
					name: 'Business Planning'
					data: convert_array_elements_to_integers $('#employees_projects_money').data('employees-bp-money')
				}
				{
					name: 'Graphic Design'
					data: convert_array_elements_to_integers $('#employees_projects_money').data('employees-gd-money')
				}
				{
					name: 'Industrial Design'
					data: convert_array_elements_to_integers $('#employees_projects_money').data('employees-id-money')
				}
				{
					name: 'Software'
					data: convert_array_elements_to_integers $('#employees_projects_money').data('employees-software-money')
				}
				{
					name: 'Research & Development'
					data: convert_array_elements_to_integers $('#employees_projects_money').data('employees-rd-money')
				}
			]
		})

	chart = ''
	$(document).ready ->
		chart = new Highcharts.Chart({
			chart: {
				renderTo: 'business_unit_suppliers'
			}
			title: {
				text: 'Suppliers by Business Unit'
			}
			xAxis: {
				categories: ['Business Planning', 'Graphic Design', 'Industrial Design', 'Software', 'Research & Development']
			}
			yAxis: {
                min: 0,
                title: {
                    text: '# of Projects'
                }
            }
			tooltip: {
				formatter: ->
					s = ''
					if this.point.name
					  s = '' + this.point.name + ': ' + this.y + ' projects'
					else
					  s = '' + this.series.name + ': ' + this.y
					s
			}
			series: [
				{
					type: 'column'
					name: 'Business Planning'
					data:  [$('#business_unit_suppliers').data('bp')]

				}
				{
					type: 'column'
					name: 'Graphic Design'
					data:  [$('#business_unit_suppliers').data('gd')]
				}
				{
					type: 'column'
					name: 'Industrial Design'
					data:  [$('#business_unit_suppliers').data('id')]
				}
				{
					type: 'column'
					name: 'Software'
					data:  [$('#business_unit_suppliers').data('software')]
				}
				{
					type: 'column'
					name: 'Research & Development'
					data:  [$('#business_unit_suppliers').data('rd')]
				}
			]
		})