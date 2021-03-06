import QtQuick 2.5

Rectangle {
    id: container

    property string fontName: "Helvetica"
    property int fontSize: 10
    property color fontColor: "black"
    property bool fontBold: false
    property string text: "NOT SET"
    property string bgImage: "qrc:/Images/list_item.png"

    property string bgImageSelected: "qrc:/Images/list_item_selected.png"
    property string bgImagePressed: "qrc:/Images/list_item_pressed.png"
    property string bgImageActive: "qrc:/Images/list_item_active.png"
    property bool selected: false
    property bool selectable: false
    property int textIndent: 0
    signal clicked
    x: 0
    y: 0
    width: 300
    height: 45
    clip: true
    onSelectedChanged: selected ? state = 'selected' : state = ''

    BorderImage {
        id: background
        //border { top: 9; bottom: 36; left: 35; right: 35; }
        source: bgImage
        anchors.fill: parent
        MouseArea{
            anchors.fill: parent
            onPressed: {
                container.clicked();
                selected = !selected
            }
        }
    }

    Text {
        id: itemText
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
            topMargin: 4
            bottomMargin: 4
            leftMargin: 8 + textIndent
            rightMargin: 8
            verticalCenter: container.verticalCenter
        }
        font {
            family: container.fontName
            pointSize: container.fontSize
            bold: container.fontBold
        }
        color: container.fontColor
        elide: Text.ElideRight
        text: container.text
        verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
        anchors.fill: parent
        id: mouseArea
        onPressed: {
            container.clicked();
            selected = !selected
        }
    }

    states: [
        State {
            name: 'pressed'; when: mouseArea.pressed
            PropertyChanges { target: background; source: bgImagePressed; border { left: 35; top: 35; right: 35; bottom: 10 } }
        },
        State {
            name: 'selected'
            PropertyChanges { target: background; source: bgImageSelected; border { left: 35; top: 35; right: 35; bottom: 10 } }
        },
        State {
            name: 'active';
            PropertyChanges { target: background; source: bgImageActive; }
        }
    ]
}
