import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3

Item {
    id: bottomBarMenuList
    Rectangle {
        id: rectBottom
        width: 1024
        height: 64
        color: "#ffffff"
        Image {
            id: imgBgr
            x: 0
            y: 0
            source: "../Images/ControlBar_bg.png"
        }

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
                    loaderContent.source ="../MenuScreen/Menu.qml"
                    loaderBottomBar.source ="BottomBarMenu.qml"
                }
                onPressed: imgBack.source= "../Images/contbar_btn_touched_104.png"
                onReleased: imgBack.source= "../Images/contbar_btn_104.png"
                onCanceled: imgBack.source= "../Images/contbar_btn_104.png"
            }
        }
        ToolButton {
            id: btnChangeScreen
            x: 105
            y: 0
            width: 112
            height: 64
            Image {
                id: imgDisplay
                source: "../Images/contbar_btn_112.png"
                Text {
                    x: 4
                    y: 31
                    text: "Display"
                    font.family: "MS Gothic"
                    font.pixelSize:27
                    color: "#ffffff"
                }
                Image {
                    x: 40
                    y: 5
                    height: 16
                    width:16
                    source: "../Images/dispswitchbtnno1.png"
                }
                Image {
                    x: 61
                    y: 5
                    width: 16
                    height: 16
                    source: "../Images/Icon_Screen_2_on.png"
                }
            }
            MouseArea {
                width: 112
                anchors.fill: parent
                onPressed: imgBack.source= "../Images/contbar_btn_touched_112.png"
                onReleased: imgBack.source= "../Images/contbar_btn_112.png"
                onCanceled: imgBack.source= "../Images/contbar_btn_112.png"
            }
        }
        ToolButton {
            id: btnInput
            x: 730
            y: 0
            width: 168
            height: 64
            Image {
                id: imgInput
                source: "../Images/contbar_btn_168.png"
                Text {
                    x: 62
                    y: 18
                    text: "Input"
                    font.family: "MS Gothic"
                    font.pixelSize:27
                    color: "#ffffff"
                }
                Image {
                    x: 13
                    y: 18
                    source: "../Images/contbar_icon_input.png"
                }
            }
            MouseArea {
                width: 112
                anchors.fill: parent
                onPressed: {
                    imgInput.source= "../Images/contbar_btn_touched_168.png"
                }
                onReleased:{
                    imgInput.source= "../Images/contbar_btn_168.png"
                }
                onCanceled: {
                    imgInput.source= "../Images/contbar_btn_168.png"
                }
            }
        }
    }
}



