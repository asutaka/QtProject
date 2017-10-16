import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import QtQml 2.2
import "../Control"
import "../Control/VirtualKey.js" as Ops

Item {
    Rectangle {
        id: testBottomBar
        height: 64
        width: 1024
        color: "#161616"

        Text {
            id: txtStatus
            anchors.centerIn: parent
            font.pixelSize: 30
            text: "Prototype-Application version 2017.02.27"
            color: "#D1D1D1"
        }

        Rectangle {
            id: btnMenu
            x: 10
            y: 15
            visible: true
            width: 44
            height: 44
            color: "transparent"

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.fillStyle = "#A5DFE2";
                    ctx.fillRect(0, 0, 40, 10);
                    ctx.fillRect(0, 15, 40, 10);
                    ctx.fillRect(0, 30, 40, 10);
                }
            }

            MouseArea {
                id: mouseMenu
                anchors.fill: parent
                onPressed: {
                    idSwipe.isShowEnable ? Ops.hideDisplayMenu(): Ops.showDisplayMenu()
                }
            }
        }
        /*
        QuickMenu {
            id: botMenu

            MenuItem {
                text: "Menu"
                onTriggered: {
                    loaderContent.source="../MenuScreen/Menu.qml";
                    loaderBottomBar.source= "BottomBarMenu.qml"
                }
            }

            MenuItem {
                text: "Display"
                onTriggered: {
                    unselected.visible = true
                    selected.visible = false
                }
            }

            MenuItem {
                text: "Ope. Check"
                onTriggered: {
                    unselected.visible = true
                    selected.visible = false
                }
            }

            MenuItem {
                text: "Prod Ctnl"
                onTriggered: {
                    unselected.visible = true
                    selected.visible = false
                }
            }

            MenuItem {
                text: "Set/Adjust"
                onTriggered: {
                    unselected.visible = true
                    selected.visible = false
                }
            }

            onAboutToHide: {
                unselected.visible = true
                selected.visible = false
            }
        }
        */
    }
}
