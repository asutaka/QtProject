import QtQuick 2.5
import QtQuick.Controls 2.0

Item {
    property int wheelDiameter: 100
    Rectangle{
        id: wheelArea
        width: wheelDiameter + 40
        height: wheelDiameter + 40
        radius: width/2
        color: "#606060"
        Image {
            anchors.fill: parent
            id: image1
            source: "qrc:/Images/wheel_edge.png"
        }
        Dial {
            signal getCurrentValue(int _value)
            id: wheelControl
            x: 20
            y: 20
            width: wheelDiameter
            height: width
            from: 1
            value: 1
            to: 12
            wrap: true
            stepSize: 5

            background: Rectangle {
                width: wheelDiameter
                height: width
                color: "#788287"
                radius: width / 2
                border.color: "#FFFFCC"
                border.width: 2
                opacity: wheelControl.enabled ? 1 : 0.5

            }
            handle:
                Rectangle{
                color: "transparent"
                Image {
                    id: handleBackGr
                    width: wheelDiameter
                    height: wheelDiameter
                    source: "qrc:/Images/wheel_center.png"
                    transform: [
                        Rotation {
                            angle: wheelControl.angle
                            origin.x: (handleBackGr.width/2)
                            origin.y: (handleBackGr.width/2)
                        }
                    ]
                }

            }
            Rectangle {
                id: handleItem
                x: wheelControl.background.x + wheelControl.background.width / 2 - width / 2
                y: wheelControl.background.y + wheelControl.background.height / 2 - height / 2
                width: 5
                height: 20
                color: wheelControl.pressed ? "#3d9fc9" : "#3cb4e7"
                radius: 2
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
            onValueChanged: {
                wheelControl.getCurrentValue(value)
            }
        }
    }
    Rectangle{
        y: wheelControl.height+20
        width: wheelArea.width
        height: 20
        color: "transparent"
        Text {
            id: txtValue
            anchors.centerIn: parent
            font.pixelSize: 20
            font.bold: true
            color: "#0066CC"
            text: parseInt(wheelControl.value)
        }
    }
}
