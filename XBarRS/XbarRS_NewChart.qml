import ControlApp 1.0
//import ChartXBar 1.0
import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import "../Control/spinner"
import "../Control/switchControl"
import "../Control/switchLineUC"
import "../ChartXbar"
import CommonControl 1.0
import QtQml 2.2

Item {
    property alias objxBarNewChartVM: xbarRS_NewChartVM
    property XbarRS_NewChart objxBarRsNewChart: _xBarNewChart
    property bool isForLine: false
    property bool isR: true
    property bool isPass: false
    property int _currentLineNo: 1

    XBar_NewChartVM{
        id:xbarRS_NewChartVM
    }

    XbarRS_NewChart{
        id: _xBarNewChart
        x:0
        y:0
        width: 1024
        height: 640

        Spinner {
            id: switchLine
            x: 610
            y: 430
            rotation: 270
            visible: !sw_AllForLine.isLeft
            mod: 12
            onGetCurrIndex: {
                objxBarRsNewChart.getCurrentLine(switchLine.currIndex);
            }
        }

        SwitchControl_ver4 {
            id: sw_AllForLine
            x: 570
            y: 585
            textLeft: "All"
            textRight: "Forline"
            isLeft: !isForLine
            onSwitchButton: {
                isForLine = !sw_AllForLine.isLeft
                objxBarRsNewChart.getIsLeft(isForLine, 0, 4)
            }
        }

        SwitchControl_ver4 {
            id: sw_AllPass
            x: 328
            y: 585
            textLeft: "All"
            textRight: "Pass"
            isLeft: !isPass
            onSwitchButton: {
                isPass = !sw_AllPass.isLeft;
                objxBarRsNewChart.getIsLeft(isPass, 2, 4);
                if(isLeft)
                {
                    chartXbar.lineChartColor ="#EECFA1"
                }
                else{
                    chartXbar.lineChartColor="#FFFF66"
                }
            }
        }

        SwitchControl_ver4 {
            id: sw_Rs
            x: 812
            y: 585
            textLeft: "R"
            textRight: "S"
            isLeft: isR
            onSwitchButton: {
                isR = sw_Rs.isLeft;
                objxBarRsNewChart.getIsLeft(isR, 1, 4);
                if(isLeft)
                {
                    chartRS.lineChartColor ="lightgreen"
                }
                else{
                    chartRS.lineChartColor="red"
                }
            }
        }

        Rectangle {
            id: zeroSetBtn
            x: 90
            y: 470
            width: 100
            height: 50
            color: "#29313c"
            border.color: "#A6A6A6"

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d");

                    ctx.fillStyle = "white"
                    ctx.beginPath();
                    ctx.moveTo(5, 20);
                    ctx.lineTo(20, 20);
                    ctx.lineTo(20, 15);
                    ctx.lineTo(35, 25);
                    ctx.lineTo(20, 35);
                    ctx.lineTo(20, 30);
                    ctx.lineTo(5, 30);
                    ctx.closePath();
                    ctx.fill();

                    var ctr = getContext("2d");
                    ctr.fillStyle = "white"
                    ctr.beginPath();
                    ctr.moveTo(65, 25);
                    ctr.lineTo(80, 15);
                    ctr.lineTo(80, 20);
                    ctr.lineTo(95, 20);
                    ctr.lineTo(95, 30);
                    ctr.lineTo(80, 30);
                    ctr.lineTo(80, 35);
                    ctr.closePath();
                    ctr.fill();
                }
            }

            Text {
                id: zero
                font.pixelSize: 50
                color: "white"
                anchors.centerIn: parent
                text: "0"
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    zeroSetBtn.color = "#1a4670"
                }
                onReleased: {
                    zeroSetBtn.color = "#29313c"
                }
            }
        }
        Timer{
            id: timerDraw
            running: true
            repeat: true
            interval: 100
            onTriggered: {
                chartXbar.lastValue = objxBarRsNewChart.randData();
                chartXbar.timerTrigger()
                chartRS.lastValue = objxBarRsNewChart.randData();
                chartRS.timerTrigger()
            }
        }
        TK_XBarRSChart {
            id: chartXbar
            x: 290
            y: (Qt.platform.os === "android") ? -30 : -10
            width: 720
            height: (Qt.platform.os === "android") ? 260 : 240
            lineChartColor: "#EECFA1"

            Component.onCompleted: {
                getPlotAreaX()
                directConnectionObject.source = chartXbar.lowerLayer
                directConnectionObject.signal = "onPaintHandle(QQuickItem*,QPainter*)"
                directConnectionObject.destination = _xBarNewChart
                directConnectionObject.slot = "drawXBarLine(QQuickItem*,QPainter*)"
                directConnectionObject.isConnect = true
            }
            function getPlotAreaX(){
                var beginPlot_X = chartXbar.plotX
                var beginPlot_Y = chartXbar.plotY
                var plotAreaWidth =  chartXbar.plotWidth
                var plotAreaHeight = chartXbar.plotHeight
                var space =chartXbar.height - plotAreaHeight
                objxBarRsNewChart.getPlotLocation(beginPlot_X, beginPlot_Y, plotAreaWidth, plotAreaHeight, space)
            }
        }

        TK_XBarRSChart {
            id: chartRS
            x: 290
            y: (Qt.platform.os === "android") ? (chartXbar.y +chartXbar.height - 40) : (chartXbar.y +chartXbar.height - 20)
            width: 720
            height: (Qt.platform.os === "android") ? 260 : 240
            lineTitle2: sw_Rs.isLeft ? "Line R" : "Line S"
            lineChartColor: "lightgreen"

            Component.onCompleted: {
                directConnectionObject.source = chartRS.lowerLayer
                directConnectionObject.signal = "onPaintHandle(QQuickItem*,QPainter*)"
                directConnectionObject.destination = _xBarNewChart
                directConnectionObject.slot = "drawRSLine(QQuickItem*,QPainter*)"
                directConnectionObject.isConnect = true
            }

        }

        DirectConnection {
            id: directConnectionObject
        }

        TestFramework {
            id: testFrameworkItem
        }
    }
    Component.onCompleted: {
        objxBarNewChartVM.onLoad();
    }
}
