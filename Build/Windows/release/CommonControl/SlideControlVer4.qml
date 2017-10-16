import QtQuick 2.5
import QtQuick.Controls 2.0

Rectangle{
    property int widthBgr: 200
    property int heightBgr: 30
    property int widthHandle: 26
    property int heightHandle: 26
    property color colorBackgroundParent: "#000000"
    width: widthBgr *1.5
    height: heightBgr *2
    color: colorBackgroundParent
    border.color: "#bdbebf"
    border.width: 1

    Canvas{
        anchors.fill: parent
        onPaint: {
            var ctx =getContext("2d")
            ctx.strokeStyle ="#bdbebf"
            ctx.lineWidth =1
            console.log(rectBrg.x)
            console.log(slider_control.x)

            ctx.moveTo(rectBrg.x +slider_control.x+widthHandle/2, slider_control.y+slider_control.height)
            ctx.lineTo(rectBrg.x +slider_control.x+widthHandle/2, slider_control.y+slider_control.height+5)
            ctx.stroke()

            ctx.moveTo(slider_control.x + rectBrg.x+rectBrg.width/4 +widthHandle/2, slider_control.y+slider_control.height)
            ctx.lineTo(slider_control.x + rectBrg.x+rectBrg.width/4 +widthHandle/2, slider_control.y+slider_control.height+5)
            ctx.stroke()

            ctx.moveTo(slider_control.x + rectBrg.x+rectBrg.width/2, slider_control.y+slider_control.height)
            ctx.lineTo(slider_control.x + rectBrg.x+rectBrg.width/2, slider_control.y+slider_control.height+5)
            ctx.stroke()

            ctx.moveTo(slider_control.x + rectBrg.x+rectBrg.width*3/4-widthHandle/2, slider_control.y+slider_control.height)
            ctx.lineTo(slider_control.x + rectBrg.x+rectBrg.width*3/4-widthHandle/2, slider_control.y+slider_control.height+5)
            ctx.stroke()

            ctx.moveTo(slider_control.x + rectBrg.x+rectBrg.width-widthHandle/2, slider_control.y+slider_control.height)
            ctx.lineTo(slider_control.x + rectBrg.x+rectBrg.width-widthHandle/2, slider_control.y+slider_control.height+5)
            ctx.stroke()
        }
    }

    Slider {
        x:widthBgr/8 -10
        y: heightBgr/32
        signal getValueChanged (int _value)
        id: slider_control
        orientation: Qt.Horizontal
        from: 100
        value: 100
        to: 400
        stepSize: 100
        snapMode: Slider.SnapOnRelease

        background: Rectangle {
            id:rectBrg
            x: slider_control.leftPadding
            y: slider_control.topPadding + slider_control.availableHeight / 2 - height / 2
            implicitWidth: widthBgr
            implicitHeight: heightBgr
            width: slider_control.availableWidth
            height: implicitHeight
            radius: 0
            color: "#bdbebf"

            Rectangle {
                x:1
                y:1
                width: slider_control.visualPosition * parent.width-1
                height: parent.height-1
                color: "#21be2b"
                radius: 2
            }
            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx =getContext("2d");
                    ctx.fillStyle= colorBackgroundParent
                    ctx.lineWidth = 1
                    ctx.beginPath()
                    ctx.moveTo(0,0)
                    ctx.lineTo(widthBgr,0)
                    ctx.lineTo(0, heightBgr)
                    ctx.lineTo(0,0)
                    ctx.closePath()
                    ctx.fill()
                }
            }
        }
        handle: Rectangle {
            id:rectHandle
            x: slider_control.leftPadding + slider_control.visualPosition * (slider_control.availableWidth - width)
            y: slider_control.topPadding + slider_control.availableHeight / 2 - height / 2
            implicitWidth: widthHandle
            implicitHeight: heightHandle
            radius: 13
            color: slider_control.pressed ? "#828282" : "#f0f0f0"
            border.color: "#bdbebf"
            onXChanged: {
                txtValueSlider.text = parseInt(slider_control.position*100*4+100)
            }
        }
        Rectangle{
            x:rectBrg.x +rectBrg.width +10
            y:rectBrg.y +1
            width: rectBrg.width/4
            height: rectBrg.height
            color: "#bdbebf"
            radius: 3
            Text {
                anchors.centerIn: parent
                id: txtValueSlider
            }
        }
        onValueChanged: {
            slider_control.getValueChanged(value)
        }
    }

}

