import QtQuick 2.0
import QtQuick.Controls 1.4
import "../Control/menu"
import ControlApp 1.0
import CommonControl 1.0

Item {
    id: errorAlarmStatusBar
    width: 1024
    height: 64
    property string sourceAccessLevel: "qrc:/Images/statbar_accessLevel_1b.png"

    TK_PictureBox {
        anchors.fill: parent
        mImage: "qrc:/Images/Area02_Alert_Yellow_bg.png"
        mBackColor: "transparent"
        mBackgroundImageLayout: Image.Stretch
    }

    TK_PictureBox {
        id: staticon
        width: 64
        height: 64
        mImage: "qrc:/Images/staticon_exclamation.png"
        mBackColor: "transparent"
        mBackgroundImageLayout: Image.Pad
    }

    TK_Label{
        anchors.top: staticon.top
        anchors.left: staticon.right
        anchors.topMargin: 2
        anchors.leftMargin: 2
        mText: "ゼロNG1アラーム"
        mFont.pixelSize: 20
    }

    TK_Label {
        anchors.bottom: toolButton_Reset.bottom
        anchors.right: toolButton_Reset.left
        anchors.bottomMargin: 2
        anchors.rightMargin: 2
        mBackColor: "transparent"
        mText: "(A108)"
        mFont.pixelSize: 20
        mAutoSize: true
    }

    TK_Button{
        id: toolButton_Reset
        x: 712
        y: 0
        width: 120
        height: 62
        mBackgroundImage: "qrc:/Images/statbtn_off_120_62.png"
        mImage: "qrc:/Images/statbar_reset.png"
        mImageAlign: 1
        mForeColor: "black"
        mBackColor: "transparent"
        mBorderColor: "transparent"
        mBorderWidth: 0
        mText: "リセット"
        mFont.pixelSize: 20
        mTextAlign: 8
//        mTextAlignH: Text.AlignHCenter
//        mTextAlignV: Text.AlignBottom
        mPadding: 5

        onClicked: {
            mainModel.errorMode = false
            mainModel.InnerRefreshScreen()
            appWindow.closeDialog()
        }
    }

    TK_Button {
        id: toolButton_AccessLevel
        x: 832
        y: 0
        width: 120
        height: 62
        mBackgroundImage: pressed ? "qrc:/Images/statbtn_on_120_62.png" : "qrc:/Images/statbtn_off_120_62.png"
        mImage: sourceAccessLevel
        mImageAlign: 4
        mForeColor: "black"
        mBackColor: "transparent"
        mBorderColor: "transparent"
        mBorderWidth: 0
        mPadding: 5

        onClicked: {
            menuAccessLevel.__popup(Qt.rect(670,62,0,0),0,0);
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

    TK_Button {
        id: toolButton_Question
        x: 952
        y: 0
        width: 72
        height: 64
        mBackgroundImage: "qrc:/Images/popup_question_gray_off.png"
        mImageAlign: 4
        mForeColor: "black"
        mBackColor: "transparent"
        mBorderColor: "transparent"
        mBorderWidth: 0
        mPadding: 5
        onClicked:{
           menuQuestion.__popup(Qt.rect(790,62,0,0),0,0);
        }
        MyMenu{
            id: menuQuestion
            MenuItem {
                id: itemStop
                text: "Stop"
                onTriggered: {
                    mainModel.guiEvent(EnumControl.STOP);
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
                text: "Language"
                onTriggered: {
                    var component = Qt.createComponent("../Dialog/SwitchLanguage.qml");
                    appWindow.showDialog(component,300,400);
                }
            }
            MenuItem {
                text: "TestTheme"
                onTriggered: {
                    mainModel.InnerChangeScreen(ScreenMng.TestTheme)
                    appWindow.closeDialog()
                }
            }
            MenuItem {
                text: "Replace icon & text"
                onTriggered: {
                    mainModel.InnerChangeScreen(ScreenMng.GetPathReplace)
                    appWindow.closeDialog()
                }
            }
            MenuItem {
                text: "Instruction Manual"
                onTriggered:{
                    appWindow.closeDialog()
                    var component = Qt.createComponent("../Dialog/InstructionManualDialog.qml");
                    appWindow.showDialog(component,300,400);
                }
            }
            MenuItem {
                text: "Error Alarm"
                onTriggered:{
                    mainModel.InnerChangeStatusBar(ScreenMng.ErrorStatusBar)
                }
            }
        }

    }

    Component.onCompleted: {
        var component = Qt.createComponent("qrc:/ErrorAlarm/ErrorAlarm.qml");
        appWindow.showDialog(component, 1024, 704, 0, 64);
        mainModel.errorMode = true;
    }

    Component.onDestruction: {
        mainModel.errorMode = false;
    }
}
