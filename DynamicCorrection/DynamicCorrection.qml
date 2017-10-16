import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import "../Control/switchLineUC"
import ControlApp 1.0

Item {
    id: dynamicCorrection
    width: 1024
    height: 640
    property DynamicCorrection dynamicCorrectionScreen: drawContent
    property bool isBack
    property bool isFinish
    property bool isRedo: false
    property bool isForLine
    property var listValue
    property bool prodMode: false
    DynamicCorrection{
        id: drawContent
        width:  1024
        height: 640

        Label {
            id: lb_ProdNo
            x: 20
            y: 110
            width: 100
            text: "Prod"
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: "#ffffff"
            visible: prodMode
        }
        Label {
            id: lb_MasterWeight
            x: 110
            y: 110
            text: "Master Weight"
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: "#ffffff"
        }
        Label {
            id: lb_MasterWeightUnit
            x: 260
            y: 110
            width: 120
            text: "g"
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: "#ffffff"
        }
        Label {
            id: lb_MeasWeight
            x: 325
            y: 110
            text: "Meas."
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: "#ffffff"
        }
        Label {
            id: lb_MeasWeightUnit
            x: 380
            y: 110
            text: "g"
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: "#ffffff"
        }
        MouseArea{
            anchors.fill: parent
            propagateComposedEvents: true
            hoverEnabled: true
            onPressed: {
                switchLine.currentLineNo = dynamicCorrectionScreen.onClickScreen(mouseX, mouseY);
            }
        }
        ToolButton {
            id: redoBtn
            x: 811
            y: 589
            width: 180
            height: 33
            Image {
                id: _imageButton
            }
            Text {
                id: name
                text: qsTr("Redo")
                font.pixelSize: 20
                color: "#ffffff"
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    if(isRedo)
                    {
                        isRedo = false;
                        _imageButton.source = "../Images/button_w3_grey.png";
                        dynamicCorrectionScreen.clearData(switchLine.currentLineNo);
                    }
                }
            }
        }
        SwitchLineUc{
            id: switchLine
            currentLineNo: 1
            x: 724
            y: 110
            onGetCurrentLineNo:  {
                dynamicCorrectionScreen.getCurrentLine(switchLine.currentLineNo);
                isRedo = dynamicCorrectionScreen.enablebtnRedo(switchLine.currentLineNo);
                dynamicCorrectionScreen._setRedoBtnEnable(isRedo);
            }
        }
        function _setCurrentLine(currentLine)
        {
            switchLine.currentLineNo = currentLine;
            dynamicCorrectionScreen.getCurrentLine(switchLine.currentLineNo);
        }
        function _getCurrentLine()
        {
            return switchLine.currentLineNo;
        }
        function _setMasterValue(value){
            listValue = value;
            dynamicCorrectionScreen.getValue(listValue);
        }
        function _setRedoBtnEnable(isRedo)
        {
            if(isRedo)
            {
                _imageButton.source = "../Images/button_w3_blue.png"
            }
            else
            {
                _imageButton.source = "../Images/button_w3_grey.png";
            }
        }
        Component.onCompleted: {
            isRedo = dynamicCorrectionScreen.enablebtnRedo(switchLine.currentLineNo);
            dynamicCorrectionScreen._setRedoBtnEnable(isRedo)
            isBack = dynamicCorrectionScreen.enablebtnBack();
            isFinish = dynamicCorrectionScreen.enablebtnFinish();
            bottomBarItem.dynamicBotombar._enableBtnBack(isBack);
            bottomBarItem.dynamicBotombar._enableBtnFinish(isFinish);
            prodMode = dynamicCorrectionScreen.changeProdMode();
        }
    }
}
