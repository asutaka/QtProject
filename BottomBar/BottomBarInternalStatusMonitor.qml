/*import QtQuick 2.0
import QtQuick.Controls 1.3*/
import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.2
import ControlApp 1.0

import "../Control/VirtualKey.js" as Ops
import "../Dialog"

Item {
    id: bottomBarInternalStatusMonitor
    property Item dynamicBotombar: bottomBarInternalStatusMonitor
    width: 609

    Rectangle {
        id: rectBottom
        width: 1024
        height: 64
        color: "#ffffff"
        Image {
            id: rectBottomBkgnd
            x: 0
            y: 0
            source: "../Images/ControlBar_bg.png"
        }
        Row{
            spacing:31
            ToolButton {
                id: btnBack
                x: 0
                y: 0
                width: 104
                height: 64
                Image{
                    id: imgBack
                    anchors.fill: parent
                    source: "../Images/contbar_btn_104.png"
                    Text {
                        text: "Back"
                        anchors.verticalCenterOffset: 16
                        anchors.horizontalCenterOffset: 0
                        anchors.bottomMargin: -16
                        font.family: "MS Gothic"
                        font.pixelSize:32
                        color: "#ffffff"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }
                    Image {
                        x: 37
                        y: 4
                        source: "../Images/contbar_icon_back.png"
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                    mainModel.InnerChangeScreen(ScreenMng.Production)
                    mainModel.InnerChangeBottomBar(ScreenMng.BottomBarMainPage)
                    }
                    onPressed: imgBack.source= "../Images/contbar_btn_touched_104.png"
                    onReleased: imgBack.source= "../Images/contbar_btn_104.png"
                    onCanceled: imgBack.source= "../Images/contbar_btn_104.png"
                }
            }

            ToolButton {
                id: toolButton_ClearBackup
                width: 330
                height: 64
                Image{
                    id: imgBgClearBackup
                    anchors.fill: parent
                    source: "../Images/contbar_btn_168.png"
                    Text {
                        x: 78
                        y: 24
                        text: "ステータスの削除と保存"
                        font.family: "MS Gothic"
                        font.pixelSize: 20
                        color: "#ffffff"
                    }
                    Image {
                        x: 8
                        y: 18
                        source: "../Images/contbar_icon_clear.png"
                    }
                    Image {
                        x: 40
                        y: 18
                        source: "../Images/contbar_icon_backup.png"
                    }
                }
                MouseArea {
                    width: 330
                    anchors.fill: parent
                    onPressed: {
                        imgBgClearBackup.source= "../Images/contbar_btn_touched_168.png"
                    }
                    onReleased:{
                        imgBgClearBackup.source= "../Images/contbar_btn_168.png"
                        var component = Qt.createComponent("../Dialog/StatusMonitorClearBackupDialog.qml");
                        appWindow.showDialog(component,626,480);
                    }
                    onCanceled: {
                        imgBgClearBackup.source= "../Images/contbar_btn_168.png"
                    }
                }
            }
            
            ToolButton {
                id: toolButton_update
                width: 200
                height: 64
                Image{
                    id: imgBgupdate
                    anchors.fill: parent
                    source: "../Images/contbar_btn_168.png"
                    Text {
                        x: 78
                        y: 24
                        text: "更新"
                        font.family: "MS Gothic"
                        font.pixelSize: 20
                        color: "#ffffff"
                    }
                    Image {
                        x: 8
                        y: 18
                        source: "../Images/icon_again.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            imgBgupdate.source= "../Images/contbar_btn_touched_168.png"
                        }
                        onReleased:{
                            imgBgupdate.source= "../Images/contbar_btn_168.png";
                        }
                        onCanceled: {
                            imgBgupdate.source= "../Images/contbar_btn_168.png";
                        }
                    }
                }
                MouseArea {
                    width: 330
                    anchors.fill: parent
                    onPressed: {
                            imgBgupdate.source= "../Images/contbar_btn_touched_168.png"
                    }
                    onReleased:{
                            imgBgupdate.source= "../Images/contbar_btn_168.png"
                    }
                    onCanceled: {
                            imgBgupdate.source= "../Images/contbar_btn_168.png"
                    }
                }
            }
            ToolButton {
                id: toolButton_USB
                width: 200
                height: 64
                Image{
                    id: imgSaveForUSB
                    anchors.fill: parent
                    source: "../Images/contbar_btn_168.png"
                    Text {
                        x: 78
                        y: 24
                        text: "USB保存"
                        font.family: "MS Gothic"
                        font.pixelSize: 20
                        color: "#ffffff"
                    }
                    Image {
                        x: 8
                        y: 18
                        source: "../Images/contbar_icon_save.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            imgSaveForUSB.source= "../Images/contbar_btn_touched_168.png"
                        }
                        onReleased:{
                            imgSaveForUSB.source= "../Images/contbar_btn_168.png";
                        }
                        onCanceled: {
                            imgSaveForUSB.source= "../Images/contbar_btn_168.png";
                        }
                    }
                }
                MouseArea {
                    width: 330
                    anchors.fill: parent
                    onPressed: {
                            imgSaveForUSB.source= "../Images/contbar_btn_touched_168.png"
                    }
                    onReleased:{
                            imgSaveForUSB.source= "../Images/contbar_btn_168.png"
                    }
                    onCanceled: {
                            imgSaveForUSB.source= "../Images/contbar_btn_168.png"
                    }
                }
            }
        }
    }
}
