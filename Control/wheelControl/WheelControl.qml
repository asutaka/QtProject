import QtQuick 2.5
import QtQuick.Controls 2.0

Item {
    property int wheelDiameter: 100
    signal getCurrentValue(int _value)
    Rectangle{
        width: wheelDiameter + 10
        height: wheelDiameter + 10
        radius: width/2
        color: "#FFFFCC"
        Rectangle{
            x: wheelDiameter/2 +5 -width/2
            y:5
            width: 5
            height: 5
            radius: width/2
            color: "red"
        }

        Dial {
            id: wheelControl
            x: 5
            y: 5
            width: wheelDiameter
            height: width
            from: 1
            value: 1
            to: 12
            wrap: true
            stepSize: 1
            Image {
                id: image1
                width: wheelDiameter
                height: width
                source: "qrc:/Images/cycle.png"
            }
            background: Rectangle {
                width: wheelDiameter
                height: width
                color: "#788287"
                radius: width / 2
                //border.color: wheelControl.pressed ? "#17a81a" : "#21be2b"
                border.color: "#FFFFCC"
                border.width: 2
                opacity: wheelControl.enabled ? 1 : 0.5
                Text {
                    id: txtValue
                    anchors.centerIn: parent
                    font.pixelSize: 35
                    font.bold: true
                    color: "#FFFFCC"
                    text: parseInt(wheelControl.value)
                }
            }

            handle:Rectangle {
                id: handleItem
                x: wheelControl.background.x + wheelControl.background.width / 2 - width / 2
                y: wheelControl.background.y + wheelControl.background.height / 2 - height / 2
                width: 16
                height: 16
                color: wheelControl.pressed ? "#17a81a" : "#21be2b"
                radius: 8
                antialiasing: true

                opacity: wheelControl.enabled ? 1 : 0.5
                transform: [
                    Translate {
                        y: -Math.min(wheelControl.background.width, wheelControl.background.height) * 0.4 + handleItem.height / 2
                    },
                    Rotation {
                        angle: wheelControl.angle
                        origin.x: handleItem.width / 2
                        origin.y: handleItem.height / 2
                    }
                ]
            }
//            ToolTip {
//                id:toolTip
//                parent: wheelControl.handle
//                visible: wheelControl.pressed
//                text: parseInt(wheelControl.value)
//            }
            onValueChanged: {
                //wheelControl.getCurrentValue(value);
            }
        }
    }
}
