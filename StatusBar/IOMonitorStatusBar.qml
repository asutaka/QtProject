import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import ControlApp 1.0

Item {
    id: statusBarIOMonitor

    property alias statusBarIOMonitorObj: statusBarIOMonitor
    property alias iOMonitorStatusBarVM: iOMonitorStatusBarVMObject
    property real _ratioDistance: 0.1
    property real _ratioMaxHeight: 0.96875

    IOMonitorStatusBarVM {
        id : iOMonitorStatusBarVMObject
    }

    Image {
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
                        font.family: fontFactory.getFontFamily(FontFactory.FNT_M4)
                        font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M4)
//                        font.bold: true
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
                        font.family: fontFactory.getFontFamily(FontFactory.FNT_M4)
                        font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M4)
//                        font.bold: true
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
                    source: {
                        if (btnSignalType.pressed) {
                            return "image://MyProvider/statbtn_on_120_62.png"
                        } else {
                            return "image://MyProvider/statbtn_off_120_62.png"
                        }
                    }

                    Text {
                        id: txtSignalTypeTitle
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.top: parent.top
                        anchors.topMargin: parent.height * _ratioDistance
                        horizontalAlignment: Text.AlignHCenter
                        font.family: fontFactory.getFontFamily(FontFactory.FNT_M4)
                        font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M4)
//                        font.bold: true
                        color: "black"
                    }

                    Text {
                        id: txtValueSignalType
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height * _ratioDistance
                        horizontalAlignment: Text.AlignHCenter
                        font.family: fontFactory.getFontFamily(FontFactory.FNT_M4)
                        font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M4)
//                        font.bold: true
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
                    source: {
                        if (btnTrigerNo.pressed) {
                            return "image://MyProvider/statbtn_on_120_62.png"
                        } else {
                            return "image://MyProvider/statbtn_off_120_62.png"
                        }
                    }

                    Text {
                        id: txtTrigerNoTitle
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.top: parent.top
                        anchors.topMargin: parent.height * _ratioDistance
                        horizontalAlignment: Text.AlignHCenter
                        font.family: fontFactory.getFontFamily(FontFactory.FNT_M4)
                        font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M4)
//                        font.bold: true
                        color: "black"
                    }

                    Text {
                        id: txtValueTrigerNo
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height * _ratioDistance
                        horizontalAlignment: Text.AlignHCenter
                        font.family: fontFactory.getFontFamily(FontFactory.FNT_M4)
                        font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M4)
//                        font.bold: true
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
                    source: {
                        if (btnTrigerCondition.pressed) {
                            return "image://MyProvider/statbtn_on_120_62.png"
                        } else {
                            return "image://MyProvider/statbtn_off_120_62.png"
                        }
                    }

                    Text {
                        id: txtTriggerConditionTitle
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.top: parent.top
                        anchors.topMargin: parent.height * _ratioDistance
                        horizontalAlignment: Text.AlignHCenter
                        font.family: fontFactory.getFontFamily(FontFactory.FNT_M4)
                        font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M4)
//                        font.bold: true
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
                        font.family: fontFactory.getFontFamily(FontFactory.FNT_M4)
                        font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M4)
//                        font.bold: true
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
                    source: {
                        if (btnDisplay.pressed){
                            return "image://MyProvider/statbtn_on_120_62.png"
                        }else {
                            return "image://MyProvider/statbtn_off_120_62.png"
                        }
                    }

                    Text {
                        id: txtDisplayTitle
                        anchors.top: parent.top
                        anchors.topMargin: parent.height * _ratioDistance
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: fontFactory.getFontFamily(FontFactory.FNT_M4)
                        font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M4)
//                        font.bold: true
                        color: "black"
                    }

                    Text {
                        id: txtValueDisplay
                        width: parent.width
                        wrapMode : Text.WrapAnywhere
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height * _ratioDistance
                        horizontalAlignment: Text.AlignHCenter
                        font.family: fontFactory.getFontFamily(FontFactory.FNT_M4)
                        font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M4)
//                        font.bold: true
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
                    source: {
                        if (btnHelp.pressed) {
                            return "image://MyProvider/popup_question_gray_on.png"
                        } else {
                            return "image://MyProvider/popup_question_gray_off.png"
                        }
                    }
                }

                onClicked: {
                    var component = Qt.createComponent("qrc:/Dialog/SwitchLanguage.qml");
                    appWindow.showDialog(component,300,400);
                }
            }


        }
    }

    Component.onCompleted: {
        iOMonitorStatusBarVM.onLoad()
        updateText()
        mainModel.onChangeLanguage.connect(onChangeLanguage)
    }

    Component.onDestruction: {
        mainModel.onChangeLanguage.disconnect(onChangeLanguage)
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
            txtStateMachine.text = iOMonitorStatusBarVM.txtStart
        }
        else {
            txtStateMachine.text = iOMonitorStatusBarVM.txtStop
        }
    }

    function settingScreenName(isStartImport) {
        if (isStartImport) {
            txtNameScreen.text = iOMonitorStatusBarVM.txtScreenName2
        }
        else {
            txtNameScreen.text = iOMonitorStatusBarVM.txtScreenName
        }
    }

    function onChangeLanguage() {
        iOMonitorStatusBarVM.onChangeLanguage()
        updateText()
    }

    function updateText() {
        txtDisplayTitle.text = iOMonitorStatusBarVM.txtDisplayTitle
        txtSignalTypeTitle.text = iOMonitorStatusBarVM.txtSignalTypeTitle
        txtTrigerNoTitle.text = iOMonitorStatusBarVM.txtTrigerNoTitle
        txtTriggerConditionTitle.text = iOMonitorStatusBarVM.txtTrigerConditionTitle
        txtStateMachine.text = iOMonitorStatusBarVM.txtStop
        txtNameScreen.text = iOMonitorStatusBarVM.txtScreenName

        settingValueDisplay(iOMonitorStatusBarVM.valueDisplay)
        var src = "image://MyProvider/statbar_event_down.png"
        settingValueTriggerCondition(iOMonitorStatusBarVM.valueTrigerCondition, src)
        settingValueTriggerNo(iOMonitorStatusBarVM.valueTrigerNo)
        settingValueSignalType(iOMonitorStatusBarVM.valueSignalType)
    }
}
