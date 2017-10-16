import QtQuick 2.0
import QtQuick.Controls 2.0
import "../Control/switchLineUC"
import "../Control/slideControl"
import ZoomLine4V 1.0

Item {
    property ZoomLine4V zoomlineObj: drawContent
    property int countSelected: 0;
    property int lineno: 12
    property real unitLine:0
    id: zoomLine4v
    x: 0
    y: 0
    width: 1024
    height: 640

    ZoomLine4V{
        id: drawContent
        width: 1024
        height: 640
    }
    Rectangle{
        id: listBall
        x: 9
        y: 476
        width: 1010
        height: 24
        color: "transparent"
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
                    drawContent.setNumSelect(zoomLine4v.lineno,Math.floor(countSelected)/2)
                    switchline.count=Math.floor(countSelected)/2
                }

                else if(mouseX <= Math.floor(countSelected)*unitLine + 12)
                {
                    drawContent.setNumSelect(zoomLine4v.lineno,(Math.floor(countSelected)-1)/2)
                    switchline.count=(Math.floor(countSelected)-1)/2
                }
            }
        }
    }
    Rectangle{
        id: listGraphBar
        x: 9
        y: 500
        width: 1010
        height: 150
        color: "transparent"
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
                drawContent.setNumSelect(zoomLine4v.lineno, Math.floor(countSelected))
                switchline.count=Math.floor(countSelected)
            }
        }
    }

    Rectangle {
        id: toolButton_Center
        x: 710
        y: 283
        width: 54
        height: 54
        color: "transparent"
        radius: 15
        border.color: "#ffffff"
        border.width: 2
        Image{
            id: imgCenter
            anchors.fill: parent
            source: "../Images/set2zero.png"
        }
        MouseArea {
            id: mousea
            anchors.fill: parent
            onPressed: {
                imgCenter.source= "../Images/set2zero_on.png"
            }
            onReleased: {
                imgCenter.source= "../Images/set2zero.png"
            }
            onCanceled: {
                imgCenter.source= "../Images/set2zero.png"
            }
        }
    }

    Rectangle {
        id: toolButton_Corner
        x: 960
        y: 10
        width: 54
        height: 54
        radius: 15
        color: "transparent"
        border.color: "#ffffff"
        border.width: 2
        Image{
            id: imgCorner
            anchors.fill: parent
            source: "../Images/set2zero.png"
        }
        MouseArea {
            id: mousea2
            anchors.fill: parent
            onPressed: {
                imgCorner.source= "../Images/set2zero_on.png"
            }
            onReleased: {
                imgCorner.source= "../Images/set2zero.png"
            }
            onCanceled: {
                imgCorner.source= "../Images/set2zero.png"
            }
        }
    }


    SwitchLine3v
    {
        id: switchline
        x:17
        y:285
        lineno: zoomLine4v.lineno
        onActivated:drawContent.setNumSelect(zoomLine4v.lineno,countSelected.toFixed(0))
    }

    Text{
        id:txtInterval
        x: 17
        y: 385
        text: "Interval (ms)"
        font.pixelSize: 20
        color: "#21be2b"
    }

    SlideControl{
        id:slideBtn
        x: 17
        y: 410
        onGetValueChanged: {
            zoomlineObj.getIntervalValue(parseInt(slideBtn.value))
        }
    }

    Rectangle{
        id: area_start_stop
        x: 725
        y: 64
        width: 230
        height: 76
        color: "transparent"
        border.color: "#848385"
        border.width: 1
        radius: 5

        Rectangle{
            id: btn_stop
            x: 10
            y:10
            width: 100
            height: 56
            color: "#dc8232"
            radius: 10
            border.color:"#78e8fe"
            border.width: 5
            Text {
                id: txtStop
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                color: "#ffffff"
                text: qsTr("STOP")
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    btn_stop.border.color = "#78e8fe"
                    txtStop.color ="#ffffff"
                    btn_start.border.color ="#5a6469"
                    txtStart.color ="#5a6469"
                }
            }
        }
        Rectangle{
            id: btn_start
            x: btn_stop.width + 10 +10
            y:10
            width: 100
            height: 56
            color: "#91be3c"
            radius: 10
            border.color:"#5a6469"
            border.width: 5
            Text {
                id: txtStart
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                color: "#5a6469"
                text: qsTr("START")
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    btn_start.border.color = "#78e8fe"
                    txtStart.color ="#ffffff"
                    btn_stop.border.color ="#5a6469"
                    txtStop.color ="#5a6469"
                }
            }
        }
    }
}
