$ ->
	convert_array_elements_to_integers = (string)->
		array = string.split(",")
		array.map (i)->
			parseInt(i, 10)
	
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