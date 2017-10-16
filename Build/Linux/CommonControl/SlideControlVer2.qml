import QtQuick 2.5
import QtQuick.Controls 2.0

Item {
    id: name
    property int widthBound: 220
    property int heightBound: 40
    property int widthBgr: 200
    property int heightBgr: 4
    property int widthHandle: 26
    property int heightHandle: 26

    Rectangle{
        id: controlArea
        x: 0
        y: 0
        width:widthBound
        height: heightBound
        color: "transparent"
        border.width: 1
        border.color: "#bdbebf"
        Canvas{
            anchors.fill: parent
            onPaint: {
                var ctx =getContext("2d")
                ctx.strokeStyle  ="#bdbebf"
                ctx.lineWidth=2
                ctx.moveTo(rectBrg.x+5,rectBrg.y+rectBrg.height+10)
                ctx.lineTo(rectBrg.x+5,rectBrg.y+rectBrg.height +20)
                ctx.stroke()

                ctx.moveTo(rectBrg.x+2+rectBrg.width/4,rectBrg.y+rectBrg.height+10)
                ctx.lineTo(rectBrg.x+2+rectBrg.width/4,rectBrg.y+rectBrg.height +20)
                ctx.stroke()

                ctx.moveTo(rectBrg.x+rectBrg.width/2,rectBrg.y+rectBrg.height+10)
                ctx.lineTo(rectBrg.x+rectBrg.width/2,rectBrg.y+rectBrg.height +20)
                ctx.stroke()

                ctx.moveTo(rectBrg.x-2+rectBrg.width*0.75,rectBrg.y+rectBrg.height+10)
                ctx.lineTo(rectBrg.x-2+rectBrg.width*0.75,rectBrg.y+rectBrg.height +20)
                ctx.stroke()
                ctx.moveTo(rectBrg.x-5+rectBrg.width,rectBrg.y+rectBrg.height+10)
                ctx.lineTo(rectBrg.x-5+rectBrg.width,rectBrg.y+rectBrg.height +20)
                ctx.stroke()
            }
        }
        Text {
            id: txt1
            x: rectBrg.x+5 -font.pixelSize/2
            y: rectBrg.y+rectBrg.height +20+10
            font.pixelSize: 15
            color: "#bdbebf"
            text: "100"
            rotation: 90
        }
        Text {
            id: txt2
            x: rectBrg.x+2+rectBrg.width/4 -font.pixelSize/2
            y: rectBrg.y+rectBrg.height +20+10
            font.pixelSize: 15
            color: "#bdbebf"
            text: "200"
            rotation: 90
        }
        Text {
            id: txt3
            x: rectBrg.x+rectBrg.width/2 -font.pixelSize/2
            y: rectBrg.y+rectBrg.height +20+10
            font.pixelSize: 15
            color: "#bdbebf"
            text: "300"
            rotation: 90
        }
        Text {
            id: txt4
            x: rectBrg.x-2+rectBrg.width*3/4 -font.pixelSize/2
            y: rectBrg.y+rectBrg.height +20+10
            font.pixelSize: 15
            color: "#bdbebf"
            text: "400"
            rotation: 90
        }
        Text {
            id: txt5
            x: rectBrg.x-5+rectBrg.width -font.pixelSize/2
            y: rectBrg.y+rectBrg.height +20+10
            font.pixelSize: 15
            color: "#bdbebf"
            text: "500"
            rotation: 90
        }
        Slider {
            signal getValueChanged (int _value)
            anchors.bottomMargin: 0
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
                radius: 2
                color: "#bdbebf"

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
                implicitWidth: widthHandle
                implicitHeight: heightHandle
                radius: 3
                border.color: "#bdbebf"
                color: slider_control.pressed ? "#33b5e5" : "#f6f6f6"
                onXChanged: {
                    txtValueSlider.text = parseInt(slider_control.position*100*4+100)
                }
            }
            onValueChanged: {
                slider_control.getValueChanged(value)
            }
        }
    }
    Rectangle{
        id:txtArea
        x: controlArea.x+controlArea.width
        y:0
        width: 25
        height: 40
        color: "#bdbebf"
        Text {
            anchors.centerIn: parent
            id: txtValueSlider
            rotation: 90
        }
    }
}

