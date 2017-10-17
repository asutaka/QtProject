import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0

import "../Control/menu"
import "../Production"

Item {
    property Item bottomBarAdjustTiming: rectBottom
    id: bottomBarMenu
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
            x: 0
            y: 0
            width: 104
            height: 64
            Image{
                id: imgBack
                anchors.fill: parent
                source: "../Images/contbar_btn_104.png"
                Text {
                    text: "戻る"
                    anchors.verticalCenterOffset: 16
                    anchors.horizontalCenterOffset: 0
                    anchors.bottomMargin: -16
                    font.family: "MS Gothic"
                    font.pixelSize:20
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
                onPressed: {
                    imgBack.source= "../Images/contbar_btn_touched_104.png"
                }
                onReleased:{
                    imgBack.source= "../Images/contbar_btn_104.png"
                    mainModel.InnerChangeScreen(ScreenMng.Production)
                    mainModel.InnerChangeBottomBar(ScreenMng.BottomBarMainPage)
                    statusBarItem.normalStatusBar.getStatusBarAdjustTiming(false);
                }
                onCanceled: {
                    imgBack.source= "../Images/contbar_btn_104.png"
                }
            }
        }
        ToolButton {
            x: 597
            y: 0
            width: 170
            height: 64
            Image{
                id: imgMeasTime
                anchors.fill: parent
                source: "../Images/contbar_btn_168.png"
                Rectangle{
                    x: 0
                    y: 0
                    width: 170
                    height: 32
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: "測定タイミング"
                        color: "white"
                        font.family: "MS Gothic"
                        font.pixelSize: 20
                    }
                }

                Rectangle{
                    x: 0
                    y: 32
                    width: 170
                    height: 32
                    color: "transparent"
                    Text {
                        id : txtValueMeas
                        anchors.centerIn: parent
                        text: "自動"
                        color: "white"
                        font.family: "MS Gothic"
                        font.pixelSize: 20
                    }
                }


                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                         imgMeasTime.source= "../Images/contbar_btn_touched_168.png"
                    }
                    onReleased:{
                        imgMeasTime.source= "../Images/contbar_btn_168.png"
                        contentItem.timAdjObj.showDialogMeasTiming();
                        contentItem.timAdjObj.disableScreen();
                        //contentItem.timAdjObj.clearScale()
                    }
                    onCanceled: {
                        imgMeasTime.source= "../Images/contbar_btn_168.png"
                    }
                }
            }
        }
        ToolButton {
            x: 768
            y: 0
            width: 170
            height: 64
            Image{
                id: imgBgClear
                anchors.fill: parent
                source: "../Images/contbar_btn_168.png"
                Text {
                    x: 46
                    y: 19
                    text: "クリア"
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    color: "#ffffff"
                }
                Image {
                    x: 8
                    y: 18
                    source: "../Images/contbar_icon_clear.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        imgBgClear.source= "../Images/contbar_btn_touched_168.png"
                    }
                    onReleased:{
                        imgBgClear.source= "../Images/contbar_btn_168.png";
                        if(contentItem.timAdjObj){
                        contentItem.timAdjObj.clearCharts();
                        } else{
                            contentItem.adjustTimingScreen.clearLineNoLegend();
                        }
                    }
                    onCanceled: {
                        imgBgClear.source= "../Images/contbar_btn_168.png";
                    }
                }
            }
        }
        ToolButton {
            id: toolButton_Function
            x: 939
            y: 0
            width: 84
            height: 64
            visible: false
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
                    if(menuAdjSettingFn.visible){
                        menuAdjSettingFn.__popup(Qt.rect(840,658,0,0),0,0);
                    }
                    else{
                        menuAdjSettingFn.__closeAndDestroy();
                    }
                }
                onCanceled: {
                    imgFn.source= "../Images/contbar_btn_function.png"
                }
            }
        }
        MyMenu {
            id: menuAdjSettingFn
            widthItem: 150
            MenuItem {
                text: "Screen Capture"
                onTriggered: {
                }
            }
        }

        function settingValueMeasTime(strMeas){
            txtValueMeas.text=strMeas;
        }

        function disableBottomBar(){
            bottomBarMenu.enabled = false;
        }

        function enableBottomBar(){
            bottomBarMenu.enabled = true;
        }
    }
}



