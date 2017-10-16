import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import "../Control/switchLineUC"
import "../Control/switchControl"
import ControlApp 1.0

Item {
    property XBarRS_ver2 objXBarRSver2: _xBarRsVer2
    property bool isForLine: false
    property bool isR: true
    property bool isPass: false
    property int _currentLineNo: 1

    XBarRS_ver2 {
        id: _xBarRsVer2
        x: 0
        y: 0
        width:  1024
        height: 640

        SwitchLineUC_ver2 {
            id: switchLine
            currentLineNo: _currentLineNo
            x: 780
            y: 50
            visible: !sw_AllForLine.isLeft
            onGetCurrentLineNo: {
                objXBarRSver2.getCurrentLine(switchLine.currentLineNo);
            }
        }

        SwitchControl_ver2 {
            id: sw_AllForLine
            x: 685
            y: 150
            textLeft: "All"
            textRight: "Forline"
            isLeft: !isForLine
            onSwitchButton: {
                isForLine = !sw_AllForLine.isLeft
                objXBarRSver2.getIsLeft(isForLine, 0, 4)
            }
        }

        SwitchControl_ver2{
            id: sw_AllPass
            x: 850
            y: 150
            textLeft: "All"
            textRight: "Pass"
            isLeft: !isPass
            onSwitchButton: {
                isPass = !sw_AllPass.isLeft;
                objXBarRSver2.getIsLeft(isPass, 2, 4);
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
            x: 685
            y: 230
            text: "X-Bar"
            color: "#D9DB42"
            font.pixelSize: 32
        }
        Label{
            id: txtR
            x: 700
            y: 415
            text: "R"
            color: "#D9DB42"
            font.pixelSize: 32
        }
        Label{
            id: txtS
            x: 700
            y: 545
            text: "S"
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
