import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtWinExtras 1.0
import QtQuick.Controls.Styles 1.3

Item {
    id: bottombar
    Rectangle {
        id: rectBottom
        x: 0
        y: 704
        width: 1024
        height: 64
        color: "#ffffff"
        Image {
            id: rectBottomBkgnd
            x: 0
            y: 0
            source: "Images/ControlBar_bg.png"
        }

        ToolButton {
            id: toolButton_Menu
            x: 0
            y: 0
            width: 104
            height: 64
            Image {
                anchors.fill: parent
                id: imgMenu
                source: "Images/contbar_btn_104.png"
                Text {
                    text: "Menu"
                    anchors.verticalCenterOffset: 16
                    anchors.horizontalCenterOffset: 0
                    anchors.bottomMargin: -16
                    font.family: "MS Gothic"
                    font.pointSize: 20
                    color: "#ffffff"
                    anchors.bottom: parent.bottom
                    anchors.centerIn: parent
                }
                Image {
                    x: 37
                    y: 4
                    source: "Images/contbar_icon_menu.png"
                }
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onPressAndHold:{
                     imgMenu.source= "Images/contbar_btn_touched_104.png"
                }
                onPressed: {
                    imgMenu.source= "Images/contbar_btn_touched_104.png"
                    loaderContent.source="Menu.qml";
                }
                onReleased:{
                    imgMenu.source= "Images/contbar_btn_104.png"
                }
            }
        }

        ToolButton {
            id: toolButton_ChangeScreen
            x: 105
            y: 0
            width: 112
            height: 64
            Image {
                id: imgDisplay
                source: "Images/contbar_btn_112.png"
                Image {
                    x: 6
                    y: 5
                    height: 16
                    width:16
                    source: "Images/Icon_Screen_1_on.png"
                }
                Text {
                    x: 4
                    y: 31
                    width: 102
                    height: 27
                    text: "Display"
                    font.family: "MS Gothic"
                    font.pointSize: 20
                    color: "#ffffff"
                }

                Image {
                    x: 27
                    y: 5
                    width: 16
                    height: 16
                    source: "Images/dispswitchbtnno2.png"
                }

                Image {
                    x: 48
                    y: 5
                    width: 17
                    height: 16
                    source: "Images/dispswitchbtnno3.png"
                }

                Image {
                    x: 69
                    y: 5
                    width: 17
                    height: 16
                    source: "Images/dispswitchbtnno4.png"
                }

                Image {
                    x: 89
                    y: 5
                    width: 17
                    height: 16
                    source: "Images/dispswitchbtnno5.png"
                }
            }
            MouseArea {
                width: 112
                anchors.fill: parent
                onPressed: {
                    imgDisplay.source= "Images/contbar_btn_touched_112.png"
                }
                onReleased:{
                    imgDisplay.source= "Images/contbar_btn_112.png"
                }
            }
        }

        ToolButton {
            id: toolButton_SetAdj
            x: 768
            y: 0
            width: 170
            height: 64
            Image{
                anchors.fill: parent
                id: imgSetAdj
                source: "Images/w168h62_B.png"
                Text {
                    x: 46
                    y: 19
                    text: "Set/Adj"
                    font.family: "MS Gothic"
                    font.pointSize: 20
                    color: "#ffffff"
                }
                Image {
                    x: 8
                    y: 16
                    source: "Images/contbar_icon_config.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        imgSetAdj.source= "Images/w168h62_B_p.png"
                    }
                    onReleased:{
                        imgSetAdj.source= "Images/w168h62_B.png"
                    }
                }
            }
        }

        ToolButton {
            id: toolButton_ProCntl
            x: 597
            y: 0
            width: 170
            height: 64
            Image{
                anchors.fill: parent
                id: imgProCntl
                source: "Images/w168h62_B.png"
                Text {
                    x: 42
                    y: 19
                    text: "Pro Cntl"
                    font.family: "MS Gothic"
                    font.pointSize: 20
                    color: "#ffffff"
                }
                Image {
                    x: 4
                    y: 17
                    source: "Images/contbar_icon_manage.png"
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgProCntl.source= "Images/w168h62_B_p.png"
                }
                onReleased:{
                    imgProCntl.source= "Images/w168h62_B.png"
                }
            }
        }

        ToolButton {
            id: toolButton_OpeCheck
            x: 396
            y: 0
            width: 200
            height: 64
            Image{
                anchors.fill: parent
                id: imgOpeCheck
                source: "Images/w168h62_B.png"
                Text {
                    x: 46
                    y: 19
                    text: "Ope.Check"
                    font.family: "MS Gothic"
                    font.pointSize: 20
                    color: "#ffffff"
                }
                Image {
                    x: 8
                    y: 17
                    source: "Images/contbar_icon_operation.png"
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgOpeCheck.source= "Images/w168h62_B_p.png"
                }
                onReleased:{
                    imgOpeCheck.source= "Images/w168h62_B.png"
                }
            }
        }
    }

   }



