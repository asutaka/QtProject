import QtQuick 2.0
import QtCharts 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.0
import CommonControl 1.0
import "../Control/switchControl"
import "../Control/switchLineUC"
import "../Control"

Item {
    width: 1024
    height: 640
    Rectangle{
        id: rectBg
        anchors.fill: parent
        color:"#332e32"
        Image{
            anchors.fill: parent
            source:"qrc:/Images/bgAdjustTimming.png";
        }
        Rectangle{
            id : rectShowChar
            x: 0
            y: 0
            width: 1024
            height: 640
            color: "transparent"
            Rectangle{
                id: rectProductName
                visible: true
                x:4
                y: 10
                width:200
                height: 80
                color: "transparent"
                border.width: 1
                border.color: "#848385"
                radius:5
                Text {
                    x:2
                    y:5
                    text: "Prod"
                    font.pixelSize:18
                    color: "white"
                }
                Text {
                    x:6
                    y:40
                    text: "sample"
                    font.pixelSize:18
                    color: "white"
                }
                Text {
                    x:94
                    text: "050"
                    font.pixelSize:34
                    color: "white"
                }
            }

            Rectangle{
                id: rectTemp
                visible: false
                x:4
                y: 0
                width:200
                height: 80
                color: "transparent"
                radius:5
                Text {
                    x:2
                    y:5
                    text: "Prod"
                    font.pixelSize:18
                    color: "white"
                }
                Text {
                    x:130
                    y:5
                    text: "sample"
                    font.pixelSize:18
                    color: "white"
                }
                Text {
                    x:50
                    y: -5
                    text: "50"
                    font.pixelSize:34
                    color: "white"
                }
            }
            Text{
                x:230
                y:5
                text: "Weight"
                font.pixelSize:18
                color: "white"
            }
            Text{
                id: txtWeight
                x:300
                y:5
                text: "0.00"
                font.pixelSize:18
                color: "#d7b69a"
            }
            Text{
                x:340
                y:5
                text: "g"
                font.pixelSize:18
                color: "white"
            }
            Rectangle{
                y: 30
                width: 400
                anchors.horizontalCenter: parent.horizontalCenter
                color: "transparent"
                Legend{
                    x: 0
                    y: 0
                    strColor: "red"
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                }
                Legend{
                    x:80
                    y: 0
                    strColor: "yellow"
                    strSource: "qrc:/Images/Number_w24h24_07.png"
                }
                Legend{
                    x: 160
                    y: 0
                    strColor: "brown"
                    strSource: "qrc:/Images/Number_w24h24_04.png"
                }
                Legend{
                    x: 240
                    y: 0
                    strColor: "pink"
                    strSource: "qrc:/Images/Number_w24h24_03.png"
                }
                Legend{
                    x: 320
                    y: 0
                    strColor: "blue"
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                }
                Legend{
                    x: 400
                    y: 0
                    strColor: "green"
                    strSource: "qrc:/Images/Number_w24h24_02.png"
                }
                Legend{
                    x: 0
                    y: 35
                    strColor: "red"
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                }
                Legend{
                    x: 80
                    y: 35
                    strColor: "yellow"
                    strSource: "qrc:/Images/Number_w24h24_07.png"
                }
                Legend{
                    x: 160
                    y: 35
                    strColor: "brown"
                    strSource: "qrc:/Images/Number_w24h24_04.png"
                }
                Legend{
                    x: 240
                    y: 35
                    strColor: "pink"
                    strSource: "qrc:/Images/Number_w24h24_03.png"
                }
                Legend{
                    x: 320
                    y: 35
                    strColor: "blue"
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                }
                Legend{
                    x: 400
                    y: 35
                    strColor: "green"
                    strSource: "qrc:/Images/Number_w24h24_02.png"
                }
            }
            Rectangle{
                id: rectWeightChart
                y: 106
                width: 970
                anchors.horizontalCenter: parent.horizontalCenter
                height : 406
                color:"transparent"
                Rectangle{
                    anchors.fill: parent
                    color: "#282828"
                    opacity: 0.5
                    radius: 10
                }
                MouseArea{
                    anchors.fill: parent
                    //                    hoverEnabled: true
                    //                    cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                    onClicked: {
                        rectBg.state ="active"
                        rectMouse.visible = true;
                    }
                    onHoveredChanged: {
                        if(containsMouse){
                            toolTip.visible= true;
                        }
                        else{
                            toolTip.visible= false;
                        }
                    }
                }
                ToolTip {
                    id: toolTip
                    text: "textToolTip"
                    visible: false
                    x: 50
                    timeout: 500
                    background: Rectangle{
                        color: "white"
                        radius: 3
                        height: 35
                    }
                    contentItem:  Text{
                        id: txtToolTip
                        font.pixelSize: 18
                        text: toolTip.text
                        anchors.verticalCenter: TextInput.verticalCenter
                    }
                }
                ChartView {
                    id: weightChart
                    anchors.fill: parent
                    antialiasing: true
                    backgroundColor:"transparent"
                    legend.visible :false;
                    ValueAxis {
                        id: valueAxisX
                        min:0
                        max: 5
                        gridVisible: false
                        labelsColor: "white"
                        labelsFont.pixelSize:  18
                        tickCount: 6
                    }

                    ValueAxis {
                        id:valueAxisY
                        min: 0
                        max: 15
                        tickCount:2
                        gridLineColor:"#DF7401"
                        minorTickCount:5
                        labelsColor: "white"
                        labelsFont.pixelSize:  18
                        minorGridVisible: true
                    }
                    SplineSeries {
                        width: 5
                        axisX: valueAxisX
                        axisY: valueAxisY
                        capStyle: Qt.RoundCap
                        color:"green"
                        XYPoint { x: 0; y: 2 }
                        XYPoint { x: 1.1; y: 3.2 }
                        XYPoint { x: 1.9; y: 2.4 }
                        XYPoint { x: 2.1; y: 2.1 }
                        XYPoint { x: 2.9; y: 2.6 }
                        XYPoint { x: 3.4; y: 2.3 }
                        XYPoint { x: 4.1; y: 3.1 }
                    }
                }
            }
            Rectangle{
                id: rectSignalChart
                x: 30
                y: 525
                width: 970
                height : 100
                color:"transparent"
                radius: 10
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle{
                    anchors.fill: parent
                    color: "#282828"
                    opacity: 0.5
                    radius: 10
                }
                ChartView {
                    id: signalChart
                    anchors.fill: parent
                    antialiasing: true
                    backgroundColor: "transparent"
                    legend.visible: false
                    ValueAxis {
                        id: signalAxisX
                        labelFormat: "%.0f"
                        min:0
                        max: 15
                        gridVisible: false
                        labelsColor: "white"
                        labelsFont.pixelSize:  20
                        minorTickCount:4
                        minorGridVisible: false
                        tickCount: 4
                    }
                    ValueAxis {
                        id:signalAxisY
                        minorGridVisible: false
                        min: 0
                        max: 2.2
                        gridLineColor:"#DF7401"
                        labelsColor: "white"
                        labelsFont.pixelSize:  20
                        gridVisible: false
                        tickCount: 2
                    }
                    LineSeries {
                        axisX: signalAxisX
                        axisY: signalAxisY
                        name: "LineSeries"
                        XYPoint { x: 0; y: 1}
                        XYPoint { x: 1; y: 1}
                        XYPoint { x: 2; y: 1}
                        XYPoint { x: 2; y: 2}
                        XYPoint { x: 3; y: 2}
                        XYPoint { x: 3; y: 1}
                        XYPoint { x: 4; y: 1}
                        XYPoint { x: 5; y: 1}
                        XYPoint { x: 6; y: 1}
                        XYPoint { x: 6; y: 2}
                        XYPoint { x: 7; y: 2}
                        XYPoint { x: 8; y: 2}
                        XYPoint { x: 8; y: 1}
                        XYPoint { x: 9; y: 1}
                        XYPoint { x: 10; y: 1}
                        XYPoint { x: 10; y: 2}
                        XYPoint { x: 11; y: 2}
                        XYPoint { x: 11; y: 1}
                        XYPoint { x: 12; y: 1}
                        XYPoint { x: 12; y: 2}
                        XYPoint { x: 13; y: 2}
                        XYPoint { x: 13; y: 1}
                        XYPoint { x: 14; y: 1}
                        XYPoint { x: 14; y: 2}
                        XYPoint { x: 15; y: 2}
                    }
                }
            }
            Component.onCompleted: {
                for(var i =0 ;i<6 ; i++){
                    var series = weightChart.createSeries(ChartView.SeriesTypeSpline,"",valueAxisX,valueAxisY);
                    for(var j=0;j<=10;j++){
                        series.append(j, Math.floor((Math.random() * 5) + 5));
                    }
                    var seriesSignal = signalChart.createSeries(ChartView.SeriesTypeLine,"",signalAxisX,signalAxisY);
                    if(i%2 ===0){
                        seriesSignal.append(0,1);
                        seriesSignal.append(1,1);
                        seriesSignal.append(1,2);
                        seriesSignal.append(2,2);
                        seriesSignal.append(2,1);
                        seriesSignal.append(3,1);
                        seriesSignal.append(3,2);
                        seriesSignal.append(4,2);
                        seriesSignal.append(5,2);
                        seriesSignal.append(5,1);
                        seriesSignal.append(6,1);
                        seriesSignal.append(6,2);
                        seriesSignal.append(7,2);
                        seriesSignal.append(8,2);
                        seriesSignal.append(8,1);
                        seriesSignal.append(9,1);
                        seriesSignal.append(10,1);
                    }
                    else{
                        seriesSignal.append(0,1);
                        seriesSignal.append(1,1);
                        seriesSignal.append(2,1);
                        seriesSignal.append(2,2);
                        seriesSignal.append(3,2);
                        seriesSignal.append(3,2);
                        seriesSignal.append(3,1);
                        seriesSignal.append(4,1);
                        seriesSignal.append(5,1);
                        seriesSignal.append(6,1);
                        seriesSignal.append(6,2);
                        seriesSignal.append(7,2);
                        seriesSignal.append(7,1);
                        seriesSignal.append(8,1);
                        seriesSignal.append(9,1);
                        seriesSignal.append(10,1);
                    }
                }
            }
        }
        Rectangle{
            id: rectSetting
            x: -300
            y: 15
            width: 300
            height : 610
            color:"transparent"
            visible: false
            Rectangle{
                anchors.fill: parent
                color: "#282828"
                opacity : 0.5
                radius: 10

            }

            TK_SwitchControl{
                id: switchLineMode
                x: 25
                y: 20
                strLeft: "All"
                strRight: "Forline"
            }

            SwitchLineUc_ver3{
                x: 50
                y: 70
                visible: !switchLineMode.isLeft
            }
            RectangleInputText{
                x: 10
                y: 560
                txtTitle: "Filter Time"
            }
            RectangleInputText{
                x: 10
                y: 510
                txtTitle: "T4"
            }
            RectangleInputText{
                x: 10
                y: 460
                txtTitle: "T3"
            }
            RectangleInputText{
                x: 10
                y: 410
                txtTitle: "T2"
            }
            RectangleInputText{
                x: 10
                y: 360
                txtTitle: "T1"
            }
            RectangleInputText{
                x: 10
                y: 310
                txtTitle: "Prod Len"
                txtUnit: "mm"
            }
            RectangleInputText{
                x: 10
                y: 260
                txtTitle: "Ref.val"
                txtUnit: "g"
            }
            RectangleInputText{
                x: 10
                y: 210
                txtTitle: "Mesa.Timming"
            }
        }
        Rectangle {
            id: rectMouse
            x: 300
            y: 0
            width: 724
            height: parent.height
            color:"transparent"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    rectBg.state ="inactive"
                    rectMouse.visible = false;
                }
            }
        }
        states: [
            State {
                name: "active"
                PropertyChanges { target: rectSetting; x: 20; visible: true }
                PropertyChanges { target: rectWeightChart; width:670 }
                PropertyChanges { target: rectSignalChart; width:670  }
                PropertyChanges { target: rectShowChar; x: 335;width:670  }
                PropertyChanges { target: rectProductName; visible: false}
                PropertyChanges { target: rectTemp; visible: true}
            },
            State {
                name: "inactive"
                PropertyChanges { target: rectSetting; x: -300; visible: false}
                PropertyChanges { target: rectWeightChart; width:970 }
                PropertyChanges { target: rectSignalChart; width: 970 }
                PropertyChanges { target: rectShowChar; x: 0;width:1024  }
                PropertyChanges { target: rectProductName; visible: true}
                PropertyChanges { target: rectTemp; visible: false}
            }
        ]
        transitions: Transition {
            NumberAnimation {
                target: rectSetting
                property: "x"
                easing.type: "OutQuad"
                duration: 250
            }
        }
    }
}
