import QtQuick 2.0
import QtCharts 2.0
import ControlApp 1.0

Item {
    id:mainChart
    width: 730
    height: 250
    property var valueY
    property int currentIndex: -1
    property color lineChartColor: "#fed49f"
    property string lineTitle: txtLineTitle
    property string lineTitle2: "Line X-Bar"
    property int stickCountX: 10
    property bool isPress: false
    property int i: 0
    property Timer timerDraw
    signal genData()

    ChartView {
        id: chartView
        width: 730
        height: 250
        animationOptions: ChartView.SeriesAnimations
        antialiasing: true
        backgroundColor: "transparent"
        clip: true
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
                if(rectBounder.visible == true)
                {
                    var factorX =chartView.width/stickCountX
                    if (lastX > mouse.x) {
                        if (currentIndex > stickCountX-3) {
                            //chartView.axisX().max += 100/factorX
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
                            //chartView.axisX().max -= 150/factorX
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
        x: 38
        y:33
        width: 655
        height: 170
        color: "transparent"
        border.color: "lightblue"
        border.width: 3

    }

    Component.onCompleted: {
        genData()
    }
    Timer {
        id: timerDraw
        interval: 1000
        repeat: true
        triggeredOnStart: true
        running: true

        onTriggered: {
            currentIndex++;
            var lineSeries = chartView.series(lineTitle);
            if (currentIndex < 249) {
                if (!lineSeries) {
                    lineSeries = chartView.createSeries(ChartView.SeriesTypeSpline, lineTitle);
                    chartView.axisY().min = 0;
                    chartView.axisY().max = 300;
                    chartView.axisY().minorGridVisible=true
                    chartView.axisY().tickCount = 6;
                    chartView.axisX().labelsColor ="#EECFA1"
                    chartView.axisX().gridVisible =false
                    chartView.axisX().labelsPixelSize =10
                    chartView.axisY().visible =false
                }
                lineSeries.color=lineChartColor
                lineSeries.append(currentIndex, valueY[i++])
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
}


