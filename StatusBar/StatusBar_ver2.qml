import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import QtQml 2.2
import "../Control/menu"

Item{
    property Item normalStatusBar: statusBarScreen
    property string strDate: Qt.formatDateTime(new Date(), "dd-MM-yyyy")
    property string sTime: Qt.formatTime( new Date(),"hh:mm")
    property string sourceAccessLevel: "../Images/statbar_accessLevel_1b.png"
    property string sourceStatusIcon: "../Images/status_icon.png"
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
            source: "../Images/StatusBar_bg_ver2.png"
            Image {
                id: imgBkg
                x: 0
                y: 1
                source:sourceStatusIcon
            }

            Image {
                id: image2
                x: 65
                y: 1
                width: 302
                source: "../Images/status_basic_ver2.png"

                Text {
                    id: text1
                    x: 5
                    y: 3
                    color: "#1d1919"
                    text: qsTr("STOP")
                    font.pixelSize: 23
                }

                Image {
                    id: image9
                    x: 234
                    y: 1
                    width: 30
                    height: 30
                    source: "../Images/StatusArea_Icon_USBmemory.png"
                }

                Text {
                    id: txtNameScreen
                    x: 134
                    y: 35
                    color: "#1d1919"
                    text: "Show X-bar R/s"
                    font.pixelSize: 23
                }
            }

            Image {
                id: image3
                x: 369
                y: 1
                width: 120
                source: "../Images/status_basic_ver2.png"

                Text {
                    id: text6
                    x: 8
                    y: 18
                    width: 104
                    height: 28
                    color: "#1d1919"
                    text: qsTr("100 ms")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            ToolButton{
                visible: !isAdjustTimingScreen
                x: 708
                y: 1
                width: 120
                height: 64
                Image {
                    id: image4
                    source: "../Images/statbtn_off_120_62_ver2.png"

                    Text {
                        id: text3
                        x: 8
                        y: 5
                        width: 104
                        height: 28
                        color: "#1d1919"
                        text: sTime
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 13
                    }

                    Text {
                        id: text5
                        x: 8
                        y: 25
                        width: 104
                        height: 28
                        color: "#1d1919"
                        text: strDate
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        image4.source= "../Images/statbtn_on_120_62_ver2.png"
                    }
                    onReleased:{
                        image4.source= "../Images/statbtn_off_120_62_ver2.png"
                    }
                    onCanceled: {
                        image4.source= "../Images/statbtn_off_120_62_ver2.png"
                    }
                }
            }

            ToolButton{
                id: toolButton_AccessLevel
                x: 830
                y: 1
                width: 120
                height: 62
                Image {
                    anchors.fill: parent
                    id: imgAccessLevel
                    source: "../Images/statbtn_off_120_62_ver2.png"
                    Image {
                        id: iconAccessLevel
                        anchors.centerIn: parent
                        source: sourceAccessLevel
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        imgAccessLevel.source= "../Images/statbtn_on_120_62_ver2.png"
                    }
                    onReleased:{
                        imgAccessLevel.source= "../Images/statbtn_off_120_62_ver2.png"
                        menuAccessLevel.__popup(Qt.rect(670,62,0,0),0,0);
                    }
                    onCanceled: {
                        imgAccessLevel.source= "../Images/statbtn_off_120_62_ver2.png"
                    }
                }
            }
            ToolButton{
                id: toolButton_Question
                x: 952
                y: 1
                width: 72
                height: 62
                Image {
                    anchors.fill: parent
                    id: imgQuestion
                    source: "../Images/popup_question_gray_off_ver2.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        imgQuestion.source= "../Images/popup_question_gray_on_ver2.png"
                    }
                    onReleased:{
                        imgQuestion.source= "../Images/popup_question_gray_off_ver2.png"
                        menuQuestion.__popup(Qt.rect(790,62,0,0),0,0);
                    }
                    onCanceled: {
                        imgQuestion.source= "../Images/popup_question_gray_off_ver2.png"
                    }
                }
            }
            ToolButton{
                id: btnAjustTiming
                x: 830
                y: 1
                width: 120
                height: 62
                visible: isAdjustTimingScreen
                Image{
                    id: imgAjustTiming_SettingTime
                    source: "../Images/statbtn_off_120_62_ver2.png"
                    Text {
                        id: txtTime
                        x: 45
                        y: 5
                        text: "Time"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 13
                    }
                    Text {
                        id : txtValueTime
                        x: 10
                        y: 25
                        text: "(T1+T2)*2"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        imgAjustTiming_SettingTime.source= "../Images/statbtn_on_120_62_ver2.png"
                    }
                    onReleased:{
                        imgAjustTiming_SettingTime.source= "../Images/statbtn_off_120_62_ver2.png"
                        contentItem.adjustTimingScreen.showDialog();
                    }
                    onCanceled: {
                        imgAjustTiming_SettingTime.source= "../Images/statbtn_off_120_62_ver2.png"
                    }
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
            MyMenu{
                id: menuQuestion
                MenuItem {
                    text: "Connect Server"
                    onTriggered: {
                        statusModel.connectQml();
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
                    text: "Version"
                }
                MenuItem {
                    text: "Access Level Change"
                    onTriggered: {
                        var component = Qt.createComponent("../Dialog/AccessLevelDialog.qml");
                        var winAccessLevelChange =component.createObject(loaderContent, {"x":  (Screen.width - 730) / 2, "y": (Screen.height - 410) / 2});
                        winAccessLevelChange.show();
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
                txtNameScreen.text = "Adjust Timming";
            }
        }
        function updateSettingTime(strTime){
            txtValueTime.text = strTime;
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

    }
    Timer {
        id: time1
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            sTime= Qt.formatTime( new Date(),"hh:mm")
            strDate=Qt.formatDateTime(new Date(), "dd-MM-yyyy")
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
}
