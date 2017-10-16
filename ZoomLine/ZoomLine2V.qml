import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ZoomLine2V 1.0
import "../Control/switchLineUC";
import "../Control"

Item {
    property int countSelected: 0;
    property int lineno: 12
    property real unitLine:0
    id: zoomLine2v
    x: 0
    y: -64
    width: 1024
    height: 640
    Rectangle{
        id: listBall
        x: 9
        y: 485
        width: 1010
        height: 24
        color: "Green"
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onPressed: {
                unitLine = width/(lineno*2)
                countSelected=mouseX/unitLine
                if(Math.floor(countSelected)%2==0 &&
                        (mouseX >= Math.floor(countSelected)*unitLine +(unitLine - 12)))
                {
                   drawContent.setNumSelect(zoomLine2v.lineno,Math.floor(countSelected)/2)
                    switchline.count=Math.floor(countSelected)/2
                }

                else if(mouseX <= Math.floor(countSelected)*unitLine + 12)
                {
                   drawContent.setNumSelect(zoomLine2v.lineno,(Math.floor(countSelected)-1)/2)
                    switchline.count=(Math.floor(countSelected)-1)/2
                }

            }
        }

    }
    Rectangle{
        id: listGraphBar
        x: 9
        y: 509
        width: 1010
        height: 186
        color: "red"
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            propagateComposedEvents: true
            onPressed: {
                unitLine=width/lineno
                countSelected=mouseX/unitLine
                if(countSelected > (lineno-1))
                {
                    countSelected=lineno-1;
                }
                drawContent.setNumSelect(zoomLine2v.lineno, Math.floor(countSelected))
                switchline.count=Math.floor(countSelected)
            }
        }

    }
    ZoomLine2V{
        id: drawContent
        width: 1024
        height: 640
        x:0
        y:64

    }
    ToolButton {
        id: toolButton_Center
        x: 710
        y: 322
        width: 54
        height: 54
        Image{
            id: imgCenter
            anchors.fill: parent
            source: "../Images/zero_icon_off.png"
        }
        MouseArea {
            id: mousea
            anchors.fill: parent
            onPressed: {
                imgCenter.source= "../Images/zero_icon_on.png"
            }
            onReleased: {
                imgCenter.source= "../Images/zero_icon_off.png"
            }
            onCanceled: {
                imgCenter.source= "../Images/zero_icon_off.png"
            }
        }
    }
    Rectangle {
        id: point_center
        x: 668
        y: 334
        width: 42
        height: 27
        color: "transparent"
        Image{
            anchors.fill: parent
            source: "../Images/pointing_hand.png"
        }

    }
    ToolButton {
        id: toolButton_Corner
        x: 965
        y: 68
        width: 54
        height: 54
        Image{
            id: imgCorner
            anchors.fill: parent
            source: "../Images/zero_icon_off.png"
        }
        MouseArea {
            id: mousea2
            anchors.fill: parent
            onPressed: {
                imgCorner.source= "../Images/zero_icon_on.png"
            }
            onReleased: {
                imgCorner.source= "../Images/zero_icon_off.png"
            }
            onCanceled: {
                imgCorner.source= "../Images/zero_icon_off.png"
            }
        }
    }
    Rectangle {
        id: point_corner
        x: 918
        y: 82
        width: 42
        height: 27
        color: "transparent"
        Image{
            anchors.fill: parent
            source: "../Images/pointing_hand.png"
        }

        Canvas {

        }
    }

    Rectangle
    {
        x: 78
        y: 344+105-30
        width: 99
        height: 55
        RoundMouseArea {
                color:"black"
                width: 99
                height: 55
                anchors.centerIn: parent

                onClicked:
                {
                    imgStart.source= "../Images/operation_start_off2.png"
                    imgStop.source= "../Images/operation_stop_on2.png"
                }
            }
    }
    Image {
        id: toolButton_Stop
        x: 78
        y: 344+105-30
        width: 99
        height: 55
        Image{
            id: imgStop
            anchors.fill: parent
            source: "../Images/operation_stop_on2.png"
            Text {
                anchors.verticalCenterOffset: 16
                anchors.horizontalCenterOffset: 0
                anchors.bottomMargin: -16
                font.family: "MS Gothic"
                font.pixelSize: 27
                color: "#ffffff"
                anchors.bottom: parent.bottom
                anchors.centerIn: parent
            }
        }
    }

    Rectangle
    {
        x: 78
        y: 254
        width: 99
        height: 55
        RoundMouseArea {
                color:"black"
                width: 99
                height: 55
                anchors.centerIn: parent

                onClicked:
                {
                    imgStart.source= "../Images/operation_start_on2.png"
                    imgStop.source= "../Images/operation_stop_off2.png"
                }
            }
    }
    Image {
        id: toolButton_Start
        x: 78
        y: 254
        width: 99
        height: 55
        Image{
            id: imgStart
            anchors.fill: parent
            source: "../Images/operation_start_off2.png"
            Text {
                anchors.verticalCenterOffset: 16
                anchors.horizontalCenterOffset: 0
                anchors.bottomMargin: -16
                font.family: "MS Gothic"
                font.pixelSize: 27
                color: "#ffffff"
                anchors.bottom: parent.bottom
                anchors.centerIn: parent
            }
        }
    }
    SwitchLine2v
    {
        id: switchline
        x:17
        y:255 +64 +25 -30
        lineno: zoomLine2v.lineno
        onActivated:drawContent.setNumSelect(zoomLine2v.lineno,countSelected.toFixed(0))
}}
