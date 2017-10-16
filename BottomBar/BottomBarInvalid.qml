import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import "../Control/menu"

Item {
    id: bottomBarInvalid
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

        ToolButton {
            id: toolButton_Back
            x: 0
            y: 0
            width: 104
            height: 64
            Image {
                anchors.fill: parent
                id: imgBack
                source: "../Images/contbar_btn_104.png"
                Text {
                    text: "Back"
                    anchors.verticalCenterOffset: 16
                    anchors.horizontalCenterOffset: 0
                    anchors.bottomMargin: -16
                    font.family: "MS Gothic"
                    font.pixelSize: 27
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
                hoverEnabled: true
                onPressAndHold:{
                    imgBack.source= "../Images/contbar_btn_touched_104.png";
                }
                onPressed: {
                    imgBack.source= "../Images/contbar_btn_touched_104.png";
                    loaderContent.source="../MenuScreen/Menu.qml";
                    loaderBottomBar.source= "BottomBarMenu.qml";
                }
                onReleased:{
                    imgBack.source= "../Images/contbar_btn_104.png";
                }
                onCanceled: {
                    imgBack.source= "../Images/contbar_btn_104.png";
                }
            }
        }

        ToolButton {
            id: toolButton_Function
            x: 939
            y: 0
            width: 84
            height: 64
            Image{
                id:imgFn
                anchors.fill: parent
                source:"../Images/contbar_btn_function.png"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgFn.source= "../Images/contbar_btn_touched_function.png"
                }
                onReleased:{
                    imgFn.source= "../Images/contbar_btn_function.png"
                    if(menuSelection.visible){
                        menuSelection.__popup(Qt.rect(768,640-71,0,0),0,0);
                    }
                    else{
                        menuSelection.__closeAndDestroy();
                    }
                }
                onCanceled:
                {
                    imgFn.source= "../Images/contbar_btn_function.png"
                }
            }
        }

        ToolButton {
            id: toolButton_Enable
            x: 603
            y: 0
            width: 168
            height: 64
            Image{
                id:imgEnable
                anchors.fill: parent
                source:"../Images/contbar_btn_168.png"
                Text {
                    x : 40
                    y : 17
                    text: "Enable"
                    font.family: "MS Gothic"
                    font.pixelSize: 27
                    color: "#ffffff"
                }
                Image {
                    id: iconEnable
                    x: 3
                    y: 17
                    source: "../Images/contbar_icon_yuko.png"
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgEnable.source= "../Images/contbar_btn_touched_168.png";
                    iconEnable.source= "../Images/contbar_icon_yuko_p.png";
                    contentItem.invalidLineScreen.clickEnable();
                }
                onReleased:{
                    imgEnable.source= "../Images/contbar_btn_168.png"
                    iconEnable.source= "../Images/contbar_icon_yuko.png";
                }
                onCanceled:
                {
                    imgEnable.source= "../Images/contbar_btn_168.png"
                    iconEnable.source= "../Images/contbar_icon_yuko.png";
                }
            }
        }

        ToolButton {
            id: toolButton_Disable
            x: 771
            y: 0
            width: 168
            height: 64
            Image{
                id:imgDisable
                anchors.fill: parent
                source:"../Images/contbar_btn_168.png"
                Text {
                    x : 40
                    y : 17
                    text: "Disable"
                    font.family: "MS Gothic"
                    font.pixelSize: 27
                    color: "#ffffff"
                }
                Image {
                    id: iconDisable
                    x: 3
                    y: 17
                    source: "../Images/contbar_icon_muko.png"
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgDisable.source= "../Images/contbar_btn_touched_168.png";
                    iconDisable.source= "../Images/contbar_icon_muko_p.png";
                    contentItem.invalidLineScreen.clickDisable();
                }
                onReleased:{
                    imgDisable.source= "../Images/contbar_btn_168.png"
                    iconDisable.source= "../Images/contbar_icon_muko.png";
                }
                onCanceled: {
                    imgDisable.source= "../Images/contbar_btn_168.png"
                    iconDisable.source= "../Images/contbar_icon_muko.png";
                }
            }
        }
    }

    MyMenu {
        id: menuSelection
        MenuItem {
            text: "Clear selection"
            onTriggered: {
                contentItem.invalidLineScreen.clearSelection();
            }
        }
        MenuItem {
            text: "Select all"
            onTriggered: {
                contentItem.invalidLineScreen.selectAll();
            }
        }
        MenuItem {
            text: "Change selection"
            onTriggered: {
                contentItem.invalidLineScreen.changeSelection();
            }
        }
    }
}
