import QtQuick 2.0

Item {
    id : clock
    rotation: 180
    width: 244
    height: 244
    property alias city: cityLabel.text
    property int hours
    property int minutes
    property int seconds
    property real shift
    property bool night: false
    property bool internationalTime: true

    function timeChanged() {
        var date = new Date;
        hours = internationalTime ? date.getUTCHours() + Math.floor(clock.shift) : date.getHours()
        night = ( hours < 7 || hours > 19 )
        minutes = internationalTime ? date.getUTCMinutes() + ((clock.shift % 1) * 60) : date.getMinutes()
        seconds = date.getUTCSeconds();
    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: clock.timeChanged()
    }

    Item {
        anchors.centerIn: parent
        width: 244
        height:244

        Image {
            anchors.fill: parent;
            id: background;
            width: 244
            height: 244
            source: "qrc:/Images/base.png";
            visible: clock.night == false
        }

        Image {
            anchors.fill: parent;
            width: 244
            height: 244
            source: "qrc:/Images/base.png";
            visible: clock.night == true
        }

        Image {
            x: 115; y: 0
            width: 15
            height: 244
            source: "qrc:/Images/hour.png"
            transform: Rotation {
                id: hourRotation
                origin.x: 7.5; origin.y: 122;
                angle: (clock.hours * 30) + (clock.minutes * 0.5)
                Behavior on angle {
                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                }
            }
        }

        Image {
            x: 115; y: 0
            width: 15
            height: 244
            source: "qrc:/Images/minute.png"
            transform: Rotation {
                id: minuteRotation
                origin.x: 7.5; origin.y: 122;
                angle: clock.minutes * 6
                Behavior on angle {
                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                }
            }
        }

        Image {
            x: 115; y: 0
            width: 15
            height: 244
            source: "qrc:/Images/second.png"
            transform: Rotation {
                id: secondRotation
                origin.x: 7.5; origin.y: 122;
                angle: clock.seconds * 6
                Behavior on angle {
                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                }
            }
        }

        Text {
            id: cityLabel
            y: 70; anchors.horizontalCenter: parent.horizontalCenter
            color: "#EEEEEE"
            rotation:180
            font.family: "MS-Gothic"
            font.pixelSize: 18
            style: Text.Raised; styleColor: "black"
        }
    }
}
