import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls 1.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import "../Control/menu"
import "../StatusBar"
import ControlApp 1.0

Item {
    property int count: 0;
    property bool isShowMenu: true
    id: bottomBarMainPage
    Rectangle {
        id: rectBottom
        width: 1024
        height: 64
        color: "#ffffff"

        Image {
            id: rectBottomBkgnd
            x: 0
            y: 0
            source: "qrc:/Images/ControlBar_bg.png"
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
                source: toolButton_Menu.pressed ?"qrc:/Images/contbar_btn_touched_104.png":"qrc:/Images/contbar_btn_104.png"
                Text {
                    text: "Menu"
                    anchors.verticalCenterOffset: 16
                    anchors.horizontalCenterOffset: 0
                    anchors.bottomMargin: -16
                    font.family: "MS Gothic"
                    font.pixelSize:27
                    color: "#ffffff"
                    anchors.bottom: parent.bottom
                    anchors.centerIn: parent
                }
                Image {
                    x: 37
                    y: 4
                    source: "qrc:/Images/contbar_icon_menu.png"
                }
            }

            onClicked: mainModel.InnerChangeScreen(ScreenMng.Menu)
        }

        ToolButton {
            id: toolButton_ChangeScreen
            x: 105
            y: 0
            width: 112
            height: 64
            Image {
                id: imgDisplay
                source: "qrc:/Images/contbar_btn_112.png"

                Image {
                    id: screen1
                    x: 6
                    y: 5
                    height: 16
                    width:16
                    source: "qrc:/Images/dispswitchbtnno1.png"
                }

                Text {
                    x: 4
                    y: 31
                    width: 102
                    height: 27
                    text: "Display"
                    font.family: "MS Gothic"
                    font.pixelSize:27
                    color: "#ffffff"
                }

                Image {
                    id: screen2
                    x: 27
                    y: 5
                    width: 16
                    height: 16
                    source: "qrc:/Images/dispswitchbtnno2.png"
                }

                Image {
                    id: screen3
                    x: 48
                    y: 5
                    width: 17
                    height: 16
                    source: "qrc:/Images/dispswitchbtnno3.png"
                }

                Image {
                    id: screen4
                    x: 69
                    y: 5
                    width: 17
                    height: 16
                    source: "qrc:/Images/dispswitchbtnno4.png"
                }

                Image {
                    id: screen5
                    x: 89
                    y: 5
                    width: 17
                    height: 16
                    source: "qrc:/Images/Icon_Screen_5_on.png"
                }
            }

            MouseArea {
                width: 112
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if(isShowMenu){
                        menuDisplayScreen.__popup(Qt.rect(106,265,0,0),0,0);
                    }
                    else{
                        count++;
                        if(count>=3)
                        {
                            count=0;
                        }
                        switchScreen(count);
                    }
                }
                onPressed: imgDisplay.source= "qrc:/Images/contbar_btn_touched_112.png"
                onReleased: imgDisplay.source= "qrc:/Images/contbar_btn_112.png"
                onCanceled: imgDisplay.source= "qrc:/Images/contbar_btn_112.png"
            }

            MyMenu{
                id: menuDisplayScreen
                MenuItem {
                    text: "Production Screen"
                    onTriggered: {
                        switchScreen(0);
                    }
                }
                MenuItem {
                    text: "Production Screen Ver2"
                    onTriggered: {
                        switchScreen(1);
                    }
                }
                MenuItem {
                    text: "Fill Adjustment"
                    onTriggered: {
                        switchScreen(2);
                    }
                }
                MenuItem {
                    text: "General"
                    onTriggered: {
                        switchScreen(3);
                    }
                }
                MenuItem {
                    text: "Zoom for each line"
                    onTriggered: {
                        switchScreen(4);
                    }
                }
                MenuItem {
                    text: "X-Bar R/S"
                    onTriggered: {
                        switchScreen(5);
                    }
                }
                MenuItem {
                    text: "Statis"
                    onTriggered: {
                    }
                }
                MenuItem {
                    text: "Zoom weight disp"
                    onTriggered: {
                        //switchScreen(4);
                    }
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
                source: "qrc:/Images/w168h62_B.png"
                Text {
                    x: 46
                    y: 19
                    text: "Ope.Check"
                    font.family: "MS Gothic"
                    font.pixelSize:27
                    color: "#ffffff"
                }
                Image {
                    x: 8
                    y: 18
                    source: "qrc:/Images/contbar_icon_operation.png"
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: menuOpeCheck.__popup(Qt.rect(397,594,0,0),0,0)
                onPressed: imgOpeCheck.source= "qrc:/Images/w168h62_B_p.png"
                onReleased: imgOpeCheck.source= "qrc:/Images/w168h62_B.png"
                onCanceled: imgOpeCheck.source= "qrc:/Images/w168h62_B.png"
            }

            MyMenu{
                id: menuOpeCheck
                MenuItem{
                    text: "Eval/Rj Confirmation"
                }
                MenuItem{
                    text: "Accuracy Check"
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
                source: "qrc:/Images/w168h62_B.png"
                Text {
                    x: 42
                    y: 19
                    text: "Pro Cntl"
                    font.family: "MS Gothic"
                    font.pixelSize:27
                    color: "#ffffff"
                }
                Image {
                    x: 4
                    y: 18
                    source: "qrc:/Images/contbar_icon_manage.png"
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: menuProCntl.__popup(Qt.rect(598,432,0,0),0,0);
                onPressed: imgProCntl.source= "qrc:/Images/w168h62_B_p.png"
                onReleased: imgProCntl.source= "qrc:/Images/w168h62_B.png"
                onCanceled: imgProCntl.source= "qrc:/Images/w168h62_B.png"
            }

            MyMenu{
                id: menuProCntl
                MenuItem{
                    text: "Invalid Line version 2"
                    onTriggered: {
                        loaderContent.source ="qrc:/InvalidLine/InvalidLine_ver2.qml"
                        loaderBottomBar.source ="qrc:/BottomBar/BottomBarInvalid.qml"
                    }
                }
                MenuItem{
                    text: "Invalid Line"
                    onTriggered: {
                        loaderContent.source ="qrc:/InvalidLine/InvalidLine.qml"
                        loaderBottomBar.source ="qrc:/BottomBar/BottomBarInvalid.qml"
                    }
                }
                MenuItem{
                    text: "Clear Stats."
                }
                MenuItem{
                    text: "Preset count clear"
                }
                MenuItem{
                    text: "Save to USB memory "
                }
                MenuItem{
                    text: "Stats Record"
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
                source: "qrc:/Images/w168h62_B.png"
                Text {
                    x: 46
                    y: 19
                    text: "Set/Adj"
                    font.family: "MS Gothic"
                    font.pixelSize:27
                    color: "#ffffff"
                }
                Image {
                    x: 8
                    y: 18
                    source: "qrc:/Images/contbar_icon_config.png"
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(menuAdjSetting.visible){
                        menuAdjSetting.__popup(Qt.rect(768,387-10,0,0),0,0);
                    }
                    else{
                        menuAdjSetting.__closeAndDestroy();
                    }
                }
                onPressed: imgSetAdj.source= "qrc:/Images/w168h62_B_p.png"
                onReleased: imgSetAdj.source= "qrc:/Images/w168h62_B.png"
                onCanceled: imgSetAdj.source= "qrc:/Images/w168h62_B.png"
            }

            MyMenu {
                id: menuAdjSetting

                MenuItem {
                    text: "Timing Adjustment Ver4"
                    onTriggered: {
                        mainModel.InnerChangeScreen(ScreenMng.AdjustTimingV2)
                    }
                }
                MenuItem {
                    text: "Timing Adjustment Ver3"
                    onTriggered: {
                        statusBarItem.normalStatusBar.getStatusBarAdjustTiming(true);
                        loaderContent.source = "../AdjustTiming/AdjustTimingVer3.qml"
                        loaderBottomBar.source ="../BottomBar/BottomBarAdjustTiming.qml"
                    }
                }
                MenuItem {
                    text: "IO Monitor"
                    onTriggered: {
//                        loaderStatusBar.source = "../StatusBar/IOMonitorStatusBar.qml"
//                        loaderContent.source = "../IOMonitor/IOMonitor.qml"
////                        loaderContent.source = mainModel.InnerChangeScreen(ScreenMng.IOMonitor)
//                        loaderBottomBar.source ="../BottomBar/BottomBarIOMonitor.qml"
                        mainModel.InnerChangeScreen(ScreenMng.IOMonitor)
                    }
                }

                MenuItem {
                    text: "Timing Adjust ver2"
                    onTriggered: {
                        loaderContent.source = "../AdjustTiming/GPnlMainAdjustTimingTbl_v2.qml"
                        loaderBottomBar.source ="../BottomBar/BottomBarAdjustTiming.qml"
                        statusBarItem.normalStatusBar.getStatusBarAdjustTiming(true);
                    }
                }

                MenuItem {
                    text: "Timing Adjust"
                    onTriggered: {
                        loaderContent.source = "../AdjustTiming/GPnlMaintAdjustTimingTbl.qml"
                        loaderBottomBar.source ="../BottomBar/BottomBarAdjustTiming.qml"
                        statusBarItem.normalStatusBar.getStatusBarAdjustTiming(true);
                    }
                }
                MenuItem {
                    text: "Sensitivity Correction"
                    onTriggered: {
                        loaderContent.source = "../SensitiveCorrection/SensCorrStart.qml"
                        loaderBottomBar.source ="../BottomBar/BottomBarSensCorr.qml"
                    }
                }
                MenuItem {
                    text: "Fine Adjustment"
                    onTriggered: {
                        loaderContent.source ="../DynamicCorrection/InputMasterWork.qml"
                        loaderBottomBar.source ="BottomBarCancelBackNext.qml"
                    }
                }
            }


        }

    }

    function switchScreen(index){
        if(index ===0){
            loaderContent.source="qrc:/Production/ProductionScreen_ver3.qml"
            screen1.source = "qrc:/Images/Icon_Screen_1_on.png";
            screen2.source = "qrc:/Images/dispswitchbtnno2.png";
            screen3.source = "qrc:/Images/dispswitchbtnno3.png";
            screen4.source = "qrc:/Images/dispswitchbtnno4.png";
            screen5.source = "qrc:/Images/dispswitchbtnno5.png";
        }else if(index === 1){
            loaderContent.source=  "qrc:/Production/ProductVer2Screen.qml";
            screen2.source = "qrc:/Images/Icon_Screen_2_on.png";
            screen1.source = "qrc:/Images/dispswitchbtnno1.png";
            screen3.source = "qrc:/Images/dispswitchbtnno3.png";
            screen4.source = "qrc:/Images/dispswitchbtnno4.png";
            screen5.source = "qrc:/Images/dispswitchbtnno5.png";
        }
        else if(index === 2)
        {
            loaderContent.source="../FillingAmount/FillingAmount.qml"
            screen3.source = "qrc:/Images/Icon_Screen_3_on.png";
            screen2.source = "qrc:/Images/dispswitchbtnno2.png";
            screen1.source = "qrc:/Images/dispswitchbtnno1.png";
            screen4.source = "qrc:/Images/dispswitchbtnno4.png";
            screen5.source = "qrc:/Images/dispswitchbtnno5.png";
        }
        else if(index === 3)
        {
            loaderContent.source= "qrc:/Production/ProductVer2Screen.qml";
            screen4.source = "qrc:/Images/Icon_Screen_4_on.png";
            screen3.source = "qrc:/Images/dispswitchbtnno3.png";
            screen2.source = "qrc:/Images/dispswitchbtnno2.png";
            screen1.source = "qrc:/Images/dispswitchbtnno1.png";
            screen5.source = "qrc:/Images/dispswitchbtnno5.png";
        }
        else if(index === 4)
        {
            loaderContent.source="qrc:/ZoomLine/ZoomLine3V.qml";
            screen5.source = "qrc:/Images/Icon_Screen_5_on.png";
            screen4.source = "qrc:/Images/dispswitchbtnno4.png";
            screen3.source = "qrc:/Images/dispswitchbtnno3.png";
            screen2.source = "qrc:/Images/dispswitchbtnno2.png";
            screen1.source = "qrc:/Images/dispswitchbtnno1.png";
        }
        else if (index === 5)
        {
            loaderContent.source="qrc:/Production/ProductionScreen_ver3.qml";
        }
    }
}
