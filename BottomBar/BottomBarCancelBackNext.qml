import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0

Item {
    id: bottomBarCancelBackNext
    property Item dynamicBotombar: bottomBarCancelBackNext
    property bool enableBtnBack: false
    property bool enableBtnFinish: true
    property int _currentLine
    property bool isForLine
    property var _listValue

    Rectangle {
        id: rectBottom
        width: 1024
        height: 64
        color: "#ffffff"
        Image {
            id: rectBottomBkgnd
            x: 0
            y: 0
            source: "../Images/ControlBar_bg.png"
        }
        ToolButton {
            id: toolButton_Cancel
            x: 0
            y: 0
            width: 180
            height: 64
            Image{
                id: imgCancel
                anchors.fill: parent
                source: "../Images/Key_h60_w180_Quit.png"
                Text {
                    x: 60
                    y: 17
                    text: "Cancel"
                    font.family: "MS Gothic"
                    font.pixelSize: 32
                    color: "#ffffff"
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgCancel.source= "../Images/Key_h60_w180_Quit_push.png"
                    mainModel.InnerChangeScreen(ScreenMng.Production)
                    mainModel.InnerChangeBottomBar(ScreenMng.BottomBarMainPage)
                }
                onReleased:{
                    imgCancel.source= "../Images/Key_h60_w180_Quit.png"
                }
                onCanceled: {
                    imgCancel.source= "../Images/Key_h60_w180_Quit.png"
                }
            }
        }
        ToolButton {
            id: toolButton_Back
            x: 190
            y: 0
            width: 180
            height: 64
            Image{
                id:imgBack
                anchors.fill: parent
                source: {
                    if(enableBtnBack)
                    {
                        imgBack.source = "../Images/Key_h60_w180_Back.png"
                    }
                    else
                    {
                        imgBack.source = "../Images/Key_h60_w180_Back_dead.png"
                    }
                }
                Text {
                    x: 60
                    y: 17
                    text: "Back"
                    font.family: "MS Gothic"
                    font.pixelSize: 32
                    color: "#ffffff"
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(enableBtnBack)
                    {
                        _currentLine = contentItem.dynamicCorrectionScreen._getCurrentLine();
                        enableBtnBack = false;

                        enableBtnFinish = true;
                        txtCompleted.visible = false;
                        txtNext.visible = true;
                        imgFinish.source = "../Images/Key_h60_w400_Next.png"
                        mainModel.InnerChangeScreen(ScreenMng.InputMasterWork)
                        contentItem.inputMasterWorkScreen.setLine(_currentLine);
                        contentItem.inputMasterWorkScreen.setForLine(isForLine);
                        contentItem.inputMasterWorkScreen.setMasterValue(_listValue);
                    }
                }
                onReleased:{
                    imgBack.source= "../Images/Key_h60_w180_Back_dead.png"
                }
                onCanceled: {
                    imgBack.source= "../Images/Key_h60_w180_Back_dead.png"
                }
            }
        }
        ToolButton {
            id: toolButton_Finish
            x: 623
            y: 0
            width: 400
            height: 64
            Image{
                id:imgFinish
                anchors.fill: parent
                source: {
                    if(enableBtnFinish)
                    {
                        imgFinish.source = "../Images/Key_h60_w400_Next.png"
                    }
                    else
                    {
                        imgFinish.source = "../Images/Key_h60_w400_Next_dead.png"
                    }
                }
            }
            Text {
                id: txtNext
                x: 180
                y: 17
                text: "Next"
                font.family: "MS Gothic"
                font.pixelSize: 32
                color: "#ffffff"
                visible: true
            }
            Text {
                id: txtCompleted
                x: 120
                y: 17
                text: "Completed"
                font.family: "MS Gothic"
                font.pixelSize: 32
                color: "#ffffff"
                visible: false
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {   
                    if(enableBtnFinish)
                    {
                        imgFinish.source= "../Images/Key_h60_w400_Next_push.png"
                        if(loaderContent.source.toString() === "qrc:/DynamicCorrection/InputMasterWork.qml")
                        {
                            _currentLine = contentItem.inputMasterWorkScreen.getLine();
                            isForLine = contentItem.inputMasterWorkScreen.getForLine();
                            _listValue = contentItem.inputMasterWorkScreen.getMasterValue();

                            mainModel.InnerChangeScreen(ScreenMng.DynamicCorrection)

                            contentItem.dynamicCorrectionScreen._setCurrentLine(_currentLine);
                            contentItem.dynamicCorrectionScreen._setMasterValue(_listValue);

                            txtCompleted.visible = true;
                            txtNext.visible = false;
                        }
                        else
                        {
                            mainModel.InnerChangeScreen(ScreenMng.Production)
                            mainModel.InnerChangeBottomBar(ScreenMng.BottomBarMainPage)
                        }
                    }
                }
            }
        }
    }
    function _enableBtnBack(isEnable)
    {
        if(isEnable)
        {
            enableBtnBack = true;
            imgBack.source = "../Images/Key_h60_w180_Back.png"
        }
        else
        {
            enableBtnBack = false;
            imgBack.source = "../Images/Key_h60_w180_Back_dead.png"
        }
    }
    function _enableBtnFinish(isEnable)
    {
        if(isEnable)
        {
            enableBtnFinish = true;
            imgFinish.source = "../Images/Key_h60_w400_Next.png"
        }
        else
        {
            enableBtnFinish = false;
            imgFinish.source = "../Images/Key_h60_w400_Next_dead.png"
        }
    }
}
