import QtQuick 2.5
import QtQuick.Controls 2.0

Slider {
    property int widthBgr: 200
    property int heightBgr: 4
    property int widthHandle: 26
    property int heightHandle: 26
    signal getValueChanged (int _value)
    id: slider_control
    orientation: Qt.Horizontal
    from: 100
    value: 100
    to: 1000
    stepSize: 10
    //snapMode: Slider.SnapOnRelease

    background: Rectangle {
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
            color: "#21be2b"
            radius: 2
        }
    }

    handle: Rectangle {
        x: slider_control.leftPadding + slider_control.visualPosition * (slider_control.availableWidth - width)
        y: slider_control.topPadding + slider_control.availableHeight / 2 - height / 2
        implicitWidth: widthHandle
        implicitHeight: heightHandle
        radius: 13
        color: slider_control.pressed ? "#f0f0f0" : "#f6f6f6"
        border.color: "#bdbebf"
        onXChanged: {
            toolTip.text = parseInt(slider_control.position*100*9+100)
        }
    }

    ToolTip {
        id:toolTip
            parent: slider_control.handle
            visible: slider_control.pressed
            text: parseInt(value)
    }

    onValueChanged: {
        slider_control.getValueChanged(value)
    }
}
