import QtQuick 2.0
import QtQuick.Controls 1.3
import ControlApp 1.0
import "../Control/switchLineUC";
import "../Control/switchControl";

Item {
    property int countSelected: 0;
    property int lineno: 12
    property real unitLine:0
    id: zoomLine3v
    x: 0
    y: 0
    width: 1024
    height: 640

    property alias objZoomLineVM: zoomlineVM
    ZoomLine_VM{
        id:zoomlineVM
    }
    Component.onCompleted: {
        objZoomLineVM.onLoad();
    }
    Rectangle{
        id: listBall
        x: 257
        y: 476
        width: 758
        height: 24
        color: "Green"
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            propagateComposedEvents: true
            onPressed: {
                unitLine = width/(lineno*2)
                countSelected=(mouseX)/unitLine

                if(Math.floor(countSelected)%2==0 &&
                        (mouseX >= Math.floor(countSelected)*unitLine +(unitLine - 12)))
                {
                    drawContent.setNumSelect(zoomLine3v.lineno,Math.floor(countSelected)/2)
                    switchline.count=Math.floor(countSelected)/2
                }

                else if(mouseX <= Math.floor(countSelected)*unitLine + 12)
                {
                    drawContent.setNumSelect(zoomLine3v.lineno,(Math.floor(countSelected)-1)/2)
                    switchline.count=(Math.floor(countSelected)-1)/2
                }
            }
        }
    }
    Rectangle{
        id: listGraphBar
        x: 257
        y: 500
        width: 758
        height: 150
        color: "red"
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            propagateComposedEvents: true
            onPressed: {
                unitLine=width/lineno
                countSelected=(mouseX)/unitLine
                if(countSelected > (lineno-1))
                {
                    countSelected=lineno-1;
                }
                drawContent.setNumSelect(zoomLine3v.lineno, Math.floor(countSelected))
                switchline.count=Math.floor(countSelected)
            }
        }
    }
    ZoomLine3V{
        id: drawContent
        width: 1024
        height: 640
        x:0
        y:0

    }
    ToolButton {
        id: toolButton_Center
        x: 710
        y: 303
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
        y: 315
        width: 42
        height: 27
        color: "transparent"
        Image{
            anchors.fill: parent
            source: "../Images/pointing_hand.png"
        }
        Rectangle{
            y:27
            width: 42
            height: 14
            color: "transparent"
            Text {
                text: qsTr("SetZero")
                font.pixelSize: 14
                color: "yellow"

            }
        }

    }
    ToolButton {
        id: toolButton_Corner
        x: 965
        y: 4
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
        y: 18
        width: 42
        height: 27
        color: "transparent"
        Image{
            anchors.fill: parent
            source: "../Images/pointing_hand.png"
        }   
        Rectangle{
            y:27
            width: 42
            height: 14
            color: "transparent"
            Text {
                text: qsTr("SetZero")
                font.pixelSize: 14
                color: "yellow"

            }
        }
        Canvas {

        }
    }

        SwitchOn_Off
        {
            id: wipeOn_Off
            x:68
            y: 528
            textLeftOff: "OFF"
            textRightOn: "ON"
            colorOff: "#c60800"
            colorOn: "#4ad965"
            colorDefault: "#d8d9db"
        }

        SwitchLine2v
        {
            id: switchline
            x:17
            y:325
            lineno: zoomLine3v.lineno
            onActivated:drawContent.setNumSelect(zoomLine3v.lineno,countSelected.toFixed(0))
        }

}
