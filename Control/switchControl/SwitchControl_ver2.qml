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
    property color rectUnSelected: "#1a4670"
    property color rectSelected: "#e0893d"
    property color boderRect: "#B0B0B0"
    property color textSelect: "#161111"
    property color textUnSelect: "white"

    signal switchButton(bool isLeft)

    width: 162
    height: 40
    radius: 5
    border.width: 2
    border.color: boderRect
    color: "#0f0f0f"

    Rectangle{
        id: btnLeft
        width: 78
        height: 36
        x: 2
        y: 2
        radius: 5
        border.width: 2
        border.color: "#161111"
        color: isLeft? rectSelected : rectUnSelected
        Text{
            anchors.centerIn: parent
            text: textLeft
            color: isLeft? textSelect : textUnSelect
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
        height: 36
        x: 80
        y: 2
        radius: 5
        border.width: 2
        border.color: "#161111"
        color: !isLeft? rectSelected : rectUnSelected
        Text{
            anchors.centerIn: parent
            text: textRight
            color: !isLeft? textSelect : textUnSelect
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
