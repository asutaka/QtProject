import QtQuick 2.0
import QtCharts 2.0
import ControlApp 1.0
import CommonControl 1.0

Item {
    id:mainChart
    width: 700
    height: 60
    property int valueY
    property int currentIndex: -1
    property color lineChartColor: "#fed49f"
    property string lineTitle2: "Line X-Bar"
    property int stickCountX: 10
    property bool isPress: false
    property Timer timerDraw
    property int setInterval: 1000
    property bool start: false
    signal genData()

    TK_ChartView {
        id: customChartView
        anchors.fill: parent
        backgroundColor: "#000000"
        pointColor: "#FED49F"
        labelSize: 8
        labelSpace: 5
        dividingLine:3
        axisColor: "#FED49F"
        axisPenWidth: 1
        tickCountX: width/20
        tickCountY: height/40
    }

    Rectangle{
        id: lineUCL
        x: customChartView.x
        y: customChartView.y
        width: customChartView.width
        height: 1
        color: "yellow"
    }
    Rectangle{
        id: lineLCL
        x: customChartView.x
        y: customChartView.height-customChartView.labelSize-customChartView.dividingLine
        width: customChartView.width
        height: 1
        color: "red"
    }

    function timerTrigger() {
        currentIndex++;
        valueY -= 40;
        if(valueY >=0 && valueY<=40){
            var realValueY = valueY/customChartView.tickCountY
            customChartView.append(currentIndex, realValueY)
        }
        else if(valueY<0){
            customChartView.append(currentIndex,0)
        }
        else if(valueY>40){
            customChartView.append(currentIndex,0)
        }

        if (currentIndex > customChartView.width/customChartView.tickCountX)
        {
            customChartView.removeAt(0);
        }
        customChartView.update()

    }
}


