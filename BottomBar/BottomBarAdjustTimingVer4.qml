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
    property Item bottomBarAdjustTimingV4: rectBottom
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
            id: btnBack
            x: 0
            y: 0
            width: 104
            height: 64

            Image{
                id: imgBack
                anchors.fill: parent
                source: "../Images/contbar_btn_104.png"
                Rectangle{
                    y:32
                    width: 104
                    height: 32
                    color: "transparent"
                    Text {
                        text: "戻る"
                        anchors.centerIn: parent
                        font.pixelSize:22
                        font.family: "MS Gothic"
                        color: "#ffffff"
                    }
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
                    mainModel.GoBackScreen()
                }
                onCanceled: {
                    imgBack.source= "../Images/contbar_btn_104.png"
                }
            }
        }

        ToolButton {
            id: btnMeasTime
            x: 115
            y: 0
            width: 170
            height: 64

            Image {
                id: imgMeasTime
                anchors.fill: parent
                source: "../Images/contbar_btn_168.png"

                Rectangle {
                    x: 0
                    y: 0
                    width: 170
                    height: 32
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: "測定タイミング"
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 22
                        font.family: "MS Gothic"
                    }
                }

                Rectangle {
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
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 22
                        font.family: "MS Gothic"
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
                        //contentItem.timAdjObj.clearScale()
                    }
                    onCanceled: {
                        imgMeasTime.source= "../Images/contbar_btn_168.png"
                    }
                }
            }
        }

        ToolButton {
            id: btnSignalAdj
            x: btnMeasTime.x +btnMeasTime.width +10
            y: 0
            width: 170
            height: 64
            visible: false

            Image {
                id: imgSignalAdj
                anchors.fill: parent
                source: "../Images/contbar_btn_168.png"
                Image {
                    id: iconButtonAdj
                    x:8
                    y:16
                    source: "qrc:/Images/contbar_icon_input.png"
                }
                Rectangle {
                    x: 30
                    y: 0
                    width: 140
                    height: 64
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: "信号調整"
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 22
                        font.family: "MS Gothic"
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                         imgSignalAdj.source= "qrc:/Images/contbar_btn_touched_168.png"
                    }
                    onReleased:{
                        imgSignalAdj.source= "qrc:/Images/contbar_btn_168.png"
                        //contentItem.timAdjObj.showDialogSignalAdjust();

                    }
                    onCanceled: {
                        imgSignalAdj.source= "qrc:/Images/contbar_btn_168.png"
                    }
                }
            }
        }

        ToolButton {
            id: btnSignalSelect
            x: btnSignalAdj.x +btnSignalAdj.width +10
            y: 0
            width: 170
            height: 64
            visible: false

            Image {
                id: imgSignalSelect
                anchors.fill: parent
                source: "../Images/contbar_btn_168.png"

                Image {
                    id: iconButtonSelect
                    x:8
                    y:16
                    source: "qrc:/Images/contbar_icon_select.png"
                }

                Rectangle {
                    x: 30
                    y: 0
                    width: 140
                    height: 64
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: "信号選択"
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 22
                        font.family: "MS Gothic"
                    }
                }



                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                         imgSignalSelect.source= "qrc:/Images/contbar_btn_touched_168.png"
                    }
                    onReleased:{
                        imgSignalSelect.source= "qrc:/Images/contbar_btn_168.png"
                        contentItem.timAdjObj.showDialogSignalSelect();

                    }
                    onCanceled: {
                        imgSignalSelect.source= "qrc:/Images/contbar_btn_168.png"
                    }
                }
            }
        }

        ToolButton {
            id: btnClear
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
                    font.pixelSize: 22
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
                        if (contentItem.timAdjObj){
                            contentItem.timAdjObj.clearCharts();
                        } else {
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

        MouseArea {
            id: bottomArea
            anchors.fill: parent
            propagateComposedEvents: enabled
            enabled: false
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

        function visibleSelectSignalBtn() {
            btnSignalAdj.visible = true
            btnSignalSelect.visible = true
        }

        function invisiableSelectSignalBtn() {
            btnSignalAdj.visible = false
            btnSignalSelect.visible = false
        }

        function enableMouseArea(_enable) {
            bottomArea.enabled = _enable
        }
    }
}



