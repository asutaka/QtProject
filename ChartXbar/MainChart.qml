import QtQuick 2.0
import QtCharts 2.1
import ControlApp 1.0
Item {
    id:mainChart
    property var lastValue
    property int currentIndex: -1
    property color lineChartColor: "#fed49f"
    property var lineTitle: txtLineTitle
    property string lineTitle2: "Line X-Bar"
    property int newPointNumber: 200
    property int maxPointNumber: 250
    property bool isPress: false
    property int distanceTickCount: newPointNumber/valueAxisXx.tickCount;

    signal genData()

    ChartView {
        id: chartView
        x:10
        width: 712
        height: 250
        animationOptions: ChartView.NoAnimation
        antialiasing: true
        backgroundColor: "transparent"
        clip: true

        //Draw border plotArea
        Rectangle{
            id: borderPlotArea
            x: 30
            y: 73
            width: 653
            height: 130
            color: "transparent"
            border.color: "gray"
        }

        SplineSeries{
            axisX: CategoryAxis{
                id: valueAxisXx
                min: 0
                max: 200
                gridVisible: false
                labelsPosition:CategoryAxis.AxisLabelsPositionOnValue
                labelsColor : "white"
                labelsFont.pixelSize: 11
                CategoryRange{
                    label: "0"
                    endValue: 0.5
                }
                CategoryRange{
                    label: (distanceTickCount*1).toString()
                    endValue: distanceTickCount*1
                }
                CategoryRange{
                    label: (distanceTickCount*2).toString()
                    endValue: distanceTickCount*2
                }
                CategoryRange{
                    label: (distanceTickCount*3).toString()
                    endValue: distanceTickCount*3
                }
                CategoryRange{
                    label: (distanceTickCount*4).toString()
                    endValue: distanceTickCount*4
                }
                CategoryRange{
                    label: (distanceTickCount*5).toString()
                    endValue: distanceTickCount*5
                }
            }
            axisY:
                ValueAxis {
                id:valueAxisY
                visible: false
                min: 0
                max: 300
                tickCount:6
                gridLineColor:"#585858"
                minorGridVisible: false
                gridVisible: false
                labelsVisible: false
                labelFormat: "%i"
            }
        }


        MouseArea {
            anchors.fill: parent
            property int lastX: 0
            property int lastY: 0
            onPressed: {
                lastX = mouse.x
                lastY = mouse.y
            }
            onDoubleClicked: {
                isPress = !isPress
                if(isPress){
                    rectBounder.visible = true
                }
                else{
                    if(currentIndex >chartView.axisX().max -2){
                        rectBounder.visible = false
                        chartView.axisX().min = currentIndex - (newPointNumber -2)
                        chartView.axisX().max = currentIndex + 2
                        chartView.update()
                    }
                    else{
                        rectBounder.visible = false
                    }

                }
            }
            onPositionChanged: {
                if(rectBounder.visible == true)
                {
                    var factorX =chartView.width/newPointNumber
                    if (lastX > mouse.x && (currentIndex-chartView.axisX().max) > -2) {
                        // scroll right  to left
                        if (currentIndex > newPointNumber) {
                            chartView.scrollLeft(-factorX*5)
                            chartView.axisX().min = chartView.axisX().max - newPointNumber
                        }
                        else {
                            chartView.axisX().max = newPointNumber;
                            chartView.axisX().min = 0;
                        }
                        lastX = mouse.x
                    }
                    // scroll left to right
                    else if(lastX < mouse.x && currentIndex < maxPointNumber){
                        if (currentIndex > newPointNumber && currentIndex -newPointNumber < chartView.axisX().min) {
                            chartView.scrollRight(-factorX*5)
                            chartView.axisX().min = chartView.axisX().max - newPointNumber;
                        }
                        else {
                            chartView.axisX().max = newPointNumber;
                            chartView.axisX().min = 0;
                        }
                        lastX=mouse.x
                    }
                    else if(currentIndex > maxPointNumber && (currentIndex -maxPointNumber) < (chartView.axisX().min )){
                        chartView.scrollRight(-factorX*5)
                        chartView.axisX().min = chartView.axisX().max - newPointNumber;
                        lastX=mouse.x
                    }
                }
                else{

                }
            }
        }
    }

    Text {
        x: 370
        y: 40
        id: txtLineTitle
        text: lineTitle2
        color: "white"
        font.pixelSize: 15
    }

    Rectangle{
        id:rectBounder
        visible: false
        x: 25
        y: 33
        width: 680
        height: 190
        color: "transparent"
        border.color: "lightblue"
        border.width: 2

    }

    Component.onCompleted: {
        genData()
    }

    function timerTrigger() {
        currentIndex++;
        var lineSeries = chartView.series("");

        if (!lineSeries) {
            lineSeries = chartView.createSeries(ChartView.SeriesTypeSpline, "", valueAxisXx, valueAxisY);
        }
        lineSeries.color=lineChartColor

        if(currentIndex > maxPointNumber){

            lineSeries.remove(0)
        }
        lineSeries.append(currentIndex, lastValue)
        if (currentIndex > newPointNumber - 2) {
            chartView.axisX().max+= 1
            chartView.axisX().min = chartView.axisX().max - newPointNumber;
            chartView.antialiasing = true

            //Calculates the distance of two points on the x-axis
            if(currentIndex === (newPointNumber - 1)){
                distanceTickCount = newPointNumber/valueAxisXx.tickCount;
            }
            // Append tickcount on the x-axis
            if(currentIndex %distanceTickCount === 0){
                valueAxisXx.append(currentIndex, currentIndex);
                valueAxisXx.remove(currentIndex-distanceTickCount*7);
            }
        }
        else {
            chartView.axisX().max = newPointNumber;
            chartView.axisX().min = 0;
        }
    }
}


