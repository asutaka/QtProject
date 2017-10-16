import QtQuick 2.0

Rectangle {
    id: vk

    property string rotateLeft: "\u2939"
    property string rotateRight: "\u2935"
    property string leftArrow: "\u2190"
    property string upperArrow: "\u2191"
    property string division : "\u00f7"
    property string multiplication : "\u00d7"
    property string squareRoot : "\u221a"
    property string plusminus : "\u00b1"

    signal buttonPressed(string op)

    // span the parent's width
    anchors {
        left: parent.left
        right: parent.right
    }

    // A virtual keyboard (VK) is attached the the bottom of an Item
    // and slides up when activated.
    // this item is called the surface
    property Item surface: parent

    // By default the VK's height is at the bottom of the surface
    y: surface.height

    // Depending on the parent's focus, set the initial state
    state: parent.activeFocus ? "active" : "inactive"
    Rectangle
        {
            x: 230
            y: 0
            width: 60
            height: 325
            opacity:0.8
            color:"transparent"//"#40bd9f"
            radius: 10
        }

    Column {
        id: vkc;

        anchors {
            horizontalCenter: parent.horizontalCenter
            margins: 4
        }

        spacing: 6


        Row {

            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Button { text: "+/\u2013"; op: Qt.Key_Minus;  Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: "("; op: Qt.Key_ParenLeft; Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: ")"; op: Qt.Key_ParenRight; Component.onCompleted: clicked.connect(buttonPressed)}
            Button { imgSource: "../Images/BackSpace.png"; op: Qt.Key_Backspace;valEsc:Qt.Key_Escape; Component.onCompleted: clicked.connect(buttonPressed) }
        }
        Row {

            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Button { text: "1"; op: Qt.Key_1;  Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: "2"; op: Qt.Key_2;  Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: "3"; op: Qt.Key_3;  Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: "+"; op: Qt.Key_Plus;  Component.onCompleted: clicked.connect(buttonPressed)}
        }
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Button { text: "4"; op: Qt.Key_4; Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: "5"; op: Qt.Key_5; Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: "6"; op: Qt.Key_6; Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: "\u2013"; op: Qt.Key_Subtitle; Component.onCompleted: clicked.connect(buttonPressed)}
        }
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Button { text: "7"; op: Qt.Key_7; Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: "8"; op: Qt.Key_8; Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: "9"; op: Qt.Key_9; Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: "\u00d7"; op: Qt.Key_multiply; Component.onCompleted: clicked.connect(buttonPressed)}
        }
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Button { text: "."; op: Qt.Key_Comma ; Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: "0"; op: Qt.Key_0 ; Component.onCompleted: clicked.connect(buttonPressed)}
            Button { text: "="; op: Qt.Key_Equal; Component.onCompleted: clicked.connect(buttonPressed) }
            Button { text: "\u00f7"; op: Qt.Key_division; Component.onCompleted: clicked.connect(buttonPressed) }
        }
    }

    states: [
        State {
            name: "active"
            PropertyChanges { target: vk; y: (surface.height - 8 - vkc.height); }
        },
        State {
            name: "inactive"
            PropertyChanges { target: vk; y: surface.height + 8; }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            target: vk
            property: "y"
            easing.type: "OutQuad"
            duration: 250
        }
    }
}
