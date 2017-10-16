import QtQuick 2.0
import QtCharts 2.0
import ControlApp 1.0

Item {
    id:mainChart
    width: 720
    height: 90
    property var valueY
    property int currentIndex: -1
    property color lineChartColor: "#fed49f"
    property string lineTitle2: "Line X-Bar"
    property int stickCountX: 10
    property bool isPress: false
    property Timer timerDraw
    property int setInterval: 1000
    signal genData()

    ChartView {
        id: chartView
        width: 720
        height: 90
        animationOptions: ChartView.SeriesAnimations
        antialiasing: true
        backgroundColor: "transparent"
        clip: true
        legend.visible: false
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
                    rectBounder.visible = false
                }
            }
            onPressAndHold: {
                isPress = !isPress
                if(isPress){
                    rectBounder.visible = true
                }
                else{
                    rectBounder.visible = false
                }
            }

            onPositionChanged: {
                if(rectBounder.visible === true)
                {
                    var factorX =chartView.width/stickCountX
                    if (lastX > mouse.x) {
                        if (currentIndex > stickCountX-3) {
                            chartView.axisX().min = chartView.axisX().max - stickCountX;
                        }
                        else {
                            chartView.axisX().max = stickCountX;
                            chartView.axisX().min = 0;
                        }
                        chartView.scrollLeft(-100)
                        lastX = mouse.x
                    }
                    else if(lastX < mouse.x){
                        if (currentIndex > stickCountX-3) {
                            chartView.axisX().min = chartView.axisX().max - 10;
                        }
                        else {
                            chartView.axisX().max = stickCountX;
                            chartView.axisX().min = 0;
                        }
                        chartView.scrollRight(-100)
                        lastX=mouse.x
                    }
                }
            }
        }
        Rectangle{
            id: lineUCL
            x: 58
            y: 15
            width: 620
            height: 1
            color: "yellow"
        }
        Rectangle{
            id: lineLCL
            x: 58
            y: 68
            width: 620
            height: 1
            color: "red"
        }
    }

    Component.onCompleted: {
        genData()
    }

    function timerTrigger()
    {
        genData()
        var i= 0;
        currentIndex++;
        var lineSeries = chartView.series("lineTitle");
        if (currentIndex < 2499) {
            if (!lineSeries) {
                lineSeries = chartView.createSeries(ChartView.SeriesTypeLine, "lineTitle");
                chartView.axisY().min = 40;
                chartView.axisY().max = 80;
                chartView.axisY().minorGridVisible=true
                chartView.axisY().tickCount = 3;
                chartView.axisX().labelsColor ="#EECFA1"
                chartView.axisX().gridVisible =false
                chartView.axisX().labelsPixelSize =15
                chartView.axisY().gridVisible =false
                chartView.axisY().labelsVisible=false
            }
            lineSeries.color=lineChartColor
            if(valueY[i] >=40 && valueY[i]<=80){
                lineSeries.append(currentIndex, valueY[i])
                i++;
            }
            else if(valueY[i]<40){
                lineSeries.append(currentIndex,null)
                i++;
            }
            else if(valueY[i]>80){
                lineSeries.append(currentIndex,null)
                i++
            }

            if (currentIndex > stickCountX-2) {
                //chartView.axisX().max = Number(currentIndex + 2);
                chartView.axisX().max+=1
                chartView.axisX().min = chartView.axisX().max - stickCountX;
            }
            else {
                chartView.axisX().max = stickCountX;
                chartView.axisX().min = 0;
            }
            chartView.axisX().tickCount = chartView.axisX().max - chartView.axisX().min + 1;

        } else {
            timerDraw.stop();
            chartView.animationOptions = ChartView.AllAnimations;
        }
    }
}


