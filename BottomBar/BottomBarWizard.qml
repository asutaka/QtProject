import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0
import CommonControl 1.0

Item {
    id: bottomBarWizaed
    property Item dynamicBotombar: bottomBarWizaed

    property bool visibleBtnCancel  : true
    property bool visibleBtnBack    : true
    property bool visibleBtnRetry   : true
    property bool visibleBtnNext    : true
    property bool visibleBtnFinish  : true

    property bool enableBtnCancel   : true
    property bool enableBtnBack     : true
    property bool enableBtnRetry    : true
    property bool enableBtnNext     : true
    property bool enableBtnFinish   : true

    Rectangle {
        id: rectBottom
        width: 1024
        height: 64
        color: "#ffffff"
        Image {
            id: rectBottomBkgnd
            x: 0
            y: 0
            source: "qrc:/Images/ControlBar_bg.png"
        }

        TK_Button {
            id: btnCancel
            x: 9
            y: 2
            width: 180
            height: 64
            visible: visibleBtnCancel
            mBackgroundImage: enableBtnCancel?"qrc:/Images/Key_h60_w180_Quit.png":"qrc:/Images/Key_h60_w180_Quit_dead.png"
            mText: qsTr("Cancel")
            mFont.family: "MS Gothic"
            mForeColor: "#ffffff"
            mFont.pixelSize: 35
            //            mTextAlignH: Text.AlignHCenter
            //            mTextAlignV: Text.AlignVCenter
            mTextAlign: 4
            mLeftPadding: 20

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(enableBtnBack)
                    {
                        btnCancel.mBackgroundImage= "qrc:/Images/Key_h60_w180_Quit_push.png"
                    }
                }
                onReleased:{
                    if(enableBtnBack)
                    {
                        btnCancel.mBackgroundImage= "qrc:/Images/Key_h60_w180_Quit.png"
                        mainModel.InnerChangeScreen(ScreenMng.Production)
                        mainModel.InnerChangeBottomBar(ScreenMng.BottomBarMainPage)
                    }
                }
                onCanceled: {
                    if(enableBtnBack)
                    {
                        btnCancel.mBackgroundImage= "qrc:/Images/Key_h60_w180_Quit.png"
                    }
                }
            }
        }

        TK_Button {
            id: btnBack

            x: 215
            y: 2
            width: 180
            height: 64
            visible: visibleBtnBack
            mBackgroundImage: enableBtnBack?"qrc:/Images/Key_h60_w180_Back.png":"qrc:/Images/Key_h60_w180_Back_dead.png"
            mText: qsTr("Back")
            mFont.family: "MS Gothic"
            mForeColor: "#ffffff"
            mFont.pixelSize: 32
            //            mTextAlignH: Text.AlignHCenter
            //            mTextAlignV: Text.AlignVCenter
            mTextAlign: 4
            mLeftPadding: 20

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(enableBtnBack)
                    {
                        btnBack.mBackgroundImage= "qrc:/Images/Key_h60_w180_Back_push.png"
                    }
                }
                onReleased:{
                    if(enableBtnBack)
                    {
                        btnBack.mBackgroundImage= "qrc:/Images/Key_h60_w180_Back.png"
                    }
                }
                onCanceled: {
                    if(enableBtnBack)
                    {
                        btnBack.mBackgroundImage= "qrc:/Images/Key_h60_w180_Back.png"
                    }
                }
            }
        }

        TK_Button {
            id: btnRetry

            x: 421
            y: 2
            width: 180
            height: 64
            visible: visibleBtnRetry
            mBackgroundImage: enableBtnRetry?"qrc:/Images/Key_h60_w180_Retry.png":"qrc:/Images/Key_h60_w180_Retry_dead.png"
            mText: qsTr("Retry")
            mFont.family: "MS Gothic"
            mForeColor: "#ffffff"
            mFont.pixelSize: 32
            //mTextAlignH: Text.AlignHCenter
            //mTextAlignV: Text.AlignVCenter
            mTextAlign: 4
            mLeftPadding: 20

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(enableBtnRetry)
                    {
                        btnRetry.mBackgroundImage= "qrc:/Images/Key_h60_w180_Retry_push.png"
                    }
                }
                onReleased:{
                    if(enableBtnRetry)
                    {
                        btnRetry.mBackgroundImage= "qrc:/Images/Key_h60_w180_Retry.png"
                    }
                }
                onCanceled: {
                    if(enableBtnRetry)
                    {
                        btnRetry.mBackgroundImage= "qrc:/Images/Key_h60_w180_Retry.png"
                    }
                }
            }
        }

        TK_Button {
            id: btnNext

            x: 627
            y: 2
            width: 180
            height: 64
            visible: visibleBtnNext
            mBackgroundImage: enableBtnNext?"qrc:/Images/Key_h60_w180_Next.png":"qrc:/Images/Key_h60_w180_Next_dead.png"
            mText: qsTr("Next")
            mFont.family: "MS Gothic"
            mForeColor: "#ffffff"
            mFont.pixelSize: 32
            //mTextAlignH: Text.AlignHCenter
            //mTextAlignV: Text.AlignVCenter
            mTextAlign: 4

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(enableBtnNext)
                    {
                        btnNext.mBackgroundImage= "qrc:/Images/Key_h60_w180_Next_push.png"
                    }
                }
                onReleased:{
                    if(enableBtnNext)
                    {
                        btnNext.mBackgroundImage= "qrc:/Images/Key_h60_w180_Next.png"
                        if(contentItem.numID === objScreen.screenEvalRJStart){
                            mainModel.InnerChangeScreen(ScreenMng.EvalRJ)
                            _config()
                            contentItem.nextRow()
                        }else if(contentItem.numID === objScreen.screenEvalRJ){
                            if(objPrivate.isNextScreen){
                                mainModel.InnerChangeScreen(ScreenMng.EvalRJEnd)
                                _config()
                            }else {
                                objPrivate.isNextScreen = contentItem.nextRow()
                            }
                        }
                    }
                }
                onCanceled: {
                    if(enableBtnNext)
                    {
                        btnNext.mBackgroundImage= "qrc:/Images/Key_h60_w180_Next.png"
                    }
                }
            }
        }

        TK_Button {
            id: btnFinish

            x: 833
            y: 2
            width: 180
            height: 64
            visible: visibleBtnFinish
            mBackgroundImage: enableBtnFinish?"qrc:/Images/Key_h60_w180_Finish.png":"qrc:/Images/Key_h60_w180_Finish_dead.png"
            mText: qsTr("Finish")
            mFont.family: "MS Gothic"
            mForeColor: "#ffffff"
            mFont.pixelSize: 32
            //mTextAlignH: Text.AlignHCenter
            //mTextAlignV: Text.AlignVCenter
            mTextAlign: 4
            mLeftPadding: 20

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(enableBtnFinish)
                    {
                        btnFinish.mBackgroundImage= "qrc:/Images/Key_h60_w180_Finish_push.png"
                    }
                }
                onReleased:{
                    if(enableBtnFinish)
                    {
                        btnFinish.mBackgroundImage= "qrc:/Images/Key_h60_w180_Finish.png"
                        mainModel.InnerChangeScreen(ScreenMng.ProductionV1)
                        mainModel.InnerChangeBottomBar(ScreenMng.BottomBarMainPage)
                    }
                }
                onCanceled: {
                    if(enableBtnFinish)
                    {
                        btnFinish.mBackgroundImage= "qrc:/Images/Key_h60_w180_Finish.png"
                    }
                }
            }
        }
    }
    QtObject {
        id: objPrivate
        property bool isNextScreen: false
    }

    QtObject {
        id: objScreen
        property int screenEvalRJStart: 0
        property int screenEvalRJ: 1
        property int screenEvalRJEnd: 2
    }

    Component.onCompleted:  {
        _default()
        _config()
    }
    function _default(){
        visibleBtnCancel = true
        visibleBtnBack = false
        visibleBtnRetry = false
        visibleBtnNext = true
        visibleBtnFinish = false
    }

    function _config(){
        switch(contentItem.numID){
        case objScreen.screenEvalRJStart:
            visibleBtnCancel = true
            visibleBtnBack = false
            visibleBtnRetry = false
            visibleBtnNext = true
            visibleBtnFinish = false
            break
        case objScreen.screenEvalRJ:
            visibleBtnCancel = true
            visibleBtnBack = false
            visibleBtnRetry = false
            visibleBtnNext = true
            visibleBtnFinish = false
            break
        case objScreen.screenEvalRJEnd:
            visibleBtnCancel = false
            visibleBtnBack = false
            visibleBtnRetry = false
            visibleBtnNext = false
            visibleBtnFinish = true
            break
        default:
            break
        }
    }
}
