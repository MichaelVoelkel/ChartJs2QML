/*!
 * Elypson's Chart.qml adaptor to Chart.js
 * (c) 2020 ChartJs2QML contributors (starting with Elypson, Michael A. Voelkel, https://github.com/Elypson)
 * Released under the MIT License
 */

import QtQuick 2.0
import "Chart.bundle.js" as Chart

Canvas {
    id: root

    property var jsChart: undefined
    property string chartType
    property var chartData
    property var chartOptions

    MouseArea {
        id: event
        anchors.fill: root
        hoverEnabled: true
        enabled: true

        property QtObject mouseEvent: QtObject {
            property int left: 0
            property int top: 0
            property int x: 0
            property int y: 0
            property int clientX: 0
            property int clientY: 0
            property string type: ""
            property var target
        }

        property var handler: undefined;

        function submitEvent(mouse, type) {
            mouseEvent.type = type
            mouseEvent.clientX = mouse ? mouse.x : 0;
            mouseEvent.clientY = mouse ? mouse.y : 0;
            mouseEvent.x = mouse ? mouse.x : 0;
            mouseEvent.y = mouse ? mouse.y : 0;
            mouseEvent.left = 0;
            mouseEvent.top = 0;
            mouseEvent.target = root;

            handler(mouseEvent);

            root.requestPaint();
        }

        onClicked: {
            submitEvent(mouse, "click");
        }
        onPositionChanged: {
            submitEvent(mouse, "mousemove");
        }
        onExited: {
            submitEvent(undefined, "mouseout");
        }
        onEntered: {
            submitEvent(undefined, "mouseenter");
        }
        onPressed: {
            submitEvent(mouse, "mousedown");
        }
        onReleased: {
            submitEvent(mouse, "mouseup");
        }
    }

    property double chartAnimationProgress: 0.1

    PropertyAnimation {
        id: chartAnimator
        target: root
        property: "chartAnimationProgress"
        alwaysRunToEnd: true
        to: 1
        duration: 750
        easing.type: Easing.InOutExpo
    }

    onChartAnimationProgressChanged: {
        root.requestPaint();
    }

    onPaint: {
        if(jsChart === undefined) {
            var ctx = root.getContext('2d');

            jsChart = new Chart.build(ctx, {
                type: root.chartType,
                data: root.chartData,
                options: root.chartOptions
                });

            root.jsChart.bindEvents(function(newHandler) {event.handler = newHandler;});

            chartAnimator.start();
        }

        jsChart.draw(chartAnimationProgress);
    }

    function animateToNewData()
    {
        chartAnimationProgress = 0.1;
        jsChart.update();
        chartAnimator.restart();
    }

    onWidthChanged: {
        if(jsChart) {
            jsChart.resize();
        }
    }

    onHeightChanged: {
        if(jsChart) {
            jsChart.resize();
        }
    }
}
