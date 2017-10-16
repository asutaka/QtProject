import QtQuick 2.0
Rectangle{
    property TextInput objText: text
    property int txtWidth: 100
    property int txtHeight: 40
    color: "white"
    width: txtWidth
    height: txtHeight
    radius: 5
    TextInput {
        id: text
        clip: true
        color: "#a0a1a2"
        font.pixelSize: 28
        anchors.margins: 5
        anchors.verticalCenter: parent.verticalCenter
        maximumLength: 50
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            text.cursorVisible= true;
            myKeyBoard.state ="active";
        }
    }
}

