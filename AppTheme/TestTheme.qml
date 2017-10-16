import QtQuick 2.0
import ControlApp 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    x:0
    y:0
    width: 1024
    height: 640
    ThemeScreen{
        id: themeScreen
        width: 1024
        height: 640
        Rectangle{
            width: parent.width
            height: 50
            color: "#EEECEC"
            Text{
                x: 35
                y: 17
                text: "Theme :"
                font.pixelSize: 14
                font.bold: true
            }
            ComboBox {
                id: cb_Theme
                currentIndex: themeScreen.getTheme()
                x: 100
                y: 10
                width: 200
                height: 30
                model: [ "Black", "Blue Cerulean", "Dark","Brown Sand", "Blue NCS", "High Contrast","Blue Icy", "Qt" ]
                style: ComboBoxStyle {
                    id: comboBox
                    background: Rectangle {
                        id: rectCategory
                        radius: 5
                        border.width: 2
                        color: "#fff"
                    }
                    label: Text {
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 14
                        color: "black"
                        text: control.currentText
                    }
                }
                onCurrentIndexChanged: {
                    themeScreen.setTheme(cb_Theme.currentIndex);
                }
            }
        }
    }
}
