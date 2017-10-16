import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Rectangle {
    id: switchControl
    property bool isLeft: true
    property string textLeft
    property string textRight

    signal switchButton(bool isLeft)

    width: 164
    height: 44
    border.width: 2
    border.color: "#B0B0B0"
    color: "#0f0f0f"

    Rectangle{
        id: btnLeft
        width: 80
        height: 40
        x: 2
        y: 2
        border.width: 2
        border.color: "#161111"
        color: isLeft? "#f79642" : "#1a4670"
        Text{
            anchors.centerIn: parent
            text: textLeft
            color: isLeft? "#161111" : "white"
            font.pixelSize: 24
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                isLeft = true
                switchControl.switchButton(isLeft);
            }
        }
    }

    Rectangle{
        id: btnRight
        width: 80
        height: 40
        x: 82
        y: 2
        border.width: 2
        border.color: "#161111"
        color: !isLeft? "#f79642" : "#1a4670"
        Text{
            anchors.centerIn: parent
            text: textRight
            color: !isLeft? "#161111" : "white"
            font.pixelSize: 24
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                isLeft = false
                switchControl.switchButton(isLeft);
            }
        }
    }
}
