import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Menu {
    id:quickMenu
    property int widthItem: 200
    property int heightItem: 50
    property string activeColorItem: "#f79642"
    property string backgroundColorItem: "#1a4670"
    property string borderColor: "#8ca6bd"
    property string textColorActive: "black"
    property string textColor: "white"

    style:MenuStyle {
        itemDelegate {
            background: Rectangle {
                color: styleData.selected ? activeColorItem : backgroundColorItem
                border.color: borderColor
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
                color: styleData.selected ? textColorActive : textColor
                font.pointSize: 14
                text: styleData.text
            }
        }
    }
}

