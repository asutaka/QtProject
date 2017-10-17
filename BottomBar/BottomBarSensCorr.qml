import QtQuick 2.0
import QtQuick.Controls 1.4
import ControlApp 1.0
import QtQuick.Controls.Styles 1.4


Item {
    property Item  btBarSensCorr: bottomBarSensCorr
    property bool isInActive: false
    property bool ischecked
    id: bottomBarSensCorr

    Rectangle{
        id: rectBottomSensCorr
        width: 1024
        height: 64
        color: "#ffffff"
        Image {
            id: rectBottomBkgnd
            x: 0
            y: 0
            source: "../Images/ControlBar_bg.png"
        }
        ToolButton{
            id: _btnCancel
            x: 9
            y: 2
            width: 180
            height: 60
            Image{
                id: imgCancel
                anchors.fill: parent
                source: "../Images/Key_h60_w180_Quit.png"
                Text {
                    text: "Cancel"
                    font.family: "MS Gothic"
                    font.pixelSize:24
                    color: "#ffffff"
                    //anchors.bottom: parent.bottom
                    anchors.centerIn: parent
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
            }
        }
        ToolButton{
            id: _btnBackDead
            x: 218
            y: 2
            width: 180
            height: 60
            Image{
                id: imgBackDead
                anchors.fill: parent
                source: "../Images/Key_h60_w180_Back_dead.png"
                Text {
                    text: "Back"
                    font.family: "MS Gothic"
                    font.pixelSize:24
                    color: "#ffffff"
                    anchors.bottom: parent.bottom
                    anchors.centerIn: parent
                }
            }
        }
        ToolButton{
            id: _btnBack
            x: 218
            y: 2
            width: 180
            height: 60
            visible: isInActive
            Image{
                id: imgBack
                anchors.fill: parent
                source: "../Images/Key_h60_w180_Back.png"
                Text {
                    text: "Back"
                    font.family: "MS Gothic"
                    font.pixelSize:24
                    color: "#ffffff"
                    //anchors.bottom: parent.bottom
                    anchors.centerIn: parent
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgBack.source= "../Images/Key_h60_w180_Back_push.png"
                }
                onReleased:{
                    var currentScr =loaderContent.source.toString();
                    if(currentScr === "qrc:/SensitiveCorrection/SensCorrInputWeight.qml")
                    {
                        imgBack.source= "../Images/Key_h60_w180_Back.png"
                        mainModel.InnerChangeScreen(ScreenMng.SensCorrStart)
                        _btnBackDead.visible=true;
                        _btnBack.visible =false;
                    }
                    if(currentScr === "qrc:/SensitiveCorrection/SensCorrStep.qml")
                    {
                        if(ischecked === false){
                            imgBack.source= "../Images/Key_h60_w180_Back.png"
                            mainModel.InnerChangeScreen(ScreenMng.SensCorrInputWeight)
                            _btnNextDead.visible=false;
                            _btnStart.visible=false;
                            _btnNext_60_180.visible=false;
                            _btnNext_60_400.visible=true;
                            _btnFN.visible=false;
                        }
                        else if( _btnFN.visible ===true)
                        {
                            imgBack.source= "../Images/Key_h60_w180_Back.png"
                            mainModel.InnerChangeScreen(ScreenMng.SensCorrInputWeight)
                            _btnNextDead.visible=false;
                            _btnStart.visible=false;
                            _btnNext_60_180.visible=false;
                            _btnNext_60_400.visible=true;
                            _btnFN.visible=false;
                        }
                        else
                        {
                            imgBack.source= "../Images/Key_h60_w180_Back.png"
                            contentItem.sensCorrStep.setImgActive(ischecked);
                            _btnStart.visible=false;
                            _btnNextDead.visible=false;
                            _btnNext_60_180.visible=true;
                            _btnFN.visible=true;
                            _btnBackDead.visible=false;
                            start3.visible=false
                            start1.visible=true
                            start2.visible=false
                            contentItem.sensCorrStep1.onClickBack();
                        }
                    }
                }
            }
        }
        ToolButton{
            id: _btnNext_60_400
            x: 623
            y: 2
            width: 400
            height: 60
            Image{
                id: imgNext60_400
                anchors.fill: parent
                source: "../Images/Key_h60_w400_Next.png"
                Text {
                    text: "Next"
                    font.family: "MS Gothic"
                    font.pixelSize:24
                    color: "#ffffff"
                    anchors.bottom: parent.bottom
                    anchors.centerIn: parent
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgNext60_400.source= "../Images/Key_h60_w400_Next_push.png"
                }
                onReleased:{
                    imgNext60_400.source= "../Images/Key_h60_w400_Next.png"
                    var currentScr = loaderContent.source.toString();
                    if(currentScr ==="qrc:/SensitiveCorrection/SensCorrStart.qml")
                    {
                        imgNext60_400.source= "../Images/Key_h60_w400_Next.png"
                        mainModel.InnerChangeScreen(ScreenMng.SensCorrInputWeight)
                        _btnBack.visible=true;
                        _btnBackDead.visible = false;
                    }
                    if(currentScr=== "qrc:/SensitiveCorrection/SensCorrInputWeight.qml")
                    {
                        var weight = contentItem.sensCorrInputWeight.getValueInput();
                        ischecked = contentItem.sensCorrInputWeight.getStateCheckbox();
                        if(ischecked === false)
                        {
                            imgNext60_400.source= "../Images/Key_h60_w400_Next.png"
                            mainModel.InnerChangeScreen(ScreenMng.SensCorrStep)
                            _btnStart.visible=true;
                            _btnNextDead.visible=true;
                            _btnNext_60_400.visible=false;
                            contentItem.sensCorrStep.setValue(weight,ischecked);
                        }
                        else
                        {
                            imgNext60_400.source= "../Images/Key_h60_w400_Next.png"
                            mainModel.InnerChangeScreen(ScreenMng.SensCorrStep)
                            contentItem.sensCorrStep.setImgActive(ischecked);
                            _btnStart.visible=false;
                            _btnNext_60_180.visible=true;
                            _btnNext_60_400.visible=false;
                            _btnFN.visible=true;
                            contentItem.sensCorrStep.setValue(weight,ischecked);
                        }
                    }
                }
            }
        }
        ToolButton{
            id: _btnNext_60_180
            x: 764
            y: 2
            width: 180
            height: 60
            visible: isInActive
            Image{
                id: imgNext60_180
                anchors.fill: parent
                source: "../Images/Key_h60_w180_Next.png"
                Text {
                    text: "Next"
                    font.family: "MS Gothic"
                    font.pixelSize:24
                    color: "#ffffff"
                    anchors.centerIn: parent
                }
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    imgNext60_180.source="../Images/Key_h60_w180_Next_push.png"
                }
                onReleased: {
                    imgNext60_180.source="../Images/Key_h60_w180_Next.png"
                    var imgActive =contentItem.sensCorrStep.setImgActive();
                    contentItem.sensCorrStep.visibleImageStep(0);
                    contentItem.sensCorrStep1.onClickNext();
                    contentItem.sensCorrStep1.clearSelection();
                    contentItem.sensCorrStep.setImgActive(imgActive);
                    _btnStart.visible=true;
                    _btnNext_60_180.visible=false;
                    _btnNextDead.visible=true;
                    _btnFN.visible=false;
                }
            }
        }
        ToolButton{
            id: _btnNextDead
            x: 764
            y: 2
            width: 180
            height: 60
            visible: isInActive
            Image{
                id: imgNextDead
                anchors.fill: parent
                source: "../Images/Key_h60_w180_Next_dead.png"
                Text {
                    text: "Next"
                    font.family: "MS Gothic"
                    font.pixelSize:24
                    color: "#ffffff"
                    anchors.centerIn: parent
                }
            }
        }
        ToolButton {
            id: _btnStart
            x: 581
            y: 2
            width: 180
            height: 60
            visible: isInActive
            Image{
                id: imgStart
                anchors.fill: parent
                source: "../Images/Key_h60_w180_Next.png"
            }
            Text {
                id: start1
                x: 0
                y: 0
                width: 120
                text: "Start St.1"
                visible: true
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -22
                verticalAlignment: Text.AlignVCenter
                font.pixelSize:24
                font.family: "MS Gothic"
                color: "#ffffff"
                anchors.centerIn: parent
            }
            Text {
                id: start2
                x: 0
                y: 0
                width: 120
                text: "Start St.2"
                visible: false
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -22
                verticalAlignment: Text.AlignVCenter
                font.pixelSize:24
                font.family: "MS Gothic"
                color: "#ffffff"
                anchors.centerIn: parent
            }
            Text {
                id: start3
                x: 0
                y: 0
                width: 120
                text: "Start St.3"
                visible: false
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -22
                verticalAlignment: Text.AlignVCenter
                font.pixelSize:24
                font.family: "MS Gothic"
                color: "#ffffff"
                anchors.centerIn: parent
            }
            Text {
                id: start_finish
                x: 0
                y: 0
                width: 120
                text: "Finish"
                visible: false
                verticalAlignment: Text.AlignVCenter
                font.pixelSize:24
                font.family: "MS Gothic"
                color: "#ffffff"
                anchors.centerIn: parent
                anchors.bottom: parent.bottom
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgStart.source= "../Images/Key_h60_w180_Next_push.png"

                }
                onReleased:{
                    switch(true)
                    {
                    case start1.visible :
                        contentItem.sensCorrStep.visibleImageStep(1);
                        contentItem.sensCorrStep1.onClickStart(1, false);
                        start2.visible=true
                        start3.visible=false
                        start1.visible=false
                        _btnBack.visible=false;
                        _btnBackDead.visible=true;
                        break;
                    case start2.visible :
                        contentItem.sensCorrStep.visibleImageStep(2);
                        contentItem.sensCorrStep1.onClickStart(2, false);
                        start3.visible=true
                        start1.visible=false
                        start2.visible=false
                        _btnBack.visible=false;
                        _btnBackDead.visible=true;
                        break;
                    case start3.visible :
                        contentItem.sensCorrStep.visibleImageStep(3);
                        contentItem.sensCorrStep1.onClickStart(3, false);
                        start_finish.visible=true
                        start3.visible=false
                        break;
                    }
                    imgStart.source= "../Images/Key_h60_w180_Next.png"
                }
                onCanceled: {
                    imgStart.source= "../Images/Key_h60_w180_Next.png"
                }
            }
        }
        ToolButton{
            id: _btnFN
            x: 947
            y: 2
            width: 76
            height: 62
            visible: isInActive
            Image{
                id: imgFN
                anchors.fill: parent
                source: "../Images/contbar_btn_function.png"
                Text {
                    text: "Fn"
                    font.family: "MS Gothic"
                    font.pixelSize:24
                    color: "#0066CC"
                    anchors.bottom: parent.bottom
                    anchors.centerIn: parent
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgFN.source= "../Images/contbar_btn_touched_function.png"
                }
                onReleased:{
                    imgFN.source= "../Images/contbar_btn_function.png"
                    if(menu.visible){
                        menu.__popup(Qt.rect(768,640-71,0,0),0,0);
                    }
                    else{
                        menu.__closeAndDestroy();
                    }
                }
                onCanceled: {
                    imgFN.source= "../Images/contbar_btn_function.png"
                }
            }
            Menu {
                id: menu
                style:MenuStyle {
                    itemDelegate {
                        background: Rectangle {
                            color: styleData.selected ? "#f79642" : "#1a4670"
                            border.color: "#8ca6bd"
                        }
                        label: Text {
                            width:200
                            height: 40
                            verticalAlignment : Text.AlignVCenter
                            color: styleData.selected ? "black" : "white"
                            font.pixelSize:18
                            text: styleData.text
                        }
                    }
                }
                MenuItem {
                    text: "Clear selection"
                    onTriggered: {
                        contentItem.sensCorrStep1.clearSelection();
                    }
                }
                MenuItem {
                    text: "Select all"
                    onTriggered: {
                        contentItem.sensCorrStep1.selectAll();
                    }
                }
                MenuItem {
                    text: "Change selection"
                    onTriggered: {
                        contentItem.sensCorrStep1.changeSelection();
                    }
                }
            }
        }
    }
    function getStatusBtn (inActive){
        isInActive = inActive;
    }
}
