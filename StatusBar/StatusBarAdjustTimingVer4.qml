import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import QtQml 2.2
import "../Control/menu"

Item{
    property Item normalStatusBarAdjust4: statusBarAdjust
    property string sourceAccessLevel: "../Images/statbar_accessLevel_1b.png"
    property string sourceStatusIcon: "../Images/status_icon.png"
    property string sourceTimingIcon: "../Images/timing_icon.png"
    property int i:0
    anchors.fill: parent
    height: 64
    Rectangle {
        id: statusBarAdjust
        x: 0
        y: 0
        width: 1024
        height: 64
        color: "#ffffff"
        Image {
            id: rectTopBkgnd
            source: "../Images/StatusBar_bg.png"

            Image {
                id: imgIconAdjTiming
                x: 0
                y: 0
                source:sourceTimingIcon
            }

            Image {
                id: imgScreenName
                x: 65
                y: 0
                source: "../Images/status_basic.png"

                Text {
                    id: text1
                    x: 5
                    y: 2
                    color: "#1d1919"
                    text: qsTr("停止中")
                    font.pixelSize: 22
                    font.family: "MS Gothic"
                }

                Image {
                    id: image9
                    x: 234
                    y: 0
                    width: 30
                    height: 30
                    source: "../Images/StatusArea_Icon_USBmemory.png"
                }

                Text {
                    id: txtNameScreen
                    x: 134
                    y: 34
                    color: "#1d1919"
                    text: "タイミング調整"
                    font.pixelSize: 22
                    font.family: "MS Gothic"
                }
            }

            Image {
                id: imgFrequence
                x: 369
                y: 0
                visible: false
                source: "../Images/statbtn_off_120_62.png"

                Text {
                    id: text6
                    x: 8
                    y: 18
                    width: 104
                    height: 28
                    color: "#1d1919"
                    text: qsTr("183 ms")
                    font.pixelSize: 22
                    font.family: "MS Gothic"
                    horizontalAlignment: Text.AlignHCenter
                }
            }



            ToolButton{
                id: toolButton_Question
                x: 952
                y: 0
                width: 72
                height: 64
                Image {
                    anchors.fill: parent
                    id: imgQuestion
                    height: 64
                    source: "../Images/popup_question_gray_off.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        menuQuestion.__popup(Qt.rect(790,62,0,0),0,0);
                    }
                    onPressed: imgQuestion.source= "../Images/popup_question_gray_on.png"
                    onReleased: imgQuestion.source= "../Images/popup_question_gray_off.png"
                    onCanceled: imgQuestion.source= "../Images/popup_question_gray_off.png"
                }

                MyMenu{
                    id: menuQuestion
                    MenuItem {
                        text: "Connect Server"
                        onTriggered: {
                            ObjData.connectQml();
                        }
                    }
                    MenuItem {
                        text: "Language"
                        onTriggered: {
//                            contentItem.timAdjObj.showDialogTheme()
//                            var component = Qt.createComponent("../Dialog/SwitchTheme.qml");
//                            appWindow.showDialog(component,300,400);
                            var component = Qt.createComponent("../Dialog/SwitchLanguage.qml");
                            appWindow.showDialog(component,300,400);
                        }
                    }
                    MenuItem {
                        text: "Access Level Change"
                        onTriggered: {
                            var component = Qt.createComponent("../Dialog/AccessLevelDialog.qml");
                            var winAccessLevelChange =component.createObject(loaderContent, {"x":  (Screen.width - 730) / 2, "y": (Screen.height - 410) / 2});
                            winAccessLevelChange.show();
                        }
                    }
                    MenuItem {
                        text: "TestTheme"
                        onTriggered: {
                            loaderContent.source="qrc:/AppTheme/TestTheme.qml";
                        }
                    }
                    MenuItem {
                        text: "Replace icon & text"
                        onTriggered: {
                            loaderContent.source="qrc:/SetReplacePathScreen/GetPathReplace.qml";
                        }
                    }
                }

            }

            ToolButton{
                id: btnPhoto
                x: 592
                y: 0
                width: 120
                height: 62
                visible: false
                Image{
                    id: imgPhoto
                    source: "../Images/statbtn_off_120_62.png"
                }
                Text {
                    x: 8
                    y: 8
                    text: "表示信号"
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 22
                    font.family: "MS Gothic"
                }
                Text {
                    id : txtValueSignal
                    x: 8
                    y: 28
                    text: "Photo(W1)"
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 22
                    font.family: "MS Gothic"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        contentItem.timAdjObj.showDialogSignalPhoto();
                    }
                    onPressed: imgPhoto.source= "../Images/statbtn_on_120_62.png"
                    onReleased: imgPhoto.source= "../Images/statbtn_off_120_62.png"
                    onCanceled: imgPhoto.source= "../Images/statbtn_off_120_62.png"
                }
            }
            ToolButton{
                id: btnVerticalRange
                x: 712
                y: 0
                width: 120
                height: 62
                Image{
                    id: imgVerticalRange
                    source: "../Images/statbtn_off_120_62.png"
                }
                Rectangle{
                    x: 0
                    y: 0
                    width: 120
                    height: 31
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: "縦レンジ"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 22
                        font.family: "MS Gothic"
                    }
                }

                Rectangle{
                    x: 0
                    y: 31
                    width: 120
                    height: 31
                    color: "transparent"
                    Text {
                        id : txtVerticalRange
                        anchors.centerIn:  parent
                        width: 120
                        text: "レンジ固定"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 18
                        font.family: "MS Gothic"
                        elide: Text.ElideRight
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        contentItem.timAdjObj.showDialogVerticalRange();
                    }
                    onPressed: imgVerticalRange.source= "../Images/statbtn_on_120_62.png"
                    onReleased: imgVerticalRange.source= "../Images/statbtn_off_120_62.png"
                    onCanceled: imgVerticalRange.source= "../Images/statbtn_off_120_62.png"
                }
            }
            ToolButton{
                id: btnAjustTiming
                x: 832
                y: 0
                width: 120
                height: 62
                Image{
                    id: imgAjustTiming_SettingTime
                    source: "../Images/statbtn_off_120_62.png"
                }
                Rectangle{
                    x: 0
                    y: 0
                    width: 120
                    height: 31
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: "時間"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 22
                        font.family: "MS Gothic"
                    }
                }

                Rectangle{
                    x: 0
                    y: 31
                    width: 120
                    height: 31
                    color: "transparent"
                    Text {
                        id : txtValueTime1
                        anchors.centerIn: parent
                        text: "(T1+T2)*2"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 22
                        font.family: "MS Gothic"
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        contentItem.timAdjObj.showDialogSettingTime();

                    }
                    onPressed: imgAjustTiming_SettingTime.source= "../Images/statbtn_on_120_62.png"
                    onReleased: imgAjustTiming_SettingTime.source= "../Images/statbtn_off_120_62.png"
                    onCanceled: imgAjustTiming_SettingTime.source= "../Images/statbtn_off_120_62.png"
                }
            }

        }


        function updateSettingTime(strTime){
            txtValueTime.text = strTime;
        }
        function updateSignal(strSignal)
        {
            txtValueSignal.text =strSignal;
        }
        function updateVerticalRange(strRange){
            txtVerticalRange.text=strRange;
        }

        function getValueTime(){
            return txtValueTime.text;
        }

        function updateAccessLevel(level){
            switch(level){
            case 1: sourceAccessLevel = "../Images/statbar_accessLevel_1a.png"; break;
            case 2: sourceAccessLevel = "../Images/statbar_accessLevel_1b.png"; break;
            case 3: sourceAccessLevel = "../Images/statbar_accessLevel_2.png"; break;
            case 4: sourceAccessLevel = "../Images/statbar_accessLevel_3.png"; break;
            default: break;
            }
            currAcessLevel = level;
        }
        function settingValueTime(str) {
            txtValueTime1.text = str
        }
    }
}




