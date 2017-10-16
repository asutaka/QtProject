import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import ControlApp 1.0
import "qrc:/Control/menu"
import "qrc:/Dialog"
import "qrc:/IOMonitor"

Item {
    id: statusBarIOMonitor

    property Item objIOMonitorStatusBar: rowStatusBarIOMonitor
    property IOMonitorScreenVM objIOMonitorVM: ioMonitorVM
    property real _ratioDistance: 0.1
    property real _ratioFont: 0.32
    property real _ratioMaxHeight: 0.96875

    Image {
        IOMonitorScreenVM {
            id: ioMonitorVM
        }

        id: bkgStatusBarIOMonitor
        width: 1024
        height: 64
        source: "image://MyProvider/StatusBar_bg.png"

        RowLayout {
            id: rowStatusBarIOMonitor
            anchors.fill: parent

            ToolButton {
                id: iconIOMonitor
                Layout.fillHeight: true
                contentItem: Image {
                    id: imgIOMonitor
                    anchors.fill: parent
                    source: "image://MyProvider/timingio_icon.png"
                }
            }

            ToolButton {
                id: titleIOMonitor
                Layout.fillHeight: true
                Layout.maximumHeight: parent.height * _ratioMaxHeight
                anchors.top: parent.top
                anchors.left: iconIOMonitor.right
                contentItem: Image {
                    id: imgTitleIOMonitor
                    anchors.fill: parent
                    source: "image://MyProvider/status_basic.png"

                    Text {
                        id: txtStateMachine
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.top: parent.top
                        anchors.topMargin: parent.height * _ratioDistance
                        anchors.left: parent.left
                        anchors.leftMargin: parent.height * _ratioDistance
                        font.family: "MS Gothic"
                        font.bold: true
                        font.pixelSize: parent.height * _ratioFont
                        color: "black"
                    }

                    Image {
                        id: imgIconUSBmemory
                        anchors.topMargin: parent.height * _ratioDistance
                        anchors.right: parent.right
                        anchors.rightMargin: parent.width * _ratioDistance
                        source: "image://MyProvider/StatusArea_Icon_USBmemory.png"
                    }

                    Text {
                        id: txtNameScreen
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height * _ratioDistance
                        anchors.right: parent.right
                        anchors.rightMargin: parent.width * _ratioDistance
                        font.family: "MS Gothic"
                        font.bold: true
                        font.pixelSize: parent.height * _ratioFont
                        color: "black"
                    }
                }
            }

            ToolButton {
                id: btnSignalType
                Layout.fillHeight: true
                anchors.right: btnTrigerNo.left
                Layout.maximumHeight: parent.height * _ratioMaxHeight
                anchors.top: parent.top
                contentItem: Image {
                    id: imgSignalType
                    anchors.fill: parent
                    source: btnSignalType.pressed ? "image://MyProvider/statbtn_on_120_62.png" : "image://MyProvider/statbtn_off_120_62.png"

                    Text {
                        id: txtSignalTypeTitle
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.top: parent.top
                        anchors.topMargin: parent.height * _ratioDistance
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "MS Gothic"
                        font.bold: true
                        font.pixelSize: parent.height * _ratioFont
                        color: "black"
                    }

                    Text {
                        id: txtValueSignalType
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height * _ratioDistance
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "MS Gothic"
                        font.bold: true
                        font.pixelSize: (parent.height - 8) * _ratioFont
                        color: "black"
                    }
                }

                onClicked: {
                    loaderContent.item.objIOMonitor.showDlgSignalType()
                }
            }

            ToolButton {
                id: btnTrigerNo
                Layout.fillHeight: true
                anchors.right: btnTrigerCondition.left
                Layout.maximumHeight: parent.height * _ratioMaxHeight
                anchors.top: parent.top
                contentItem: Image {
                    id: imgTrigerNo
                    anchors.fill: parent
                    source: btnTrigerNo.pressed ? "image://MyProvider/statbtn_on_120_62.png" : "image://MyProvider/statbtn_off_120_62.png"

                    Text {
                        id: txtTrigerNoTitle
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.top: parent.top
                        anchors.topMargin: parent.height * _ratioDistance
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "MS Gothic"
                        font.bold: true
                        font.pixelSize: parent.height * _ratioFont
                        color: "black"
                    }

                    Text {
                        id: txtValueTrigerNo
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height * _ratioDistance
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "MS Gothic"
                        font.bold: true
                        font.pixelSize: (parent.height - 8) * _ratioFont
                        color: "black"
                    }
                }

                onClicked: {
                    loaderContent.item.objIOMonitor.showDlgTrigerNo()
                }
            }

            ToolButton {
                id: btnTrigerCondition
                Layout.fillHeight: true
                anchors.right: btnDisplay.left
                Layout.maximumHeight: parent.height * _ratioMaxHeight
                anchors.top: parent.top
                contentItem: Image {
                    id: imgTrigerCondition
                    anchors.fill: parent
                    source: btnTrigerCondition.pressed ? "image://MyProvider/statbtn_on_120_62.png" : "image://MyProvider/statbtn_off_120_62.png"

                    Text {
                        id: txtTriggerConditionTitle
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.top: parent.top
                        anchors.topMargin: parent.height * _ratioDistance
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "MS Gothic"
                        font.bold: true
                        font.pixelSize: parent.height * _ratioFont
                        color: "black"
                    }


                    Image {
                        id: iconTriggerCondition
                        width: parent.width / 2
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height * _ratioDistance
                        anchors.left: parent.left
                    }

                    Text {
                        id: txtValueTriggerCondition
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height * _ratioDistance
                        anchors.left: iconTriggerCondition.right
                        font.family: "MS Gothic"
                        font.bold: true
                        font.pixelSize: (parent.height - 8) * _ratioFont
                        color: "black"
                    }
                }

                onClicked: {
                    loaderContent.item.objIOMonitor.showDlgTrigerCondition()
                }
            }

            ToolButton {
                id: btnDisplay
                Layout.fillHeight: true
                anchors.right: btnHelp.left
                Layout.maximumHeight: parent.height * _ratioMaxHeight
                anchors.top: parent.top
                contentItem: Image {
                    id: imgTrigerDisplay
                    anchors.fill: parent
                    source: btnDisplay.pressed ? "image://MyProvider/statbtn_on_120_62.png" : "image://MyProvider/statbtn_off_120_62.png"

                    Text {
                        id: txtDisplayTitle
                        anchors.top: parent.top
                        anchors.topMargin: parent.height * _ratioDistance
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "MS Gothic"
                        font.bold: true
                        font.pixelSize: parent.height * _ratioFont
                        color: "black"
                    }

                    Text {
                        id: txtValueDisplay
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height * _ratioDistance
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "MS Gothic"
                        font.bold: true
                        font.pixelSize: (parent.height - 8) * _ratioFont
                        color: "black"
                    }
                }

                onClicked: {
                    loaderContent.item.objIOMonitor.showDlgDisplay()
                }
            }

            ToolButton {
                id: btnHelp
                Layout.fillHeight: true
                anchors.right: parent.right
                contentItem: Image {
                    id: imgTrigerHelp
                    anchors.fill: parent
                    source: btnHelp.pressed ? "image://MyProvider/popup_question_gray_on.png" : "image://MyProvider/popup_question_gray_off.png"
                }

                onClicked: {
                    var component = Qt.createComponent("../Dialog/SwitchLanguage.qml");
                    appWindow.showDialog(component,300,400);
//                    menuQuestion.__popup(Qt.rect(790,62,0,0),0,0);
//                    menuQuestion.open()
                }

//                MyMenu {
//                    id: menuQuestion
//                    widthItem: 200
//                    heightItem: 200

//                    MenuItem {
//                        id: itemLanguage
//                        anchors.fill: parent
//                        text: "Language"
//                        onTriggered: {
//                            console.log("ABC")
//                            var component = Qt.createComponent("../Dialog/SwitchLanguage.qml");
//                            appWindow.showDialog(component,300,400);
//                        }
//                    }
//                }
            }

            function settingValueDisplay(str) {
                txtValueDisplay.text = str
            }

            function settingValueTriggerCondition(str, source) {
                txtValueTriggerCondition.text = str
                iconTriggerCondition.source = source
            }

            function settingValueTriggerNo(str) {
                txtValueTrigerNo.text = str
            }

            function settingValueSignalType(str) {
                txtValueSignalType.text = str
            }

            function settingValueTitle(isStart) {
                if (isStart) {
                    txtStateMachine.text = objIOMonitorVM.txtStart
                }
                else {
                    txtStateMachine.text = objIOMonitorVM.txtStop
                }
            }

            function settingScreenName(isStartImport) {
                if (isStartImport) {
                    txtNameScreen.text = objIOMonitorVM.txtScreenName2
                }
                else {
                    txtNameScreen.text = objIOMonitorVM.txtScreenName
                }
            }
        }



//        Menu {
//            id: menuQuestion
////            x: btnHelp.x
////            y: btnHelp.height
////            transformOrigin: Menu.TopRight

////            background: Rectangle {
////                implicitWidth: btnHelp.width * 2 + btnDisplay.width
////                color: "#1A4670"
////                border.color: "#8CA6BD"
////                border.width: 2
////            }

//            MenuItem {
//                contentItem: Text {
//                    text: "Language"
//                    font.family: "MS Gothic"
//                    font.pixelSize: btnHelp.height * _ratioFont
//                    color: "white"
//                }
//                onTriggered: {
//                    var component = Qt.createComponent("qrc:/Dialog/SwitchLanguage.qml");
//                    appWindow.showDialog(component,300,400);
//                }
//            }

//            MenuItem {
//                contentItem: Text {
//                    text: "Version"
//                    font.family: "MS Gothic"
//                    font.pixelSize: btnHelp.height * _ratioFont
//                    color: "white"
//                }
//            }

//            MenuItem {
//                contentItem: Text {
//                    text: "Access Level Change"
//                    font.family: "MS Gothic"
//                    font.pixelSize: btnHelp.height * _ratioFont
//                    color: "white"
//                }
//                onTriggered: {
//                    var component = Qt.createComponent("qrc:/Dialog/AccessLevelDialog.qml");
//                    var winAccessLevelChange =component.createObject(loaderContent, {"x":  (Screen.width - 730) / 2, "y": (Screen.height - 410) / 2});
//                    winAccessLevelChange.show();
//                }
//            }
//        }
    }

    Component.onCompleted: {
//        objIOMonitorVM.onLoad()
//        mainModel.onChangeScreen.connect(updateStatusBar)
        updateText()
        mainModel.onChangeLanguage.connect(updateText)
    }

    function updateText() {
        objIOMonitorVM.onChangeLanguage()

        txtDisplayTitle.text = objIOMonitorVM.txtDisplayTitle
        txtSignalTypeTitle.text = objIOMonitorVM.txtSignalTypeTitle
        txtTrigerNoTitle.text = objIOMonitorVM.txtTrigerNoTitle
        txtTriggerConditionTitle.text = objIOMonitorVM.txtTrigerConditionTitle
        txtStateMachine.text = objIOMonitorVM.txtStop
        txtNameScreen.text = objIOMonitorVM.txtScreenName

        rowStatusBarIOMonitor.settingValueDisplay(objIOMonitorVM.listDisplay[0])
        var src = "image://MyProvider/statbar_event_down.png"
        rowStatusBarIOMonitor.settingValueTriggerCondition(objIOMonitorVM.listTrigerCondition[0], src)
        rowStatusBarIOMonitor.settingValueTriggerNo(objIOMonitorVM.listTrigerNo[0])
        rowStatusBarIOMonitor.settingValueSignalType(objIOMonitorVM.listSignalType[0])
    }
}
