# ChartJs2QML
This is a QML adaptor for Chart.js 2.9.3 that supports startup animations and tooltips.

## Getting started

You can just import Chart.qml and use it with `chartType`, `chartData` and `chartOptions` to generate a chart. For testing, just clone this repository and run

    qmlscene main.qml
    
assuming that you have `bin` of Qt in your path variable. Otherwise, start `main.qml` in any other way. The result should look like this:

![Output of main.qml on MacOS](example.png)

## Animation of changes

We have added the possibility to change data and animate to changed data. The file `animationExample.qml` can be started to see how it works. Just update the corresponding `chartData` property of `Chart` and then call its function `animateToNewData`. Graphs are not rebuilt but rather data is just updated within Chart.js, which is convenient in terms of resource-usage and performance.

## Notes

We directly adapt Chart.js of version 2.9.3 and for using data and options, we refer to all the examples that can be found there: https://www.chartjs.org

For using it with QML, we have changed Chart.js at many places that we have pointed out at the top of Chart.js. Note that the idea for modifications are inspired by Shuirna (https://github.com/shuirna) and their changes were inspired by Julien Wintz.

Also note that we do not guarantee that this adaptor works. We have not tested all different Chart.js charts. We might or might not extend or modify this adaptor. Feel free to provide pull requests if you would like to improve this adaptor.

As of now, there are a few known flaws:
* dashed line in legend for dashed plots switches around between dashed and solid during resize/animation

We hope that this little package might help you with your projects!
