import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import ControlApp 1.0
import "qrc:/IOMonitor"

Item {
    id: bottomBarIOMonitor
    property alias bottomBarIOMonitorVM: bottomBarIOMonitorVMObject
    property alias bottomBarIOMonitorObj: bottomBarIOMonitor
    property real _ratioDistance: 0.1
    property bool _isStartImport: true

    BottomBarIOMonitorVM {
        id: bottomBarIOMonitorVMObject
    }

    Image {

        id: bkgBottomBarIOMonitor
        width: 1024
        height: 64
        source: "image://MyProvider/ControlBar_bg.png"

        RowLayout {
            id: rowBottomBarIOMonitor
            anchors.fill: parent

            ToolButton {
                id: btnBack
                Layout.fillHeight: true
                contentItem: Image {
                    id: imgBack
                    anchors.fill: parent
                    source: {
                        if (btnBack.pressed) {
                            return "image://MyProvider/contbar_btn_touched_104.png"
                        } else {
                            return "image://MyProvider/contbar_btn_104.png"
                        }
                    }
                    Image {
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: parent.height * _ratioDistance
                        source: "image://MyProvider/contbar_icon_back.png"
                    }
                    Text {
                        id: txtBack
                        font.family: fontFactory.getFontFamily(FontFactory.FNT_L3)
                        font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_L3)
                        color: "white"
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: parent.height * _ratioDistance
                    }
                }
                onClicked: {
                    mainModel.GoBackScreen()
                }
            }

            ToolButton {
                id: btnSignalCondition
                Layout.fillHeight: true
                anchors.right: btnSignalSelection.left
                contentItem: Image {
                    id: imgSignalCondition
                    anchors.fill: parent
                    source: {
                        if(btnSignalCondition.pressed) {
                            return "image://MyProvider/contbar_btn_touched_168.png"
                        } else {
                            return "image://MyProvider/contbar_btn_168.png"
                        }
                    }
                    RowLayout {
                        id: layoutSignalCondition
                        anchors.fill: parent

                        Image {
                            id: imgInput
                            anchors.leftMargin: parent.width * _ratioDistance
                            Layout.alignment: Qt.AlignHCenter
                            source: "image://MyProvider/contbar_icon_input.png"
                        }
                        Text {
                            id: txtSignalCondition
                            width: parent.width
                            wrapMode : Text.WrapAnywhere
                            anchors.left: imgInput.right
                            font.family: fontFactory.getFontFamily(FontFactory.FNT_L3)
                            font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_L3)
                            color: "white"
                        }
                    }
                }
            }

            ToolButton {
                id: btnSignalSelection
                Layout.fillHeight: true
                anchors.right: btnStartStopImport.left
                contentItem: Image {
                    id: imgSignalSelection
                    anchors.fill: parent
                    source: {
                        if (btnSignalSelection.pressed) {
                            return "image://MyProvider/contbar_btn_touched_168.png"
                        } else {
                            return "image://MyProvider/contbar_btn_168.png"
                        }
                    }
                    RowLayout {
                        id: layoutSignalSelect
                        anchors.fill: parent

                        Image {
                            id: imgSelect
                            anchors.leftMargin: parent.width * _ratioDistance
                            Layout.alignment: Qt.AlignHCenter
                            source: "image://MyProvider/contbar_icon_select.png"
                        }
                        Text {
                            id: txtSignalSelection
                            width: parent.width
                            wrapMode : Text.WrapAnywhere
                            anchors.left: imgSelect.right
                            font.family: fontFactory.getFontFamily(FontFactory.FNT_L3)
                            font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_L3)
                            color: "white"
                        }
                    }
                }

                onClicked: {
                    loaderContent.item.objIOMonitor.showDlgSignalSelect()
                }
            }

            ToolButton{
                id: btnStartStopImport
                Layout.fillHeight: true
                anchors.right: btnClear.left
                contentItem: Image{
                    id: bkgStartStopImport
                    anchors.fill: parent
                    source: {
                        if (btnStartStopImport.pressed) {
                            return "image://MyProvider/contbar_btn_touched_168.png"
                        } else {
                            return "image://MyProvider/contbar_btn_168.png"
                        }
                    }
                    RowLayout {
                        id: layoutStartStopImport
                        anchors.fill: parent

                        Image {
                            id: imgStartImport
                            anchors.leftMargin: parent.width * _ratioDistance
                            Layout.alignment: Qt.AlignHCenter
                            source: "image://MyProvider/contbar_icon_start.png"
                        }
                        Text {
                            id: txtStartImport
                            width: parent.width
                            wrapMode : Text.WrapAnywhere
                            anchors.left: imgStartImport.right
                            font.family: fontFactory.getFontFamily(FontFactory.FNT_L3)
                            font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_L3)
                            color: "white"
                        }
                    }
                }

                onClicked: {
                    if (_isStartImport === true) {
                        imgStartImport.source = "image://MyProvider/contbar_icon_end.png"
                        txtStartImport.text = bottomBarIOMonitorVM.txtStopImport
                        _isStartImport = false
                        if (loaderContent.item.objIOMonitor != null) {
                            loaderContent.item.objIOMonitor.updateFetchingData(true)
                        }
                        if (loaderStatusBar.item.statusBarIOMonitorObj != null) {
                            loaderStatusBar.item.statusBarIOMonitorObj.settingScreenName(true)
                        }
                    }
                    else {
                        imgStartImport.source = "image://MyProvider/contbar_icon_start.png"
                        txtStartImport.text = bottomBarIOMonitorVM.txtStartImport
                        _isStartImport = true
                        if (loaderContent.item.objIOMonitor != null) {
                            console.log ("test content")
                            loaderContent.item.objIOMonitor.updateFetchingData(false)
                        }
                        if (loaderStatusBar.item.statusBarIOMonitorObj != null) {
                            loaderStatusBar.item.statusBarIOMonitorObj.settingScreenName(false)
                            console.log ("test status bar")
                        }
                    }
                }
            }

            ToolButton{
                id: btnClear
                Layout.fillHeight: true
                anchors.right: parent.right
                anchors.rightMargin: parent.width * _ratioDistance
                contentItem: Image {
                    id: bkgClear
                    anchors.fill: parent
                    source: {
                        if(btnClear.pressed) {
                            return "image://MyProvider/contbar_btn_touched_168.png"
                        } else {
                            return "image://MyProvider/contbar_btn_168.png"
                        }
                    }
                    RowLayout {
                        id: layoutClear
                        anchors.fill: parent

                        Image {
                            id: imgClear
                            anchors.leftMargin: parent.width * _ratioDistance
                            Layout.alignment: Qt.AlignHCenter
                            source: "image://MyProvider/contbar_icon_clear.png"
                        }
                        Text {
                            id: txtClear
                            width: parent.width
                            wrapMode : Text.WrapAnywhere
                            anchors.left: imgClear.right
                            font.family: fontFactory.getFontFamily(FontFactory.FNT_L3)
                            font.pixelSize: fontFactory.getFontSize(FontFactory.FNT_L3)
                            color: "white"
                        }
                    }
                }

                onClicked: {
                    loaderContent.item.objIOMonitor.updateClear()
                }
            }


        }
    }

    Component.onCompleted: {
        bottomBarIOMonitorVM.onLoad()
        updateText()
        mainModel.onChangeLanguage.connect(onChangeLanguage)
    }

    Component.onDestruction: {
        mainModel.onChangeLanguage.disconnect(onChangeLanguage)
    }

    function onChangeLanguage() {
        bottomBarIOMonitorVM.onChangeLanguage()
        updateText()
    }

    function updateText() {
        txtBack.text = bottomBarIOMonitorVM.txtBack;
        txtSignalCondition.text = bottomBarIOMonitorVM.txtSignalCondition
        txtSignalSelection.text = bottomBarIOMonitorVM.txtSignalSelection
        txtStartImport.text = bottomBarIOMonitorVM.txtStartImport
        txtClear.text = bottomBarIOMonitorVM.txtClear
    }

    function updateStartStopImport(isStatic) {
        if (isStatic) {
            imgStartImport.source = "image://MyProvider/contbar_icon_start.png"
            txtStartImport.text = loaderStatusBar.item.objIOMonitorVM.txtStartImport
            _isStartImport = true
            loaderContent.item.objIOMonitor.updateFetchingData(false)
        }
    }
}
