import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import SwitchControlVer5 1.0

Rectangle {
    id: switchControl
    property  SwitchControlVer5 ctrlSwitchControl: swControl
    property bool isLeft: true

    signal switchButton(bool isLeft)

    width: 164
    height: 44
    border.width: 2
    border.color: "#B0B0B0"
    color: "#0f0f0f"
    SwitchControlVer5{
        id:swControl
    }
    Component.onCompleted: {
        updateText();
        console.log("xxxx" + ctrlSwitchControl.isXbar)
    }
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
            id:txtIsprod
            anchors.centerIn: parent
            text: ctrlSwitchControl.isProd
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
            id:txtIsXbar
            anchors.centerIn: parent
            text: ctrlSwitchControl.isXbar
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

    function updateText() {
        console.log("Update text switchControl");
        ctrlSwitchControl.OnChangeLanguage();
        txtIsprod.text = ctrlSwitchControl.isProd;
        txtIsXbar.text = ctrlSwitchControl.isXbar;
    }
}
