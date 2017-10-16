import QtQuick 2.0
import QtQuick.Layouts 1.2

Item {
    default property var contentItem: null
    property int _margin: 10
    property int textSize: 20
    property int heightItem: 40
    property string title
    property bool current: false
    property bool child: false

    id: root
    Layout.fillWidth: true
    height: heightItem
    Layout.fillHeight: current

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: bar
            Layout.fillWidth: true
            height: heightItem
            color:  root.current ? "#81BEF7" : "#CEECF5"
            border.color: "darkgreen"

            Text {
                anchors.fill: parent
                anchors.margins: _margin
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: root.title
                font.pixelSize: textSize
            }

            Text {
                anchors{
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                    margins: 10
                }
                visible: child ? false: true
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                text: root.current ? "-" : "+"
                font.pixelSize: 24
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    root.current = !root.current;
                    if(root.parent.currentItem !== null && root.parent.currentItem !== root) {
                        root.parent.currentItem.current = false;
                    }
                    root.parent.currentItem = root;
                }
            }
        }

        Rectangle {
            id: container
            color: "#CEECF5"
            border.color: "darkgreen"
            Layout.fillWidth: true
            anchors.top: bar.bottom
            implicitHeight: root.height - bar.height
            clip: true
            Behavior on implicitHeight {
                PropertyAnimation { duration: 100 }
            }
        }

        Component.onCompleted: {
            if(root.contentItem !== null){
                root.contentItem.parent = container;
            }
        }
    }
}
