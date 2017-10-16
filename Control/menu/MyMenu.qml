import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Menu {
    property int widthItem: 200
    property int heightItem: 50

    style:MenuStyle {
        itemDelegate {
            background: Rectangle {
                color: styleData.selected ? "#f79642" : "#1a4670"
                border.color: "#8ca6bd"
                Image {
                    id: iconImage
                    x: 10
                    anchors.verticalCenter: parent.verticalCenter
                    source: styleData.iconSource
                }
            }

            label: Text {
                x: (styleData.iconSource.toString() !== "") ? 35: 0
                width:widthItem
                height: heightItem
                verticalAlignment : Text.AlignVCenter
                color: styleData.selected ? "black" : "white"
                font.pointSize: 14
                text: styleData.text
            }
        }
    }
}

