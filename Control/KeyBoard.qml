import QtQuick 2.0
import QtQuick.Controls 1.4
import "../Common"
Rectangle{
    signal keyInput(string text)
    id: retcKeyboard
    width: parent.width
    height: parent.height
    color: "transparent"
    state: parent.activeFocus ? "active" : "inactive"
    visible: (retcKeyboard.state == "active")? true : false
    Rectangle{
        y: 0
        x: 0
        width: parent.width
        height: 468*scale_factor
        color: "transparent"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                inputKeyboard.visible= false;
                inputKeyboard.objText.text = "";
                retcKeyboard.state ="inactive"
            }
        }
    }

    Rectangle{
        id: rectKeyboard
        width: parent.width
        height: 300*mainWindow.height/768
        y: 468*mainWindow.height/768
        color: "transparent"
        QwertyLayout{
            id:inputPanel
            anchors.centerIn: parent
            scale: parent.width/1024
            onKeyClick: {
                retcKeyboard.keyInput(text);
            }
        }
    }
    states: [
        State {
            name: "active"
            PropertyChanges { target: retcKeyboard; y: 0 }
        },
        State {
            name: "inactive"
            PropertyChanges { target: retcKeyboard; y: 768 }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            target: retcKeyboard
            property: "y"
            easing.type: "OutQuad"
            duration: 250
        }
    }
}

