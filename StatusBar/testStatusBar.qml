import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import QtQml 2.2
import "../Control"

Item {
    property point pos
    Rectangle {
        id: statusBar
        height: 64
        width: 1024
        color: "#161616"
        Image {
            id: logo
            x: 5
            y: 5
            source: "../Images/ic_anritsu.PNG"
        }
        Rectangle {
            id: areaStatus
            x: 5 + logo.width
            y: 0
            height: 64
            width: 800
            color: "transparent"
            Text {
                id: txtStatus
                x: 5
                width: 700
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 30
                text: "XBar R/S screen is fetching - Access level 2"
                color: "#D1D1D1"
            }
            Component.onCompleted: playbanner.start()
            SequentialAnimation {
                id: playbanner
                running: true
                NumberAnimation {
                    target: txtStatus
                    property: "x"
                    loops: Animation.Infinite
                    to: 800
                    duration: 30000}
            }
        }
        /*
        Rectangle {
            id: btnMenu
            x: 980
            y: 10
            width: 44
            height: 44
            color: "transparent"
            Canvas {
                id: unselected
                visible: true
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d");
                    var centerY = height/2 - 15;
                    ctx.beginPath();
                    ctx.fillStyle = "#A5DFE2";
                    ctx.moveTo(8, centerY);
                    ctx.arc(8, centerY, 5, 0, Math.PI * 2);
                    ctx.lineTo(8, centerY);
                    ctx.fill();

                    ctx.beginPath();
                    ctx.fillStyle = "#A5DFE2";
                    ctx.moveTo(21, centerY);
                    ctx.arc(21, centerY, 5, 0, Math.PI * 2);
                    ctx.lineTo(21, centerY);
                    ctx.fill();

                    ctx.beginPath();
                    ctx.fillStyle = "#A5DFE2";
                    ctx.moveTo(34, centerY);
                    ctx.arc(34, centerY, 5, 0, Math.PI * 2);
                    ctx.lineTo(34, centerY);
                    ctx.fill();
                }
            }
            Canvas {
                id: selected
                visible: false
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d");
                    var centerX = width/2 + 10;
                    ctx.beginPath();
                    ctx.fillStyle = "#A5DFE2";
                    ctx.moveTo(centerX, 8);
                    ctx.arc(centerX, 8, 5, 0, Math.PI * 2);
                    ctx.lineTo(centerX, 8);
                    ctx.fill();

                    ctx.beginPath();
                    ctx.fillStyle = "#A5DFE2";
                    ctx.moveTo(centerX, 21);
                    ctx.arc(centerX, 21, 5, 0, Math.PI * 2);
                    ctx.lineTo(centerX, 21);
                    ctx.fill();

                    ctx.beginPath();
                    ctx.fillStyle = "#A5DFE2";
                    ctx.moveTo(centerX, 34);
                    ctx.arc(centerX, 34, 5, 0, Math.PI * 2);
                    ctx.lineTo(centerX, 34);
                    ctx.fill();
                }
            }
            MouseArea {
                id: mouseMenu
                anchors.fill: parent
                onPressed: {
                    if(unselected.visible){
                        unselected.visible = false
                        selected.visible = true
                        var rct = Qt.rect(770,10,menuList.widthItem, menuList.heightItem)
                        menuList.__popup(rct)
                    }
                }
            }
        }   

        QuickMenu {
            id: menuList
            MenuItem {
                text: "Connect Server"
                onTriggered: {
                    ObjData.connectQml();
                }
            }

            MenuItem {
                text: "Change Language"
                onTriggered: {
                    var component = Qt.createComponent("../Dialog/SwitchLanguage.qml");
                    appWindow.showDialog(component,300,400);
                }
            }

            MenuItem {
                text: "Change Access Level"
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
