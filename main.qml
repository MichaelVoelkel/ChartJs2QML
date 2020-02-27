/*!
 * Elypson's Chart.qml adaptor to Chart.js
 * (c) 2020 ChartJs2QML contributors (starting with Elypson, Michael A. Voelkel, https://github.com/Elypson)
 * Released under the MIT License
 */

import QtQuick 2.0
import QtQuick.Window 2.0
import "Chart.js" as Chart

Window
{
	id: theWindow
	width: 800
	height: 800

	function randomScalingFactor() {
		return Math.random().toFixed(1);
	}

	Item {
		id: grid
		anchors.fill: parent

		Chart {
			chartType: 'scatter'
			chartData: {
				return {
					datasets: [{
						label: 'My First dataset',
						xAxisID: 'x-axis-1',
						yAxisID: 'y-axis-1',
						borderColor: '#ff5555',
						backgroundColor: 'rgba(255,192,192,0.3)',
						data: [{
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}, {
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}, {
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}, {
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}, {
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}, {
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}, {
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}]
					}, {
						label: 'My Second dataset',
						xAxisID: 'x-axis-1',
						yAxisID: 'y-axis-2',
						borderColor: '#5555ff',
						backgroundColor: 'rgba(192,192,255,0.3)',
						data: [{
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}, {
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}, {
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}, {
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}, {
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}, {
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}, {
							x: theWindow.randomScalingFactor(),
							y: theWindow.randomScalingFactor(),
						}]
					}]
				}}
			chartOptions: {return {
					maintainAspectRatio: false,
					responsive: true,
					hoverMode: 'nearest',
					intersect: true,
					title: {
						display: true,
						text: 'Chart.js Scatter Chart - Multi Axis'
					},
					scales: {
						xAxes: [{
							position: 'bottom',
							gridLines: {
								zeroLineColor: 'rgba(0,0,0,1)'
							}
						}],
						yAxes: [{
							type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
							display: true,
							position: 'left',
							id: 'y-axis-1',
						}, {
							type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
							display: true,
							position: 'right',
							reverse: true,
							id: 'y-axis-2',

							// grid line settings
							gridLines: {
								drawOnChartArea: false, // only want the grid lines for one axis to show up
							},
						}],
					}
				}
			}

			anchors {
				left: parent.left
				top: parent.top
				right: parent.horizontalCenter
				bottom: parent.verticalCenter
			}
		}

		Chart {
			id: canvasBars
			chartType: "bar"

			anchors {
				left: parent.horizontalCenter
				top: parent.top
				right: parent.right
				bottom: parent.verticalCenter
			}

			chartData: { return {
					labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
					datasets: [{
						label: 'Dataset 1',
						backgroundColor: '#ff9999',
						stack: 'Stack 0',
						data: [
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor()
						]
					}, {
						label: 'Dataset 2',
						backgroundColor: '#9999ff',
						stack: 'Stack 0',
						data: [
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor()
						]
					}, {
						label: 'Dataset 3',
						backgroundColor: '#99ff99',
						stack: 'Stack 1',
						data: [
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor()
						]
					}]
				}
			}

			chartOptions: { return {
					maintainAspectRatio: false,
					title: {
						display: true,
						text: 'Chart.js Bar Chart - Stacked'
					},
					tooltips: {
						mode: 'index',
						intersect: false
					},
					responsive: true,
					scales: {
						xAxes: [{
							stacked: true,
						}],
						yAxes: [{
							stacked: true
						}]
					}
				}
			}
		}

		Chart {
			id: canvasPie
			anchors {
				left: parent.left
				top: parent.verticalCenter
				right: parent.horizontalCenter
				bottom: parent.bottom
			}

			chartType: "pie"

			chartData: {return {
						datasets: [{
							data: [
								theWindow.randomScalingFactor(),
								theWindow.randomScalingFactor(),
								theWindow.randomScalingFactor(),
								theWindow.randomScalingFactor(),
								theWindow.randomScalingFactor(),
							],
							backgroundColor: [
								'#ffbbbb',
								'#ffddaa',
								'#ffffbb',
								'#bbffbb',
								'#bbbbff'
							],
							label: 'Dataset 1'
						}],
						labels: [
							'Red',
							'Orange',
							'Yellow',
							'Green',
							'Blue'
						]
					}}

			chartOptions: {return {maintainAspectRatio: false, responsive: true}}
		}

		Chart {
			anchors {
				left: parent.horizontalCenter
				top: parent.verticalCenter
				right: parent.right
				bottom: parent.bottom
			}
			chartType: 'line'

			chartData: { return {
					labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
					datasets: [{
						label: 'Filled',
						fill: true,
						backgroundColor: 'rgba(192,222,255,0.3)',
						borderColor: 'rgba(128,192,255,255)',
						data: [
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor()
						],
					}, {
						label: 'Dashed',
						fill: false,
						backgroundColor: 'rgba(0,0,0,0)',
						borderColor: '#009900',
						borderDash: [5, 5],
						data: [
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor()
						],
					}, {
						label: 'Filled',
						backgroundColor: 'rgba(0,0,0,0)',
						borderColor: '#990000',
						data: [
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor(),
							theWindow.randomScalingFactor()
						],
						fill: false,
					}]
				}
			}

			chartOptions: {return {
					maintainAspectRatio: false,
					responsive: true,
					title: {
						display: true,
						text: 'Chart.js Line Chart'
					},
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: 'Month'
							}
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: 'Value'
							}
						}]
					}
				}
			}
		}
	}
}
