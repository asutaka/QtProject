import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import Qt.labs.settings 1.0

ApplicationWindow {
    id: window
    width: 1024
    height: 768
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint

    property real scale_factor: Math.min(window.height/640, window.width/1024)

    header: ToolBar {
        id: statusBar
        Material.foreground: "black"
        width: parent.width
        height: 64

        Loader {
            anchors.fill: parent
            source: "pages/StatusBar.qml"
        }
    }

    footer: ToolBar {
        id: bottomBar
        Material.foreground: "white"
        width: parent.width
        height: 64

        Loader {
            anchors.fill: parent
            source: "pages/BottomBarMainPage.qml"
        }
    }

    Rectangle {
        id: rectContent
        anchors.fill: parent
        color: "black"

        Rectangle {
            id: mainContent
            anchors.centerIn: parent
            width: 1024*scale_factor
            height: 640*scale_factor
            color: "black"

            Loader {
                id: loaderContent
                anchors.fill: parent
                source: "pages/Production.qml"
                transform: Scale {
                    xScale: scale_factor
                    yScale: scale_factor
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("window.width: " + window.width)
                    console.log("window.height: " + window.height)
                    console.log("mainContent.width: " + mainContent.width)
                    console.log("mainContent.height: " + mainContent.height)
                    console.log("loaderContent.width: " + loaderContent.width)
                    console.log("loaderContent.height: " + loaderContent.height)
                    console.log("scale_factor: " + scale_factor)
                }
            }
        }
    }
}
