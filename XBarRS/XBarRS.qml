import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import "../Control/switchControl"
import "../Control/switchLineUC"
import ControlApp 1.0

Item {
    property XBarRS objXBarRS: _xBarRs
    property bool isForLine: false
    property bool isR: true
    property bool isPass: false
    property int _currentLineNo: 1

    XBarRS {
        id: _xBarRs
        x: 0
        y: 0
        width:  1024
        height: 640

        SwitchLineUc{
            id: switchLine
            currentLineNo: _currentLineNo
            x: 100
            y: 350
            visible: !sw_AllForLine.isLeft
            onGetCurrentLineNo: {
                objXBarRS.getCurrentLine(switchLine.currentLineNo);
            }
        }
        SwitchControl{
            id: sw_AllForLine
            x: 15
            y: 160
            textLeft: "All"
            textRight: "Forline"
            isLeft: !isForLine
            onSwitchButton: {
                isForLine = !sw_AllForLine.isLeft
                objXBarRS.getIsLeft(isForLine, 0, 4)
            }
        }
        SwitchControl{
            id: sw_RS
            x: 100
            y: 470
            textLeft: "R"
            textRight: "S"
            isLeft: isR
            onSwitchButton: {
                isR = sw_RS.isLeft;
                _xBarRs.setTxtRS(isR);
                objXBarRS.getIsLeft(isR, 1, 4);
            }
        }
        SwitchControl{
            id: sw_AllPass
            x: 180
            y: 160
            textLeft: "All"
            textRight: "Pass"
            isLeft: !isPass
            onSwitchButton: {
                isPass = !sw_AllPass.isLeft;
                objXBarRS.getIsLeft(isPass, 2, 4);
            }
        }
        ToolButton {
            id: zeroSetBtn
            x: 930
            y: 10
            width: 86
            height: 40
            Image{
                id: imgzeroSet
                anchors.fill: parent
                source: "../Images/Key_Zeroset_w86h40.png"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgzeroSet.source= "../Images/Key_Zeroset_w86h40_p.png"
                }
                onReleased:{
                    imgzeroSet.source= "../Images/Key_Zeroset_w86h40.png"
                }
            }
        }
        Label{
            id: txtXBar
            x: 25
            y: 250
            text: "X-Bar"
            color: "#D9DB42"
            font.pixelSize: 32
        }
        Label{
            id: txtRS
            x: 25
            y: 545
            text: {
                if(isR){
                    text = "R"
                } else {
                    text = "S"
                }
            }
            color: "#D9DB42"
            font.pixelSize: 32
        }
        function setTxtRS(_isR)
        {
            if(_isR){
                txtRS.text = "R"
            } else {
                txtRS.text = "S"
            }
        }
    }
}
