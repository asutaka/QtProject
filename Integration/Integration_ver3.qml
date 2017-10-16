import QtQuick 2.0
import ControlApp 1.0
import QtQuick.Controls 2.0
import "../Control/setZeroButton"

Item {
    id: integration_ver3
    width: 1024
    height: 640
    Image{
        anchors.fill: parent
        source: "../Images/bg12.png"
        Rectangle {
            x: 10
            y: 150
            color: "white"
            height: 480
            width: parent.width -20
            opacity: 0.1
            radius: 10
        }
        Rectangle {
            x: 10
            y: 380
            color: "#0B243B"
            height: 250
            width: parent.width -20
            opacity: 0.4
            radius: 10
            border.color: "#DF7401"
            border.width: 3
        }
        Rectangle {
            x: 13
            y: 383
            color: "#0B243B"
            height: 244
            width: 87
            radius: 5
            opacity: 0.2
        }
        Integration_ver3{
            id: drawContent
            width: 1024
            height: 640
        }
        SetZero {
            id:zrButton
            x: 918
            y:4
        }
    }

}
