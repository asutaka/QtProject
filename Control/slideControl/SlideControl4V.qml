import QtQuick 2.5
import QtQuick.Controls 2.0

Rectangle{
    id:rectParent
    property int widthBgr: 200
    property int heightBgr: 10
    property int widthHandle: 18
    property int heightHandle: 18

    width: widthBgr+20
    height:heightBgr*4
    color: "#EEE8CD"
    radius: 2
    opacity: 1
    rotation: -90

    Text {
        id: txt1
        x: slider_control.x +rectBgr.x -font.pixelSize/2
        y: 50
        color: "#EEE8CD"
        font.pixelSize: 15
        text: qsTr("100")
        rotation: 90
    }
    Text {
        id: txt2
        x: slider_control.x +rectBgr.x +rectBgr.width/4-font.pixelSize/2
        y: 50
        color: "#EEE8CD"
        font.pixelSize: 15
        text: qsTr("200")
        rotation: 90
    }
    Text {
        id: txt3
        x: slider_control.x +rectBgr.x +rectBgr.width/2-font.pixelSize/2
        y: 50
        color: "#EEE8CD"
        font.pixelSize: 15
        text: qsTr("300")
        rotation: 90
    }
    Text {
        id: txt4
        x: slider_control.x +rectBgr.x +rectBgr.width*3/4-font.pixelSize/2
        y: 50
        color: "#EEE8CD"
        font.pixelSize: 15
        text: qsTr("400")
        rotation: 90
    }
    Text {
        id: txt5
        x: slider_control.x +rectBgr.x +rectBgr.width-font.pixelSize/2
        y: 50
        color: "#EEE8CD"
        font.pixelSize: 15
        text: qsTr("500")
        rotation: 90
    }
    Canvas{
        anchors.fill: parent
        onPaint: {
            var ctx =getContext("2d")
            ctx.strokeStyle ="#000000"
            ctx.opacity =0.5
            // Draw ruler left
            ctx.moveTo(slider_control.x +rectBgr.x, 0)
            ctx.lineTo(slider_control.x +rectBgr.x, 10)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width/16, 5)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width/16, 10)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width/8, 5)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width/8, 10)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width*3/16, 5)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width*3/16, 10)
            ctx.stroke()

            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width/4, 0)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width/4, 10)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x+rectBgr.width/4 +rectBgr.width/16, 5)
            ctx.lineTo(slider_control.x +rectBgr.x+rectBgr.width/4 +rectBgr.width/16, 10)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x+rectBgr.width/4 +rectBgr.width/8, 5)
            ctx.lineTo(slider_control.x +rectBgr.x+rectBgr.width/4 +rectBgr.width/8, 10)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x+rectBgr.width/4 +rectBgr.width*3/16, 5)
            ctx.lineTo(slider_control.x +rectBgr.x+rectBgr.width/4 +rectBgr.width*3/16, 10)
            ctx.stroke()

            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width/2, 0)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width/2, 10)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x+rectBgr.width/2 +rectBgr.width/16, 5)
            ctx.lineTo(slider_control.x +rectBgr.x+rectBgr.width/2 +rectBgr.width/16, 10)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x+rectBgr.width/2 +rectBgr.width/8, 5)
            ctx.lineTo(slider_control.x +rectBgr.x+rectBgr.width/2 +rectBgr.width/8, 10)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x+rectBgr.width/2 +rectBgr.width*3/16, 5)
            ctx.lineTo(slider_control.x +rectBgr.x+rectBgr.width/2 +rectBgr.width*3/16, 10)
            ctx.stroke()

            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width*3/4, 0)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width*3/4, 10)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width*3/4+rectBgr.width/16, 5)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width*3/4+rectBgr.width/16, 10)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width*3/4+rectBgr.width/8, 5)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width*3/4+rectBgr.width/8, 10)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width*3/4+rectBgr.width*3/16, 5)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width*3/4+rectBgr.width*3/16, 10)
            ctx.stroke()

            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width, 0)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width, 10)
            ctx.stroke()

            // Draw ruler right
            ctx.moveTo(slider_control.x +rectBgr.x, 30)
            ctx.lineTo(slider_control.x +rectBgr.x, 40)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width/16, 30)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width/16, 35)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width/8, 30)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width/8, 35)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width*3/16, 30)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width*3/16, 35)
            ctx.stroke()

            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width/4, 30)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width/4, 40)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x+rectBgr.width/4 +rectBgr.width/16, 30)
            ctx.lineTo(slider_control.x +rectBgr.x+rectBgr.width/4 +rectBgr.width/16, 35)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x+rectBgr.width/4 +rectBgr.width/8, 30)
            ctx.lineTo(slider_control.x +rectBgr.x+rectBgr.width/4 +rectBgr.width/8, 35)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x+rectBgr.width/4 +rectBgr.width*3/16, 30)
            ctx.lineTo(slider_control.x +rectBgr.x+rectBgr.width/4 +rectBgr.width*3/16, 35)
            ctx.stroke()

            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width/2, 30)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width/2, 40)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x+rectBgr.width/2 +rectBgr.width/16, 30)
            ctx.lineTo(slider_control.x +rectBgr.x+rectBgr.width/2 +rectBgr.width/16, 35)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x+rectBgr.width/2 +rectBgr.width/8, 30)
            ctx.lineTo(slider_control.x +rectBgr.x+rectBgr.width/2 +rectBgr.width/8, 35)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x+rectBgr.width/2 +rectBgr.width*3/16, 30)
            ctx.lineTo(slider_control.x +rectBgr.x+rectBgr.width/2 +rectBgr.width*3/16, 35)
            ctx.stroke()

            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width*3/4, 30)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width*3/4, 40)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width*3/4+rectBgr.width/16, 30)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width*3/4+rectBgr.width/16, 35)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width*3/4+rectBgr.width/8, 30)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width*3/4+rectBgr.width/8, 35)
            ctx.stroke()
            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width*3/4+rectBgr.width*3/16, 30)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width*3/4+rectBgr.width*3/16, 35)
            ctx.stroke()

            ctx.moveTo(slider_control.x +rectBgr.x +rectBgr.width, 30)
            ctx.lineTo(slider_control.x +rectBgr.x +rectBgr.width, 40)
            ctx.stroke()
        }
    }
    Canvas{
        anchors.fill: parent
        onPaint: {
            var ctx2=getContext("2d")
            ctx2.strokeStyle ="#B8860B"
            ctx2.lineWidth =1
            //Draw line
            ctx2.moveTo(slider_control.x +rectBgr.x, 10)
            ctx2.lineTo(slider_control.x +rectBgr.x +rectBgr.width,10)
            ctx2.stroke()
            ctx2.moveTo(slider_control.x +rectBgr.x, 30)
            ctx2.lineTo(slider_control.x +rectBgr.x +rectBgr.width,30)
            ctx2.stroke()
        }
    }

    Slider {
        id: slider_control
        signal getValueChanged (int _value)
        anchors.fill: parent
        orientation: Qt.Horizontal
        from: 100
        value: 100
        to: 1600
        stepSize: 100
        snapMode: Slider.SnapOnRelease

        background: Rectangle {
            id:rectBgr
            x: slider_control.leftPadding
            y: slider_control.topPadding + slider_control.availableHeight / 2 - height / 2
            implicitWidth: widthBgr
            implicitHeight: heightBgr
            width: slider_control.availableWidth
            height: implicitHeight
            radius: 2
            color: "#696969"

            Rectangle {
                width: slider_control.visualPosition * parent.width
                height: parent.height
                color: "#33b5e5"
                radius: 2
            }
        }

        handle: Rectangle {
            id:rectHandle
            x: slider_control.leftPadding + slider_control.visualPosition * (slider_control.availableWidth - width)
            y: slider_control.topPadding + slider_control.availableHeight / 2 - height / 2
            implicitWidth: widthHandle*1.5
            implicitHeight: heightHandle*1.5
            radius: 13
            color: slider_control.pressed ? "#98FB98" : "#B4EEB4"
            border.color: slider_control.pressed ? "#f0f0f0" : "transparent"
            border.width: 1
            opacity: 1
            onXChanged: {
                //toolTip.text = parseInt(slider_control.position*100*9+100)
            }
            Rectangle{
                anchors.centerIn: parent
                implicitWidth: widthHandle*0.75
                implicitHeight: heightHandle*0.75
                radius: 13
                color: "#32CD32"
            }
        }

        onValueChanged: {
            slider_control.getValueChanged(value)
        }
    }
}


