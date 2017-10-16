import QtQuick 2.5
import QtQuick.Controls 2.0

Item {
    property int wheelDiameter: 70

    Rectangle{
        id: wheelArea
        width: wheelDiameter * 2.5
        height: wheelDiameter * 1.5
        radius: 5
        color: "#dce0e1"
        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                var pointX= 10+wheelDiameter/2;
                var pointY=wheelDiameter/2 +wheelDiameter/4;

                ctx.strokeStyle  ="#54585b"
                ctx.lineWidth =2;
                ctx.moveTo(pointX, pointY);
                ctx.lineTo(10+wheelDiameter, wheelDiameter/4);
                ctx.lineTo(10+wheelDiameter+20 , wheelDiameter/4);
                ctx.stroke();

                ctx.lineWidth =2;
                ctx.moveTo(pointX, pointY);
                ctx.lineTo(10+wheelDiameter, wheelDiameter/2+5);
                ctx.lineTo(10+wheelDiameter+20 , wheelDiameter/2+5);
                ctx.stroke();

                ctx.lineWidth =2;
                ctx.moveTo(pointX, pointY);
                ctx.lineTo(10+wheelDiameter, wheelDiameter -5);
                ctx.lineTo(10+wheelDiameter+20 , wheelDiameter -5);
                ctx.stroke();

                ctx.lineWidth =2;
                ctx.moveTo(pointX, pointY);
                ctx.lineTo(10+wheelDiameter, wheelDiameter*1.25);
                ctx.lineTo(10+wheelDiameter+20 , wheelDiameter*1.25);
                ctx.stroke();

            }
        }
        Text {
            id: selection1
            x: wheelDiameter +40
            y: wheelDiameter/4 -font.pixelSize
            font.pixelSize: 10
            color: "#54585b"
            text: "100  ms"
        }
        Text {
            id: selection2
            x: wheelDiameter +40
            y: wheelDiameter/2+5 -font.pixelSize
            font.pixelSize: 10
            color: "#54585b"
            text: "200  ms"
        }
        Text {
            id: selection3
            x: wheelDiameter +40
            y: wheelDiameter -5 -font.pixelSize
            font.pixelSize: 10
            color: "#54585b"
            text: "300  ms"
        }
        Text {
            id: selection4
            x: wheelDiameter +40
            y: wheelDiameter*1.25 -font.pixelSize
            font.pixelSize: 10
            color: "#54585b"
            text: "1000 ms"
        }

        Dial {
            signal getCurrentValue(int _value)
            id: wheelControl
            x: 10
            y: (wheelArea.height -wheelControl.height) / 2
            width: wheelDiameter
            height: width
            from: 1
            value: 1
            to: 4
            wrap: true
            stepSize: 1
            snapMode: Dial.SnapOnRelease

            background: Rectangle {
                width: wheelDiameter
                height: width
                color: "#788287"
                radius: width / 2
                border.color: "#e4e5e6"
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
                    source: "qrc:/Images/wheels_btn3.png"
                    transform: [
                        Translate {
                            y: 0
                        },
                        Rotation {
                            angle: wheelControl.angle/3 +95
                            origin.x: (handleBackGr.width/2)
                            origin.y: (handleBackGr.width/2)
                        }
                    ]
                }

            }
            Rectangle {
                visible: true
                id: handleItem
                x: wheelControl.background.x + wheelControl.background.width / 2 - width / 2
                y: wheelControl.background.y + wheelControl.background.height / 2 - height / 2
                width: 3
                height: 15
                color: wheelControl.pressed ? "#54585b" : "#757d83"
                radius: 2
                antialiasing: true
                opacity: wheelControl.enabled ? 1 : 0.5
                transform: [
                    Translate {
                        y: -Math.min(wheelControl.background.width, wheelControl.background.height) * 0.4 + handleItem.height / 2 -2
                    },
                    Rotation {
                        angle: wheelControl.angle/3 +95
                        origin.x: handleItem.width/2
                        origin.y: handleItem.height/2
                    }
                ]
            }

            onValueChanged: {
                wheelControl.getCurrentValue(value)
            }
        }

    }
}
