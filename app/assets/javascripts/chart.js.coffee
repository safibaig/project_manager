$ ->
	convert_array_elements_to_integers = (string)->
		array = string.split(",")
		array.map (i)->
			parseInt(i, 10)
	
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
					  s = '' + this.x + ': ' + this.y
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
	
	#BusinessUnits
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
					  s = '' + this.x + ': ' + this.y
					s
			}
			labels: {
				items: [{
					html: "Total projects | #{$('#business_units_graph').data('total-count')}"
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
					name: 'Lost Projects'
					data: convert_array_elements_to_integers $('#business_units_graph').data('lost')
				}
				{
					type: 'column'
					name: 'Potential Projects'
					data: convert_array_elements_to_integers $('#business_units_graph').data('potential')
				}
				{
					type: 'column'
					name: 'Billed Projects'
					data: convert_array_elements_to_integers $('#business_units_graph').data('billed')
				}
				{
					type: 'column'
					name: 'Paid Projects'
					data: convert_array_elements_to_integers $('#business_units_graph').data('paid')
				}
				{
					type: 'pie'
					name: "Total Projects"
					data:[
						{
							name: 'Business Planning'
							y: $('#business_units_graph').data('bp-count')
							color: '#dddf0d'
						}
						{
							name: 'Graphic Design'
							y: $('#business_units_graph').data('gd-count')
							color: '#7798bf'
						}
						{
							name: 'Industrial Design'
							y: $('#business_units_graph').data('id-count')
							color: '#55bf3b'
						}
						{
							name: 'Software'
							y: $('#business_units_graph').data('software-count')
							color: '#df5353'
						}
						{
							name: 'Research & Development'
							y: $('#business_units_graph').data('rd-count')
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