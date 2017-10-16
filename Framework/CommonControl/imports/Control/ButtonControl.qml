import QtQuick 2.0

BorderImage {
    id: button
    property alias text: buttonText.text
    property string op: buttonText.op
    property string valEsc:"0"
    property alias shiftText: buttonShiftText.text
    property string shiftOp: "123"//buttonShiftText.op
    property  string imgSource: ""

    signal clicked(string op)

    width: 60
    height: 60

    //source: "../Images/statistics_btn_on.png";
    clip: true
    border { left: 10; top: 10; right: 10; bottom: 10 }

    Rectangle {
        id: shade
        anchors {fill: button;}
        radius: 70;
        color: "lightgreen";
        opacity: 0.5
        Image{
            anchors.fill: parent
            anchors.leftMargin: 6
            anchors.rightMargin: 10
            anchors.topMargin: 15
            anchors.bottomMargin: 13
            opacity: 1
            source:imgSource
        }
    }

    Text {
        id: buttonText
        anchors { centerIn: parent; }
        font.family: "Times New Roman"
        font.bold: true
        font.pixelSize: parent.width > parent.height ? parent.height * .6 : parent.width * .6
        style: Text.Sunken;
        opacity:1
        color: "white";
        styleColor: "white";
        smooth: true
    }

    Text {
        id: buttonShiftText
        anchors {
            top: parent.top
            right: parent.right
            rightMargin: 8
        }

        font.pixelSize: parent.width > parent.height ? parent.height * .25 : parent.width * .25
        color: "white";
        styleColor: "black";
        smooth: true
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: button.clicked(op)
        onPressAndHold: button.clicked(valEsc);
    }

    states: State {
        name: "pressed"; when: mouseArea.pressed == true
        PropertyChanges { target: shade; opacity: .7; }
    }
}
