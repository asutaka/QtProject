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
    property XBarRS_ver3 objXBarRSver3: _xBarRsVer3
    property bool isForLine: false
    property bool isR: true
    property bool isPass: false
    property int _currentLineNo: 1

    XBarRS_ver3 {
        id: _xBarRsVer3
        x: 0
        y: 0
        width:  1024
        height: 640

        SwitchLineUC_ver4 {
            id: switchLine
            currentLineNo: _currentLineNo
            x: 550
            y: 110
            visible: !sw_AllForLine.isLeft
            onGetCurrentLineNo: {
                objXBarRSver3.getCurrentLine(switchLine.currentLineNo);
            }
        }

        SwitchControl_ver4 {
            id: sw_AllForLine
            x: 570
            y: 5
            textLeft: "All"
            textRight: "Forline"
            isLeft: !isForLine
            onSwitchButton: {
                isForLine = !sw_AllForLine.isLeft
                objXBarRSver3.getIsLeft(isForLine, 0, 4)
            }
        }

        SwitchControl_ver4 {
            id: sw_AllPass
            x: 328
            y: 5
            textLeft: "All"
            textRight: "Pass"
            isLeft: !isPass
            onSwitchButton: {
                isPass = !sw_AllPass.isLeft;
                objXBarRSver3.getIsLeft(isPass, 2, 4);
            }
        }

        SwitchControl_ver4 {
            id: sw_Rs
            x: 812
            y: 5
            textLeft: "R"
            textRight: "S"
            isLeft: !isR
            onSwitchButton: {
                isR = sw_Rs.isLeft;
                objXBarRSver3.getIsLeft(isR, 1, 4);
            }
        }

        ToolButton {
            id: zeroSetBtn
            x: 100
            y: 470
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

    }
}
