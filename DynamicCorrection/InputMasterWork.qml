import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import "../Control"
import "../Control/switchControl"
import "../Control/switchLineUC"
import ControlApp 1.0
import "../Control/VirtualKey.js" as Ops

Item {
    id: inputMasterWork
    width: 1024
    height: 640
    property string strRefVal: "6.00"
    property InputMasterWork inputMasterWorkScreen: drawContent
    property int _currentLineNo: 1
    property bool isForLine
    InputMasterWork{
        id: drawContent
        width:  1024
        height: 640

        Label {
            id: lb_TitleOfScreen
            x: 10
            y: 20
            text: "Performming Fine Adjustment preparation. \nEnter the Master Product weight."
            font.pixelSize: 35
            font.family: "MS Gothic"
            color: "#ffffff"
        }
        Label {
            id: lb_MasterWeight
            x: 10
            y: 250
            text: "Master weight"
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: "#ffffff"
        }
        Label {
            id: lb_MasterWeightUnit
            x: 400
            y: 250
            text: "g"
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: "#ffffff"
        }
        TextField {
            id: masterWeight
            x: 240
            y: 250
            readOnly: true
            validator: DoubleValidator {}
            inputMethodHints: Qt.ImhFormattedNumbersOnly
            font.pixelSize: 20
            font.family: "MS Gothic"
            focus: false
            style: TextFieldStyle {
                textColor: "#95B3D7"
                background: Rectangle {
                    radius: 2
                    implicitWidth: 156
                    implicitHeight: 30
                    border.color: "white"
                    border.width: 1
                    color: "black"
                }
            }

            onActiveFocusChanged:
            {
                if(activeFocus)
                {
                    Ops.showCalculator(masterWeight,"0","1000");
                }
            }
            onDisplayTextChanged:
            {
                inputMasterWorkScreen.getValue(masterWeight.text);
                masterWeight.textColor = "#95B3D7";
                masterWeight.focus = false;
            }
            Component.onCompleted:
            {
                inputMasterWorkScreen.getValue(masterWeight.text);
                masterWeight.textColor = "#95B3D7";
                masterWeight.focus = false;
            }
//            onEditingFinished: {
//                inputMasterWorkScreen.getValue(masterWeight.text);
//                masterWeight.textColor = "#95B3D7";
//                masterWeight.focus = false;
//            }
        }
        Label {
            id: lb_RefVal
            x: 10
            y: 300
            text: "Ref.Val."
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: "#ffffff"
        }
        Label {
            id: lb_RefValUnit
            x: 400
            y: 300
            text: "g"
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: "#ffffff"
        }
        Label {
            id: lb_RefValue
            x: 350
            y: 300
            text: strRefVal
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: "#ffffff"
        }
        StartSwitchControl{
            id: switchControl
            isLeft: !isForLine
            x: 12
            y: 116
            onSwitchControl:{
                switchLine.visible = !switchControl.isLeft;
                inputMasterWorkScreen.getIsForLine(!switchControl.isLeft);
                isForLine = (!switchControl.isLeft);
                if(isForLine)
                {
                    _currentLineNo = inputMasterWorkScreen.getCurrentLine(switchLine.currentLineNo);
                }
            }
        }
        SwitchLineUc{
            id: switchLine
            currentLineNo: _currentLineNo
            x: 56
            y: 163
            visible: !switchControl.isLeft
            onGetCurrentLineNo:
            {
                if(isForLine)
                {
                    _currentLineNo = inputMasterWorkScreen.getCurrentLine(switchLine.currentLineNo);
                }
            }
        }
        Component.onCompleted:
        {
            inputMasterWorkScreen.getIsForLine(isForLine);
        }

        function getLine(){
            return _currentLineNo;
        }
        function setLine(currentLine){
            _currentLineNo = currentLine;
        }
        function getForLine(){
            return isForLine;
        }
        function setForLine(_isForLine){
            isForLine = _isForLine;
            inputMasterWorkScreen.getIsForLine(isForLine);
            inputMasterWorkScreen.getCurrentLine(_currentLineNo);
        }
        function getMasterValue(){
            return inputMasterWorkScreen.sendValueToDynamic();
        }
        function setMasterValue(listValue){
            inputMasterWorkScreen.getListValue(listValue);
        }
    }
}
