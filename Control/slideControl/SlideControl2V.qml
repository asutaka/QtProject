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
    property Slider sliderObj
    property int slideValue: 100
    property int fromValue: 100
    property int startValue: 100
    property int toValue: 400
    property int stepSizeValue: 100
    property string text1: "100"
    property string text2: "100"
    property string text3: "100"
    property string text4: "100"
    property string text5: "100"
    signal getValueChanged (int _value)
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
            text: text1
            rotation: 90
        }
        Text {
            id: txt2
            x: rectBrg.x+2+rectBrg.width/4 -font.pixelSize/2
            y: rectBrg.y+rectBrg.height +20+10
            font.pixelSize: 15
            color: "#bdbebf"
            text: text2
            rotation: 90
        }
        Text {
            id: txt3
            x: rectBrg.x+rectBrg.width/2 -font.pixelSize/2
            y: rectBrg.y+rectBrg.height +20+10
            font.pixelSize: 15
            color: "#bdbebf"
            text: text3
            rotation: 90
        }
        Text {
            id: txt4
            x: rectBrg.x-2+rectBrg.width*3/4 -font.pixelSize/2
            y: rectBrg.y+rectBrg.height +20+10
            font.pixelSize: 15
            color: "#bdbebf"
            text: text4
            rotation: 90
        }
        Text {
            id: txt5
            x: rectBrg.x-5+rectBrg.width -font.pixelSize/2
            y: rectBrg.y+rectBrg.height +20+10
            font.pixelSize: 15
            color: "#bdbebf"
            text: text5
            rotation: 90
        }
        Slider {

            anchors.bottomMargin: 0
            id: slider_control
            orientation: Qt.Horizontal
            from: fromValue
            value: startValue
            to: toValue
            stepSize: stepSizeValue
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
                    txtValueSlider.text = parseInt(slider_control.position*stepSizeValue*4+stepSizeValue)
                }
            }
            onValueChanged: {
                slideValue = slider_control.value
                name.getValueChanged(slideValue)
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
            font.pixelSize: 18
        }
    }
}

