import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Item {
    id:bottomBarMainPage
    property int menuItemWidth: 500
    width: 1024
    height: 64

    Image {
        id: bottomBgr
        anchors.fill: parent
        source: "qrc:/Images/ControlBar_bg.png"

        RowLayout {
            id: layoutBottom
            anchors.fill: parent

            ToolButton {
                id: btnMenu
                Layout.fillHeight: true
                anchors.left: parent.left

                contentItem: Image {
                    anchors.fill: parent
                    source: btnMenu.pressed ? "qrc:/Images/contbar_btn_touched_104.png" : "qrc:/Images/contbar_btn_104.png"
                    Image {
                        id: iconMenu
                        anchors.top: parent.top
                        anchors.topMargin: parent.height*0.05
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "qrc:/Images/contbar_icon_menu.png"
                    }
                }
                Text {
                    id: txtMenu
                    text: "Menu"
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height*0.05
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "MS Gothic"
                    font.pixelSize: parent.height*0.42
                    color: "#ffffff"
                }
                onClicked: {
                    //loaderContent.source="../MenuList/Menu.qml"
                }
            }

            ToolButton {
                id: btnChangeScreen
                Layout.fillHeight: true
                anchors.left: btnMenu.right
                width: parent.width/10
                contentItem: Image {
                    anchors.fill: parent
                    source: btnChangeScreen.pressed ? "qrc:/Images/contbar_btn_touched_112.png" : "qrc:/Images/contbar_btn_112.png"

                    RowLayout {
                        id: layoutScreenNo
                        Layout.margins: 10
                        width: parent.width
                        height: parent.height/2
                        Image {
                            id: screen1
                            Layout.fillWidth: true
                            source: "qrc:/Images/Icon_Screen_1_on.png"
                        }

                        Image {
                            id: screen2
                            Layout.fillWidth: true
                            source: "qrc:/Images/dispswitchbtnno2.png"
                        }

                        Image {
                            id: screen3
                            Layout.fillWidth: true
                            source: "qrc:/Images/dispswitchbtnno3.png"
                        }

                        Image {
                            id: screen4
                            Layout.fillWidth: true
                            source: "qrc:/Images/dispswitchbtnno4.png"
                        }

                        Image {
                            id: screen5
                            Layout.fillWidth: true
                            source: "qrc:/Images/dispswitchbtnno5.png"
                        }

                    }
                }
                Text {
                    id: txtDisplay
                    text: qsTr("Display")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height*0.05
                    font.family: "MS Gothic"
                    font.pixelSize: parent.height*0.42
                    color: "#ffffff"
                }

                onClicked: menuScreen.open()

                Menu {
                    id: menuScreen
                    y: -menuScreen.height
                    implicitWidth: menuItemWidth
                    transformOrigin: Menu.BottomRight
                    MenuItem {
                        text: "Fill Adjustment"
                        //                        onTriggered: fillAmount.open()
                    }
                    MenuItem {
                        text: "General"
                        //                        onTriggered: fillAmount.open()
                    }
                    MenuItem {
                        text: "Zoom Line"
                        //                        onTriggered: fillAmount.open()
                    }
                    MenuItem {
                        text: "Xbar RS"
                        //                        onTriggered: fillAmount.open()
                    }
                    MenuItem {
                        text: "Mass Display"
                        //                        onTriggered: fillAmount.open()
                    }
                }

            }

            ToolButton{
                id: btnOpeCheck
                Layout.fillHeight: true
                anchors.right: btnProCtrl.left
                contentItem: Image {
                    anchors.fill: parent
                    source: btnOpeCheck.pressed ? "qrc:/Images/w168h62_B_p.png" : "qrc:/Images/w168h62_B.png"

                    RowLayout {
                        id: layoutOpeCheck
                        anchors.fill: parent
                        anchors.topMargin: parent.height/16

                        Image {
                            id: iconOpeCheck
                            Layout.alignment: Qt.AlignHCenter
                            Layout.leftMargin: parent.width*0.05
                            source: "qrc:/Images/contbar_icon_operation.png"
                        }
                        Text {
                            id: txtOpeCheck
                            Layout.alignment: Qt.AlignHCenter
                            Layout.fillWidth: true
                            text: "Ope.Check"
                            font.family: "MS Gothic"
                            font.pixelSize: parent.height*0.42//27
                            color: "#ffffff"
                        }
                    }
                }


                onClicked: menuOpeCheck.open()

                Menu {
                    id: menuOpeCheck
                    y: -menuOpeCheck.height
                    implicitWidth: menuItemWidth
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Eval/Rj Confirmation"
                        //                        onTriggered: rjConfirmPopup.open()
                    }
                    MenuItem {
                        text: "Accuracy Check"
                        //                        onTriggered: accCheck.open()
                    }
                }
            }

            ToolButton {
                id: btnProCtrl
                Layout.fillHeight: true
                anchors.right: btnSetAdj.left
                contentItem: Image {
                    anchors.fill: parent
                    source: btnProCtrl.pressed ? "qrc:/Images/w168h62_B_p.png" : "qrc:/Images/w168h62_B.png"
                }
                RowLayout {
                    id: layoutProCtrl
                    anchors.fill: parent
                    anchors.topMargin: parent.height/16

                    Image {
                        id: iconManage
                        Layout.alignment: Qt.AlignHCenter
                        Layout.leftMargin: parent.width*0.05
                        source: "qrc:/Images/contbar_icon_manage.png"
                    }
                    Text {
                        id: txtProCtrl
                        Layout.alignment: Qt.AlignHCenter
                        Layout.fillWidth: true
                        text: "Pro Ctrl"
                        font.family: "MS Gothic"
                        font.pixelSize: parent.height*0.42
                        color: "#ffffff"
                    }
                }

                onClicked: menuProCtrl.open()

                Menu {
                    id: menuProCtrl
                    y: -menuProCtrl.height
                    implicitWidth: menuItemWidth
                    transformOrigin: Menu.BottomRight
                    MenuItem {
                        text: "Invalid Line"
                        //                        onTriggered: abc.open()
                    }

                    MenuItem {
                        text: "Clear Stats."
                        //                        onTriggered: abc.open()
                    }

                    MenuItem {
                        text: "Preset Count Clear"
                        //                        onTriggered: abc.open()
                    }

                }
            }

            ToolButton {
                id: btnSetAdj
                Layout.fillHeight: true
                anchors.right: parent.right
                anchors.rightMargin: parent.width*0.1
                contentItem: Image {
                    anchors.fill: parent
                    source: btnSetAdj.pressed ? "qrc:/Images/w168h62_B_p.png" : "qrc:/Images/w168h62_B.png"

                    RowLayout {
                        id: layoutSetAdj
                        anchors.fill: parent
                        anchors.topMargin: parent.height/16

                        Image {
                            id: iconSetAdj
                            Layout.alignment: Qt.AlignHCenter
                            Layout.leftMargin: parent.width*0.05
                            source: "qrc:/Images/contbar_icon_config.png"
                        }
                        Text {
                            id: txtSetAdj
                            Layout.alignment: Qt.AlignHCenter
                            Layout.fillWidth: true
                            text: "Set/Adj"
                            font.family: "MS Gothic"
                            font.pixelSize: parent.height*0.42
                            color: "#ffffff"
                        }
                    }

                }
                onClicked: menuSetAdj.open()

                Menu {
                    id: menuSetAdj
                    y: -menuSetAdj.height
                    implicitWidth: menuItemWidth
                    transformOrigin: Menu.BottomRight
                    MenuItem {
                        text: "Timing Adjust"
                        onTriggered: {
                            // open Timing Adjustment screen
                        }
                    }

                    MenuItem {
                        text: "Sensitivity Correction"
                        onTriggered: {
                            // open Sensitivity Correction screen
                        }
                    }

                }

            }

        }
    }

}
