import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import "Control/menu"
import "Control"
import "Common"
import "DynamicCorrection"
import "Images"
import "InvalidLine"
import "Integration"
import "MenuScreen"
import "Production"
import "XBarRS"
import "ZoomLine"
import QtQuick.Controls.Styles 1.4
import "Control/VirtualKey.js" as Ops
import ControlApp 1.0

ApplicationWindow {
    property alias contentItem: loaderContent.item
    property alias statusBarItem: loaderStatusBar.item
    property alias bottomBarItem: loaderBottomBar.item
    property ApplicationWindow appWindow : mainWindow
    property KeyBoard myKeyBoard: keyboardObj
    property CWTextInput inputKeyboard: txtInput

    //limit text
    property string minVal: "-"
    property string maxVal: "-"
    readonly property int w: 1024
    readonly property int h: 768

    //default: 0, while autohide: 1
    property int yfitCenter: 0

    // Data temp for AdjustTimingVer4
    property int tmpSettingTime: 0
    property int tmpSettingRange: 0
    property int tmpSettingT7: 4
    property int tmpSettingT1: 0
    property int tmpSettingT2: 1
    property int tmpSettingT3: 2
    property int tmpSettingT4: 3
    property int tmpMeasTiming: 0
    property int tmpSelectSignal: 0
    property int tmpSelectPhoto: 0
    property int tmpSelectPhotoCase0: 0
    property int tmpSelectPhotoCase1: 0
    property int tmpSelectPhotoCase2: 0
    property string tmpPhoto: "Photo(W1)"

    id: mainWindow
    visible: true
    width: 1024
    height: 768
    property real ratioScreen: {
        return w/h;
    }

    property real scale_factor: {
        return Math.min(mainWindow.height/h,mainWindow.width/w)
    }
    flags: Qt.Window | Qt.FramelessWindowHint

    Flickable
    {
        id: flick
        anchors.fill: parent
        clip: true
        Rectangle
        {
            id: rect
            width: flick.width
            height: flick.height
            transform: Scale {
                id: tform
                origin.x: pinchArea.m_x2
                origin.y: pinchArea.m_y2
                xScale: pinchArea.m_zoom2
                yScale: pinchArea.m_zoom2
            }

            PinchArea
            {
                id: pinchArea
                anchors.fill: parent

                property real m_x1: 0
                property real m_y1: 0
                property real m_y2: 0
                property real m_x2: 0
                property real m_zoom1: 1
                property real m_zoom2: 1
                property real minScale: 1
                property real maxScale: 3
                property real xAfterZoom: 0
                property real yAfterZoom: 0
                onPinchStarted: {

                    m_x1 = tform.origin.x
                    m_y1 = tform.origin.y
                    m_x2 = pinch.startCenter.x
                    m_y2 = pinch.startCenter.y
                    rect.x = 0
                    rect.y = 0

                }
                onPinchUpdated: {
                    m_zoom1 = tform.xScale
                    var dz = pinch.scale-pinch.previousScale
                    var newZoom = m_zoom1+dz
                    if (newZoom <= maxScale && newZoom >= minScale) {
                        m_zoom2 = newZoom
                    }
                    rect.x = 0
                    rect.y = 0
                    pinchArea.xAfterZoom = m_x2*(m_zoom2-1)
                    pinchArea.yAfterZoom = m_y2*(m_zoom2-1)
                }
                MouseArea {
                    id:dragArea
                    hoverEnabled: true
                    anchors.fill: parent
                    drag.target: if(tform.xScale> pinchArea.minScale)  rect
                    drag.filterChildren: true
//                    propagateComposedEvents: true     // Fix #12074
                    onDoubleClicked:
                    {
                        if(pinchArea.m_zoom2 > pinchArea.minScale)
                        {
                            pinchArea.m_x2 = 0
                            pinchArea.m_y2 = 0
                            pinchArea.m_zoom2 = pinchArea.minScale
                            rect.x = 0
                            rect.y = 0
                        }
                        else
                        {
                            pinchArea.m_x2 = mouseX
                            pinchArea.m_y2 = mouseY
                            pinchArea.m_zoom2 = (pinchArea.minScale+pinchArea.maxScale)/2
                            rect.x = 0
                            rect.y = 0
                            pinchArea.xAfterZoom = mouseX*(pinchArea.m_zoom2-1)
                            pinchArea.yAfterZoom = mouseY*(pinchArea.m_zoom2-1)
                        }

                    }
                    onPositionChanged:
                    {
                        if(pinchArea.m_zoom2>pinchArea.minScale)
                        {
                            if(rect.x > pinchArea.xAfterZoom )
                            {
                                rect.x = pinchArea.xAfterZoom
                            }
                            if(rect.x < -(mainWindow.width*(pinchArea.m_zoom2 - 1) - pinchArea.xAfterZoom))
                            {
                                rect.x = -(mainWindow.width*(pinchArea.m_zoom2 - 1) - pinchArea.xAfterZoom)
                            }
                            if(rect.y > pinchArea.yAfterZoom )
                            {
                                rect.y = pinchArea.yAfterZoom
                            }
                            if(rect.y < -(mainWindow.height*(pinchArea.m_zoom2 - 1) - pinchArea.yAfterZoom))
                            {
                                rect.y = -(mainWindow.height*(pinchArea.m_zoom2 - 1) - pinchArea.yAfterZoom)
                            }
                        }
                    }

                    Rectangle{
                        id: rectLoader
                        width: {appWindow.width < appWindow.height*ratioScreen?appWindow.width:appWindow.height*ratioScreen}
                        height: {appWindow.width < appWindow.height*ratioScreen?appWindow.width/ratioScreen:appWindow.height}
                        anchors.centerIn: parent
                        property int numHideStatusBar: 1
                        property int numHideBottomBar: 1
                        transform: Scale {
                            xScale: scale_factor
                            yScale: scale_factor
                        }

                        Rectangle
                        {
                            width: 1024
                            height: 768
                            GridLayout {
                                id: layoutMain
                                anchors.fill: parent
                                flow: GridLayout.TopToBottom
                                rowSpacing: 0


                                Rectangle{
                                    id: rectStatusBar
                                    width: 1024
                                    height: 64
                                    Loader {
                                        id: loaderStatusBar
                                        anchors.fill: parent
                                        source: "StatusBar/StatusBar.qml"
                                        MouseArea
                                        {
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            propagateComposedEvents: true
                                            onEntered:
                                            {
                                                rectLoader.numHideStatusBar = 0
                                                rectStatusBar.opacity = 1
                                            }
                                            onExited:
                                            {
                                                rectLoader.numHideStatusBar = 1
                                            }
                                            onClicked: {
                                                console.log("mainWindow.width: " + mainWindow.width)
                                                console.log("mainWindow.height: " + mainWindow.height)
                                            }
                                        }
                                    }
                                    Behavior on opacity { NumberAnimation {duration: 300} }
                                }

                                Rectangle{
                                    id: rectMiddle
                                    width: 1024
                                    height: 640
                                    Loader{
                                        id: loaderContent
                                        anchors.fill: parent
//                                        source:"Production/ProductionScreen_ver3.qml"
                                        MouseArea {
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            propagateComposedEvents: true

                                            onEntered: {
                                                rectLoader.numHideBottomBar = 0
                                                rectBottomBar.opacity = 1
                                            }

                                            onExited: {
                                                rectLoader.numHideBottomBar = 1
                                            }
                                        }
                                    }
                                    //AssistiveTouch
                                    ToolButton
                                    {
                                        id:btnExtendMenu
                                        x: parent.width*0.75
                                        y: parent.height *0.25
                                        width: 50
                                        height: 50

                                        Rectangle
                                        {
                                            anchors.centerIn: parent
                                            width: 40
                                            height: 40
                                            color: "lightgreen"
                                            radius: 40
                                        }

                                        MouseArea
                                        {
                                            id: idMouseExtend
                                            anchors.fill: parent
                                            drag.target: parent
                                            drag.minimumX: 0
                                            drag.minimumY: 0
                                            drag.maximumX: mainWindow.width-btnExtendMenu.width
                                            drag.maximumY: mainWindow.height-btnExtendMenu.height
                                            onPressed:{
                                                Ops.showDisplayMenu();
                                            }
                                        }
                                    }

                                }

                                Rectangle{
                                    id: rectBottomBar
                                    width: 1024
                                    height: 64
                                    Loader {
                                        id: loaderBottomBar
                                        anchors.fill: parent
                                        source: "BottomBar/BottomBarMainPage.qml"
                                        MouseArea {
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            propagateComposedEvents: true

                                            onEntered: {
                                                rectLoader.numHideBottomBar = 0
                                                rectBottomBar.opacity = 1
                                            }

                                            onExited: {
                                                rectLoader.numHideBottomBar = 1
                                            }
                                        }
                                    }
                                    Behavior on opacity { NumberAnimation {duration: 300} }
                                }
                            }
                        }

                        Rectangle {
                            id: rectShowDialog
                            anchors.fill: parent
                            visible: false
                            color: "transparent"

                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    console.log(rectShowDialog.width);
                                    console.log(rectShowDialog.height);
                                    closeDialog();
                                }
                            }
                            Rectangle{
                                id: rectItemShow
                                color: parent.color
                                property var dialogObject
                                MouseArea{
                                    anchors.fill: parent
                                    propagateComposedEvents: false
                                }
                            }
                        }
                    }
                }
            }


        }

    }
    MessageDialog {
        id: messageDialog
        icon: StandardIcon.Critical
        standardButtons: StandardButton.Ok
        title: "Error"
        text: "Cannot set because the set range upper limit has been exceeded."

        onAccepted: {
            if (loaderContent.source.toString() === "qrc:/AdjustTiming/AdjustTimingVer4.qml") {
                virtualKey.visible = true
            }
        }
    }

    Rectangle
    {
        id: virtualKey
        anchors.fill: parent
        visible: false
        color: "transparent"

        property variant targetto

        MouseArea
        {
            anchors.fill: parent

            onVisibleChanged:
            {
                if(vk == undefined || !vk)
                {
                    return
                }
                if(virtualKey.visible)
                    vk.state = "active";
                else
                    vk.state= "inactive"
            }
        }
        Flickable
        {
            id: flickCal
            anchors.fill: parent
            clip:true
            MouseArea
            {
                anchors.fill: parent
                onPressed:
                {
                    parent.focus=true;
                    virtualKey.visible=false;
                }
            }

            Rectangle
            {
                id: rectCal
                x:370
                y:parent.height-rectCal.height//325
                width: 310
                height: 440
                color:"transparent"
                MouseArea
                {
                    anchors.fill: parent
                    drag.filterChildren: true
                    drag.target: parent
                    drag.minimumX: 0
                    drag.maximumX: mainWindow.width - rectCal.width
                    drag.minimumY: 0
                    drag.maximumY:mainWindow.height - rectCal.height
                }
                Rectangle
                {
                    width: parent.width
                    height: 100
                    anchors.top: parent.top
                    color:"transparent"

                    Rectangle
                    {
                        anchors.fill: parent
                        anchors.topMargin: 10
                        anchors.bottomMargin: 5
                        border.color: "#40bd9f"
                        border.width: 2
                        opacity:0.9
                        color:"white"
                        Label{
                            id: lblLimit
                            text: "("+minVal+" ~ "+maxVal+")"
                            font.pixelSize: 15
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                        }
                        Label{
                            id: lblCal
                            text:"0"
                            font.pixelSize: 45
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.top: parent.top
                            anchors.topMargin: 5

                        }

                        Rectangle
                        {
                            id: btnOK
                            width: 60
                            height: 30
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 3
                            border.width: 1
                            border.color: "black"
                            radius: 7
                            visible: true
                            color:"#187549"

                            property real result:0

                            Label
                            {
                                text:"Enter"
                                font.pixelSize: 18
                                font.bold: true
                                anchors.centerIn: parent
                                color:"white"
                            }

                            MouseArea
                            {
                                anchors.fill: parent
                                onPressed:
                                {
                                    btnOK.result= isNaN(parseFloat(lblCal.text))?0:parseFloat(lblCal.text);
                                    if(minVal!=="-")
                                    {
                                        if(btnOK.result<parseFloat(minVal) || btnOK.result>parseFloat(maxVal))
                                        {
                                            messageDialog.open();
                                            //virtualKey.focus=true;
                                            virtualKey.visible = false;
                                            return;
                                        }
                                    }
                                    // Fix Calculator
                                    if (virtualKey.targetto.text === undefined) {
                                        virtualKey.targetto.mText = btnOK.result
                                    } else {
                                        virtualKey.targetto.text = btnOK.result
                                    }

                                    virtualKey.visible=false;
                                    parent.focus=true;

                                }
                            }
                        }
                    }
                }

                Rectangle
                {
                    width: parent.width
                    height: parent.height - 100
                    anchors.bottom: parent.bottom
                    //                            color:"#4c4c4c"
                    border.color: "#40bd9f"
                    border.width: 1
                    color:"transparent"
                    VirtualCalCulator {
                        id: vk;
                        onButtonPressed: {
                            Ops.display(op)
                            //virtualKey.targetto.text=op;
                        }
                    }
                }
            }

        }
    }

    CWTextInput{
        id: txtInput
        anchors.centerIn: parent
        x: 7*scale_factor
        y: 64*scale_factor
        txtWidth: 1010*scale_factor
        txtHeight: 60*scale_factor
        visible: false
        MouseArea{
            anchors.fill: parent
            onClicked: {
                myKeyBoard.state ="inactive"
            }
        }
    }

    KeyBoard{
        id: keyboardObj
        anchors.centerIn: parent
        width: w*scale_factor
        onKeyInput: {
            switch(text){
            case "Delete":txtInput.objText.remove(txtInput.objText.cursorPosition-1,txtInput.objText.cursorPosition); break;
            case "Next Mouse":txtInput.objText.cursorPosition++ ;break;
            case "Previous Mouse":txtInput.objText.cursorPosition--;break;
                //case "Enter": txtInput.visible = false;contentItem.adjustTimingScreen.updateTextInput(txtInput.objText.text);keyboardObj.state ="inactive";break;
            case "Enter":
                console.log(contentItem.timAdjObj +"adjTim ver3 ");
                txtInput.visible = false;contentItem.timAdjObj.updateTextInput(txtInput.objText.text);keyboardObj.state ="inactive";break;
            case "Space": txtInput.objText.insert(txtInput.objText.cursorPosition," ");break;
            default: txtInput.objText.insert(txtInput.objText.cursorPosition,text);break;
            }
        }
    }

    Component
    {
        id:idComponent
        DisplayMenu{}
    }

    Swipe {
        id:idSwipe
    }



    Component.onCompleted: {
        mainModel.onChangeLanguage.connect(onChangeLanguage);
        mainModel.onChangeScreen.connect(onChangeScreen);
        mainModel.onChangeBottomBar.connect(onChangeBottomBar);
        mainModel.onChangeStatusBar.connect(onChangeStatusBar);
        //        mainModel.InnerChangeScreen(ScreenMng.ProductionV1);
        //        console.log("screen.h = " + layoutScreen.height);
        //        console.log("screen.w = " + layoutScreen.width);
        //        console.log("loadBottomBar.x = " + loaderBottomBar.x);
        //        console.log("loadBottomBar.y = " + loaderBottomBar.y);
    }

    function showDialog(component, _width, _height, _x, _y){

        closeDialog();
        rectShowDialog.visible= true;
        if((_x != null)&&(_y != null)){
            rectShowDialog.anchors.fill= null;
            rectShowDialog.x = _x;
            rectShowDialog.y = _y;
        } else{
            rectShowDialog.anchors.fill= rectShowDialog.parent;
        }
        rectItemShow.width= _width;
        rectItemShow.height = _height;
        rectItemShow.dialogObject = component.createObject(rectItemShow);
    }

    function closeDialog(){
        if (rectItemShow.dialogObject) {
            console.log("destroy dialog");
            rectItemShow.dialogObject.destroy();
        }
        rectShowDialog.visible= false;
    }

    function onChangeLanguage() {
        console.log("onChangeLanguage in MainWindow");
        //        if (statusBarItem.updateText) {
        //            statusBarItem.updateText();
        //        }
        //        if (contentItem.updateText) {
        //            contentItem.updateText();
        //        }
        //        if (bottomBarItem.updateText) {
        //            bottomBarItem.updateText();
        //        }
    }

    function onChangeScreen(id) {
        console.log("onChangeScreen " + id);
        loaderContent.setSource(id);
    }

    function onChangeBottomBar(id) {
        loaderBottomBar.setSource(id);
    }

    function onChangeStatusBar(id) {
        loaderStatusBar.setSource(id);
    }
}

