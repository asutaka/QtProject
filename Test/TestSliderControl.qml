import QtQuick 2.0
import "qrc:/Control/slideControl"
import ControlApp 1.0
Item {
    property alias objTestSlideControlVM: testSliderControlVM
    TestVM {
        id:testSliderControlVM
    }
    Rectangle{
        x:0
        y:0
        width: 1024
        height: 640
        //color: "#5a6469"
        color: "#000000"
        border.color: "#EEEED1"
        border.width: 3

        Canvas{
            anchors.fill: parent
            onPaint: {
                var ctx =getContext("2d");
                ctx.strokeStyle ="#EEEED1"
                ctx.lineWidth ="3"
                ctx.moveTo(341,0)
                ctx.lineTo(341,640)
                ctx.stroke()

                ctx.moveTo(682,0)
                ctx.lineTo(682,640)
                ctx.stroke()

                ctx.moveTo(0,320)
                ctx.lineTo(1024,320)
                ctx.stroke()
            }
        }
        Text {
            id: txtSliderVer1
            x:20
            y:10
            font.pixelSize: 20
            color: "#EEEED1"
            text: qsTr("Slider Control Ver.1")

        }
        SlideControl {
            x: 40
            y:140
        }
        Text {
            id: txtSliderVer2
            x:20+341
            y:10
            font.pixelSize: 20
            color: "#EEEED1"
            text: qsTr("Slider Control Ver.2")
        }
        SlideControl2V{
            x: 441
            y: 280
            rotation: -90
            heightBgr: 8
            widthBound:170
            widthBgr: 150
            widthHandle: 10
        }
        Text {
            id: txtSliderVer3
            x:20+682
            y:10
            font.pixelSize: 20
            color: "#EEEED1"
            text: qsTr("Slider Control Ver.3")
        }
        SlideControl3V{
            x: 40+682
            y: 140
            heightBgr:30
            widthBgr:150
            widthHandle: 6
            heightHandle:28
            colorBackgroundParent: "#5a6469"
        }
        Text {
            id: txtSliderVer4
            x:20
            y:10 +320
            font.pixelSize: 20
            color: "#EEEED1"
            text: qsTr("Slider Control Ver.4")
        }
        SlideControl4V{
            x: 40
            y: 140 +320

        }
    }
    Component.onCompleted: {
        objTestSlideControlVM.onLoad();
    }
}
