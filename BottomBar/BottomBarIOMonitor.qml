import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import ControlApp 1.0
import "qrc:/IOMonitor"

Item {
    id: bottomBarIOMonitor

    property Item objIOMonitorBottomBar: rowBottomBarIOMonitor
    property real _ratioDistance: 0.1
    property real _ratioFont: 0.42
    property bool _isStartImport: true

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
                    source: btnBack.pressed ? "image://MyProvider/contbar_btn_touched_104.png" : "image://MyProvider/contbar_btn_104.png"
                    Image {
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: parent.height * _ratioDistance
                        source: "image://MyProvider/contbar_icon_back.png"
                    }
                    Text {
                        id: txtBack
                        font.family: "MS Gothic"
                        font.pixelSize: parent.height * _ratioFont
                        color: "white"
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: parent.height * _ratioDistance
                    }
                }
                onClicked: {
//                    loaderStatusBar.source = "qrc:/StatusBar/StatusBar.qml"
//                    loaderContent.source = "qrc:/Production/ProductionScreen_ver3.qml"
//                    loaderBottomBar.source = "BottomBarMainPage.qml"
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
                    source: btnSignalCondition.pressed ? "image://MyProvider/contbar_btn_touched_168.png" : "image://MyProvider/contbar_btn_168.png"
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
                            font.family: "MS Gothic"
                            font.pixelSize: parent.height * _ratioFont
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
                    source: btnSignalSelection.pressed ? "image://MyProvider/contbar_btn_touched_168.png" : "image://MyProvider/contbar_btn_168.png"
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
                            font.family: "MS Gothic"
                            font.pixelSize: parent.height * _ratioFont
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
                    source: btnStartStopImport.pressed ? "image://MyProvider/contbar_btn_touched_168.png" : "image://MyProvider/contbar_btn_168.png"
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
                            font.family: "MS Gothic"
                            font.pixelSize: parent.height * _ratioFont
                            color: "white"
                        }
                    }
                }

                onClicked: {
                    if (_isStartImport === true) {
                        imgStartImport.source = "image://MyProvider/contbar_icon_end.png"
                        txtStartImport.text = loaderStatusBar.item.objIOMonitorVM.txtStopImport
                        _isStartImport = false
                        loaderContent.item.objIOMonitor.updateFetchingData(true)
                        loaderStatusBar.item.objIOMonitorStatusBar.settingScreenName(true)
                    }
                    else {
                        imgStartImport.source = "image://MyProvider/contbar_icon_start.png"
                        txtStartImport.text = loaderStatusBar.item.objIOMonitorVM.txtStartImport
                        _isStartImport = true
                        loaderContent.item.objIOMonitor.updateFetchingData(false)
                        loaderStatusBar.item.objIOMonitorStatusBar.settingScreenName(false)
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
                    source: btnClear.pressed ? "image://MyProvider/contbar_btn_touched_168.png" : "image://MyProvider/contbar_btn_168.png"
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
                            font.family: "MS Gothic"
                            font.pixelSize: parent.height * _ratioFont
                            color: "white"
                        }
                    }
                }

                onClicked: {
                    loaderContent.item.objIOMonitor.updateClear()
                }
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
    }

    Component.onCompleted: {
        updateText()
        mainModel.onChangeLanguage.connect(updateText)
    }

    function updateText() {
        txtBack.text = loaderStatusBar.item.objIOMonitorVM.txtBack;
        txtSignalCondition.text = loaderStatusBar.item.objIOMonitorVM.txtSignalCondition
        txtSignalSelection.text = loaderStatusBar.item.objIOMonitorVM.txtSignalSelection
        txtStartImport.text = loaderStatusBar.item.objIOMonitorVM.txtStartImport
        txtClear.text = loaderStatusBar.item.objIOMonitorVM.txtClear
    }
}
