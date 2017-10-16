import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Menu {
    property int widthItem: 220
    property int heightItem: 40

    style: MenuStyle {
        itemDelegate {
            background: Rectangle {
                radius: styleData.selected ? 5 : 0
                color: styleData.text === "" ? "transparent" : (styleData.selected ? "#1a4670" : "#919F9D")
                border.color: styleData.text === "" ? "transparent" : "black"
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
                color: styleData.selected ? "white" : "black"
                font.pixelSize: 24
                text: styleData.text
            }
        }
    }
}
