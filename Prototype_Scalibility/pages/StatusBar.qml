import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import QtQml 2.2

Item {
    id: statusBar
    property string strDate: Qt.formatDateTime(new Date(), "dd-MM-yyyy")
    property string strTime: Qt.formatTime( new Date(),"hh:mm")
    property int menuItemWidth: 500
    width: 1024
    height: 64

    Image {
        id: topBgr
        anchors.fill: parent
        source: "qrc:/Images/StatusBar_bg.png"

        RowLayout {
            id: layoutTop
            anchors.fill: parent

            ToolButton {
                id: btnIconStatus
                Layout.fillHeight: true
                anchors.left: parent.left
                contentItem: Image {
                    id: imgIconStatus
                    anchors.fill: parent
                    source: "qrc:/Images/status_icon.png"
                }
            }

            ToolButton {
                id: btnScreenName
                Layout.fillHeight: true
                Layout.maximumHeight: parent.height*0.96875    //using for Image size greater than bgr 2 pixel
                anchors.top: parent.top
                anchors.left: btnIconStatus.right
                contentItem: Image {
                    id: imgScreenName
                    anchors.fill: parent
                    source: "qrc:/Images/status_basic.png"
                    Text {
                        id: txtState
                        x: parent.width/60
                        y: parent.height/30
                        color: "#1d1919"
                        text: qsTr("STOP")
                        font.pixelSize: parent.height/4
                    }

                    Image {
                        id: imgUSBMem
                        anchors.right: parent.right
                        anchors.margins: parent.width/50
                        width: parent.height/2
                        height: parent.height/2
                        source: "../Images/StatusArea_Icon_USBmemory.png"
                    }

                    Text {
                        id: txtNameScreen
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.margins: parent.width/50
                        color: "#1d1919"
                        text: "Show X-bar R/s"
                        font.pixelSize: parent.height/4
                    }
                }
            }

            ToolButton {
                id: btnFrequence
                Layout.fillHeight: true
                Layout.maximumHeight: parent.height*0.96875
                anchors.top: parent.top
                anchors.left: btnScreenName.right
                contentItem: Image {
                    id: imgFrequence
                    anchors.fill: parent
                    source: "qrc:/Images/statbtn_off_120_62.png"
                    Text {
                        id: txtTime
                        text: qsTr("183 ms")
                        font.pixelSize: parent.height/4
                        anchors.centerIn: parent
                    }
                }
            }

            ToolButton {
                id: btnDateTime
                Layout.fillHeight: true
                Layout.maximumHeight: parent.height*0.96875
                anchors.top: parent.top
                anchors.right: btnAccessLevel.left
                contentItem: Image {
                    anchors.fill: parent
                    Layout.alignment: Qt.AlignCenter
                    source: btnDateTime.pressed ? "qrc:/Images/statbtn_on_120_62.png" : "qrc:/Images/statbtn_off_120_62.png"
                }
                Column {
                    anchors.centerIn: parent
                    spacing: 2
                    Text {
                        id: date
                        Layout.alignment: Qt.AlignCenter
                        text: qsTr(strDate)
                        font.pixelSize: 15
                    }

                    Text {
                        id: curtime
                        Layout.alignment: Qt.AlignCenter
                        text: qsTr(strTime)
                        font.pixelSize: 15
                    }
                }

                onClicked: {
                    console.log("window.width: " + window.width)
                    console.log("window.height: " + window.height)
                    //loaderContent.source="qrc:/Control/dateTime/DateTimeChange.qml"
                }
            }

            ToolButton {
                id: btnAccessLevel
                Layout.fillHeight: true
                Layout.maximumHeight: parent.height*0.96875 //ratio between button and topbgr is 60/64
                anchors.top: parent.top
                anchors.right: btnQuestion.left
                contentItem: Image {
                    anchors.fill: parent
                    id: imgAccessLevel
                    source: btnAccessLevel.pressed?"qrc:/Images/statbtn_on_120_62.png" : "qrc:/Images/statbtn_off_120_62.png"
                    Image {
                        id: iconAccessLevel
                        anchors.centerIn: parent
                        source: "qrc:/Images/statbar_accessLevel_1b.png"
                    }
                }

                onClicked: {
                    console.log("btnAccessLevel.height: " + btnAccessLevel.height)
                    console.log("topBgr.height: " + topBgr.height)
                    levelMenu.open()
                }

                Menu {
                    id: levelMenu
                    y: parent.height
                    implicitWidth: menuItemWidth
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Operator Level 1"
                        onTriggered: {
                        }
                    }
                    MenuItem {
                        text: "Operator Level 2"
                        onTriggered: {
                        }
                    }
                    MenuItem {
                        text: "Manager Level"
                        onTriggered: {
                        }
                    }
                    MenuItem {
                        text: "Service Engineer Level"
                        onTriggered: {
                            showPasswordKeyboard(4);
                        }
                    }
                }
            }

            ToolButton {
                id: btnQuestion
                Layout.fillHeight: true
                anchors.right: parent.right
                contentItem: Image {
                    anchors.fill: parent
                    source: btnQuestion.pressed ? "../Images/popup_question_gray_on.png" : "../Images/popup_question_gray_off.png"
                }
                onClicked: optionsMenu.open()

                Menu {
                    id: optionsMenu
                    y: parent.height
                    implicitWidth: menuItemWidth
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Connect Server"
                        onTriggered: {
                            //TODO
                        }
                    }
                    MenuItem {
                        text: "Language"
                        onTriggered: {
                            //TODO
                        }
                    }
                    MenuItem {
                        text: "Version"
                    }
                    MenuItem {
                        text: "Access Level Change"
                        onTriggered: {
                            //TODO
                        }
                    }
                }
            }

        }

    }

}
