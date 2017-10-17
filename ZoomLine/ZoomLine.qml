import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0
import "../Control/switchLineUC";
import "../Control";

Item {
    property alias objZoomLineVM: zoomlineVM
    property real countSelected: 0;
    property int lineno: 12
    property real unitLine:0
    id: zoom
    width: 1024
    height: 640
    y: -64
    ZoomLine_VM{
        id:zoomlineVM
    }
    Component.onCompleted: {
        objZoomLineVM.onLoad();
    }
    Rectangle
    {
        color: "red"
        width: 1010
        height: 186
        x: 9
        y: 509
        MouseArea {
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
                drawContent.setNumSelect(zoom.lineno,Math.floor(countSelected))
                switchline.count=Math.floor(countSelected)
            }
        }
    }
    Rectangle
    {
        color: "red"
        width: 1010
        height: 24
        x:9
        y:485
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onPressed: {
                unitLine = width/(lineno*2)
                countSelected=mouseX/unitLine
                if(Math.floor(countSelected)%2==0 &&
                        (mouseX >= Math.floor(countSelected)*unitLine +(unitLine - 12)))
                {
                   drawContent.setNumSelect(zoom.lineno,Math.floor(countSelected)/2)
                    switchline.count=Math.floor(countSelected)/2
                }

                else if(mouseX <= Math.floor(countSelected)*unitLine + 12)
                {
                   drawContent.setNumSelect(zoom.lineno,(Math.floor(countSelected)-1)/2)
                    switchline.count=(Math.floor(countSelected)-1)/2
                }

            }
        }
    }
    ZoomLine{
            id: drawContent
            width: 1024
            height: 640
            x:0
            y:64


        }

    ToolButton {
        id: toolButton_Center
        x: 735
        y: 290
        width: 122
        height: 72
        Image{
            id: imgCenter
            anchors.fill: parent
            source: "../Images/zeroset_off_92_54.png"
            Text {
                text: "gr"
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
        MouseArea {
            id: mousea
            anchors.fill: parent
            onPressed: {
                imgCenter.source= "../Images/zeroset_on_92_54.png"
            }
            onReleased: {
                imgCenter.source= "../Images/zeroset_off_92_54.png"
            }
            onCanceled: {
                imgCenter.source= "../Images/zeroset_off_92_54.png"
            }
        }
    }
    ToolButton {
        id: toolButton_Corner
        x: 905
        y: 70
        width: 115
        height: 53
        Image{
            id: imgCorner
            anchors.fill: parent
            source: "../Images/Key_Zeroset_w86h40.png"
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
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onPressed: {
                imgCorner.source= "../Images/Key_Zeroset_w86h40_p.png"
            }
            onReleased:{
                imgCorner.source= "../Images/Key_Zeroset_w86h40.png"
            }
            onCanceled: {
                imgCorner.source= "../Images/Key_Zeroset_w86h40.png"
            }
        }
    }
    Rectangle
    {
        x: 10
        y: 330
        width: 90
        height: 90
        RoundMouseArea {
                color:"black"
                width: 100
                height: 100
                anchors.centerIn: parent

                onClicked:
                {
                    imgStart.source= "../Images/operation_stop_on_01.png"
                    imgStop.source= "../Images/operation_stop_on.png"
                }
            }
    }
    Image {
        id: toolButton_Stop
        x: 10
        y: 330
        width: 90
        height: 90
        Image{
            id: imgStop
            anchors.fill: parent
            source: "../Images/operation_stop_on.png"
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
        x: 130
        y: 330
        width: 90
        height: 90
        RoundMouseArea {
                color:"black"
                width: 100
                height: 100
                anchors.centerIn: parent

                onClicked:
                {
                    imgStart.source= "../Images/operation_start_on.png"
                    imgStop.source= "../Images/operation_stop_off_01.png"
                }
            }
    }
    Image {
        id: toolButton_Start
        x: 130
        y: 330
        width: 90
        height: 90
        Image{
            id: imgStart
            anchors.fill: parent
            source: "../Images/operation_stop_on_01.png"
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


    SwitchLine
    {
        id: switchline
        x:5
        y:210
        lineno: zoom.lineno
        onActivated:drawContent.setNumSelect(zoom.lineno,countSelected.toFixed(0))
    }

}
