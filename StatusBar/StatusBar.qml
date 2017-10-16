import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import QtQml 2.2
import ControlApp 1.0
import "../Control/menu"

Item{
    property Item normalStatusBar: statusBarScreen
    property string strDate: Qt.formatDateTime(new Date(), "dd-MM-yyyy")
    property string sTime: Qt.formatTime( new Date(),"hh:mm")
    property string sourceAccessLevel: "../Images/statbar_accessLevel_1b.png"
    property string sourceStatusIcon: "../Images/status_icon.png"
    property string sourceTimingIcon: "../Images/timing_icon.png"
    property bool isAdjustTimingScreen: false
    property int i:0
    anchors.fill: parent
    height: 64

    property alias statusModel: statusModelObject
    StatusBar {
        id: statusModelObject
    }

    Rectangle {
        id: statusBarScreen
        x: 0
        y: 0
        width: 1024
        height: 64
        color: "#ffffff"
        Image {
            id: rectTopBkgnd
            source: "../Images/StatusBar_bg.png"
            Image {
                id: imgIconStatusBar
                x: 0
                y: 0
                source:sourceStatusIcon
            }
            Image {
                id: imgIconAdjTiming
                x: 0
                y: 0
                source:sourceTimingIcon
                visible: isAdjustTimingScreen
            }

            Image {
                id: imgScreenName
                x: 65
                y: 0
                source: "../Images/status_basic.png"

                Text {
                    id: txtStateMachine
                    x: 5
                    y: 2
                    color: "#1d1919"
                    text: qsTr("停止中")
                    font.pixelSize: 20
                    font.family: "MS Gothic"
                }

                Image {
                    id: imgIconStatusArea
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
                    text: "Show X-bar R/s"
                    font.pixelSize: 20
                    font.family: "MS Gothic"
                }
            }

            Image {
                id: imgFrequence
                x: 369
                y: 0
                source: "../Images/statbtn_off_120_62.png"
                visible: !isAdjustTimingScreen

                Text {
                    id: text6
                    x: 8
                    y: 18
                    width: 104
                    height: 28
                    color: "#1d1919"
                    text: qsTr("183 ms")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            ToolButton{
                id: btnDateTime
                visible: !isAdjustTimingScreen
                x: 712
                y: 0
                width: 120
                height: 62
                Image {
                    id: imgDateTimeBgr
                    source: "../Images/statbtn_off_120_62.png"

                    Text {
                        id: text3
                        x: 8
                        y: 4
                        width: 104
                        height: 28
                        color: "#1d1919"
                        text: strDate
                        font.pixelSize: 20
                    }

                    Text {
                        id: text5
                        x: 8
                        y: 30
                        width: 104
                        height: 28
                        color: "#1d1919"
                        text: sTime
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }
                }
                MouseArea {
                    id: areaDateTime
                    anchors.fill: parent
                    onClicked: {
                        loaderContent.source="qrc:/Control/dateTime/DateTimeChange.qml"
                    }
                    onPressed: imgDateTimeBgr.source= "../Images/statbtn_on_120_62.png"
                    onReleased: imgDateTimeBgr.source= "../Images/statbtn_off_120_62.png"
                    onCanceled: imgDateTimeBgr.source= "../Images/statbtn_off_120_62.png"
                }
            }

            ToolButton{
                id: toolButton_AccessLevel
                x: 832
                y: 0
                width: 120
                height: 62
                Image {
                    anchors.fill: parent
                    id: imgAccessLevelBgr
                    height: 64
                    source: "../Images/statbtn_off_120_62.png"
                    Image {
                        id: iconAccessLevel
                        anchors.centerIn: parent
                        source: sourceAccessLevel
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        menuAccessLevel.__popup(Qt.rect(670,62,0,0),0,0);
                    }
                    onPressed: imgAccessLevelBgr.source= "../Images/statbtn_on_120_62.png"
                    onReleased: imgAccessLevelBgr.source= "../Images/statbtn_off_120_62.png"
                    onCanceled: imgAccessLevelBgr.source= "../Images/statbtn_off_120_62.png"
                }

                MyMenu {
                    id: menuAccessLevel
                    widthItem: 250
                    MenuItem {
                        iconSource : "../Images/accessLevel_1a_M.png"
                        text: "Operator Level 1"
                        onTriggered: {
                            showPasswordKeyboard(1);
                        }
                    }
                    MenuItem {
                        iconSource:"../Images/accessLevel_1b_M.png"
                        text: "Operator Level 2"
                        onTriggered: {
                            showPasswordKeyboard(2);
                        }
                    }
                    MenuItem {
                        iconSource:"../Images/accessLevel_2_M.png"
                        text: "Manager Level"
                        onTriggered: {
                            showPasswordKeyboard(3);
                        }
                    }
                    MenuItem {
                        iconSource:"../Images/accessLevel_3_M.png"
                        text: "Service Engineer Level"
                        onTriggered: {
                            showPasswordKeyboard(4);
                        }
                    }
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
                            statusModel.connectQml();
                        }
                    }
                    MenuItem {
                        id: itemStart
                        text: "Start"
                        onTriggered: {
                            mainModel.guiEvent(EnumControl.START);
                        }
                    }
                    MenuItem {
                        id: itemStop
                        text: "Stop"
                        onTriggered: {
                            mainModel.guiEvent(EnumControl.STOP);
                        }
                    }

                    MenuItem {
                        text: "Language"
                        onTriggered: {
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
                visible: isAdjustTimingScreen
                Image{
                    id: imgPhoto
                    source: "../Images/statbtn_off_120_62.png"
                }
                Rectangle{
                    x:0
                    y:0
                    width: 120
                    height: 31
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: "表示信号"
                        font.pixelSize: 20
                        font.family: "MS Gothic"
                    }
                }
                Rectangle{
                    x:0
                    y:31
                    width: 120
                    height: 31
                    color: "transparent"
                    Text {
                        id : txtValueSignal
                        anchors.centerIn: parent
                        text: "Photo(W1)"
                        font.pixelSize: 20
                        font.family: "MS Gothic"
                    }
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
                visible: isAdjustTimingScreen
                Image{
                    id: imgVerticalRange
                    source: "../Images/statbtn_off_120_62.png"
                }
                Rectangle{
                    x:0
                    y:0
                    width: 120
                    height: 31
                    color: "transparent"
                    Text {
                       anchors.centerIn: parent
                        text: "縦レンジ"
                        font.family: "MS Gothic"
                        font.pixelSize: 20
                    }
                }
                Rectangle{
                    x:0
                    y:31
                    width: 120
                    height: 31
                    color: "transparent"
                    Text {
                        id : txtVerticalRange
                        anchors.centerIn: parent
                        text: "レンジ固定"
                        font.family: "MS Gothic"
                        font.pixelSize: 16
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
                visible: isAdjustTimingScreen
                Image{
                    id: imgAjustTiming_SettingTime
                    source: "../Images/statbtn_off_120_62.png"
                }
                Rectangle{
                    x:0
                    y:0
                    width: 120
                    height: 31
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: "時間"
                        font.family: "MS Gothic"
                        font.pixelSize: 20
                    }
                }
                Rectangle{
                    x:0
                    y:31
                    width: 120
                    height: 31
                    color: "transparent"
                    Text {
                        id : txtValueTime1
                        anchors.centerIn: parent
                        text: "(T1+T2)*2"
                        font.family: "MS Gothic"
                        font.pixelSize: 20
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

            Connections{
                target:statusModel;
                onSendResponse: {
                    if((sms%2 ==0)||(sms == -1)){
                        time2.stop();
                    }
                    else{
                        time2.start();
                        time2.triggered.connect(function () {
                            var weight = statusModel.getWeight();
                            if (typeof( contentItem.productScreen) !== "undefined"){
                                contentItem.productScreen.updateView(weight);
                            }
                        })
                    }
                }
            }

        }

        function getStatusBarAdjustTiming(isAdjustTiming){
            isAdjustTimingScreen = isAdjustTiming;
            if(!isAdjustTiming){
                txtNameScreen.text = "Show X-bar R/s";
            }
            else{
                txtNameScreen.text = "タイミング調整";
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

    Timer {
        id: time1
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            sTime= Qt.formatTime( new Date(),"hh:mm")
        }
    }

    Timer {
        id: time2
        interval: 500
        running: true
        repeat: true
    }

    function showPasswordKeyboard(indexLevel){
        if(indexLevel<= currAcessLevel){
            normalStatusBar.updateAccessLevel(indexLevel);
            currAcessLevel = indexLevel;
        }
        else{
            var component = Qt.createComponent("../Control/KeyBoard.qml");
            component.createObject(appWindow, {"x":0 , "y":0});
        }
    }

    function updateValue(strStateMachine, strScreenName,
                         strIconStatusArea, isShowFrequence,
                         isShowDateTime, isShowAccessLevel,
                         isShowQuestion) {
        txtStateMachine.text = strStateMachine
        txtNameScreen.text = strScreenName
        imgIconStatusArea.source = strIconStatusArea
        imgFrequence.visible = isShowFrequence
        btnDateTime.visible = isShowDateTime
        toolButton_AccessLevel.visible = isShowAccessLevel
        toolButton_Question.visible = isShowQuestion
    }
}




