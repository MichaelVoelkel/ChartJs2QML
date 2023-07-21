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

    function linear(min,max,formula) {
        var A = Math.abs(min) + max;
        console.log('A: ' + A);
        var x = 0
        var C = [];
        var z =  min;
        while (x <= A) {
          var t = eval(formula);
          console.log(t);
          C.push( { 'x': z , 'y': t.toFixed(2)  }) ;
          z+= .1;
          x+= .1;
        }
        console.log(C);
        return C;
  }

	function randomScalingFactor() {
		return Math.random().toFixed(1);
	}

	Item {
		id: chart
		anchors.fill: parent
		Chart {
            animationDuration: 0
		    anchors.fill: parent
			chartType: 'scatter'
			chartData: { return {
					datasets: [{
						label: 'Math.sin(x)',
						xAxisID: 'x-axis-1',
						yAxisID: 'y-axis-1',
						borderColor: '#ff5555',
						backgroundColor: 'rgba(255,192,192,0.3)',
                        showLine: true,
                        fill: true,
                        data: linear(0,4,'Math.sin(x)'),
					}, {
						label: 'Math.tan(x)',
						xAxisID: 'x-axis-1',
						yAxisID: 'y-axis-2',
						borderColor: '#5555ff',
						backgroundColor: 'rgba(192,192,255,0.3)',
                        showLine: true,
                        fill:false,
                        data: linear(0,4,'Math.tan(x)'),
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
							gridLines: { zeroLineColor: 'rgba(0,0,0,1)' }
						}],
						yAxes: [{
							type: 'linear', display: true, position: 'left',
							id: 'y-axis-1',
						}, {
							type: 'linear', display: true, position: 'right', reverse: true,
							id: 'y-axis-2',

							// grid line settings
							gridLines: {
								drawOnChartArea: false, // only want the grid lines for one axis to show up
							},
						}],
					}
				}
			}

		}

	}
}
