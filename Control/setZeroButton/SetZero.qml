import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    ToolButton {
        id: toolButton_Corner
        x: point_corner.x+point_corner.width +5
        y: 0
        width: 54
        height: 54
        Image{
            id: imgCorner
            anchors.fill: parent
            source: "qrc:/Images/zero_icon_off.png"
        }
        MouseArea {
            id: mousea2
            anchors.fill: parent
            onPressed: {
                imgCorner.source= "qrc:/Images/zero_icon_on.png"
            }
            onReleased: {
                imgCorner.source= "qrc:/Images/zero_icon_off.png"
            }
            onCanceled: {
                imgCorner.source= "qrc:/Images/zero_icon_off.png"
            }
        }
    }
    Rectangle {
        id: point_corner
        x:0
        y: toolButton_Corner.width/4
        width: 42
        height: 27
        color: "transparent"
        Image{
            anchors.fill: parent
            source: "qrc:/Images/pointing_hand.png"
        }
        Rectangle{
            y:27
            width: 42
            height: 14
            color: "transparent"
            Text {
                text: qsTr("SetZero")
                color: "yellow"

            }
        }
    }
}
