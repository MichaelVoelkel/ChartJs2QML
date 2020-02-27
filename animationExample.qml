/*!
 * Elypson's Chart.qml adaptor to Chart.js
 * (c) 2020 ChartJs2QML contributors (starting with Elypson, Michael A. Voelkel, https://github.com/Elypson)
 * Released under the MIT License
 */

 import QtQuick 2.0
 import QtQuick.Window 2.0
 import "Chart.js" as Chart

 Window {
     id: myWindow
     width: 800
     height: 800

     function generateData() {
         var result = [];
         for(var i = 0; i < 10; ++i) {
             result[i] = Math.random().toFixed(2);
         }
         return result;
     }

     Chart {
         id: chart
         chartType: 'bar'
         animationEasingType: Easing.Linear
         animationDuration: 200
         chartData: {
             return {
                 labels: [1,2,3,4,5,6,7,8,9,10],
                 datasets: [{
                     label: 'One dataset',
                     xAxisId: 'x-axis-1',
                     yAxisId: 'y-axis-1',
                     backgroundColor: 'rgba(255, 192, 192, 0.8)',
                     borderColor: 'rgba(255,0,0,1)',
                     borderWidth: 1,
                     data: myWindow.generateData()
                 }]
             }
         }

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
                         id: 'x-axis-1',
                         gridLines: {
                             zeroLineColor: 'rgba(0,0,0,1)'
                         }
                     }],
                     yAxes: [{
                         display: true,
                         position: 'left',
                         id: 'y-axis-1',
                         ticks: {
                             min: 0,
                             max: 1,
                             stepSize: 0.1
                         }
                     }]
                 }
             }
         }

         anchors {
             fill: parent
             bottomMargin: 50
         }
     }
     Rectangle {
         anchors {
             horizontalCenter: parent.horizontalCenter
             bottom: parent.bottom
             topMargin: 5
             bottomMargin: 5
         }
         height: 40
         width: parent.width * 0.6
         color: "#eee"
         border.color: "#999"

         MouseArea {
             anchors.fill: parent
             onClicked: {
                 chart.chartData.datasets[0].data = myWindow.generateData();
                 chart.animateToNewData();
             }
         }

         Text {
             anchors.horizontalCenter: parent.horizontalCenter
             anchors.verticalCenter: parent.verticalCenter
             text: "Randomize data"
         }
     }
 }
