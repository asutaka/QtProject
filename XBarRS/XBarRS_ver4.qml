import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import "../Control/spinner"
import "../Control/switchControl"
import "../Control/switchLineUC"
import ControlApp 1.0

Item {
    property XBarRS_ver4 objxBarRsVer4: _xBarRsVer4
    property bool isForLine: false
    property bool isR: true
    property bool isPass: false
    property int _currentLineNo: 1

    XBarRS_ver4 {
        id: _xBarRsVer4
        x: 0
        y: 0
        width:  1024
        height: 640

        Spinner {
            id: switchLine
            x: 610
            y: 45
            rotation: 270
            visible: !sw_AllForLine.isLeft
            mod: 12
            onGetCurrIndex: {
                objxBarRsVer4.getCurrentLine(switchLine.currIndex);
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
                objxBarRsVer4.getIsLeft(isForLine, 0, 4)
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
                objxBarRsVer4.getIsLeft(isPass, 2, 4);
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
                objxBarRsVer4.getIsLeft(isR, 1, 4);
            }
        }

        Rectangle {
            id: zeroSetBtn
            x: 90
            y: 470
            width: 100
            height: 50
            color: "#29313c"
            border.color: "#A6A6A6"

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d");

                    ctx.fillStyle = "white"
                    ctx.beginPath();
                    ctx.moveTo(5, 20);
                    ctx.lineTo(20, 20);
                    ctx.lineTo(20, 15);
                    ctx.lineTo(35, 25);
                    ctx.lineTo(20, 35);
                    ctx.lineTo(20, 30);
                    ctx.lineTo(5, 30);
                    ctx.closePath();
                    ctx.fill();

                    var ctr = getContext("2d");
                    ctr.fillStyle = "white"
                    ctr.beginPath();
                    ctr.moveTo(65, 25);
                    ctr.lineTo(80, 15);
                    ctr.lineTo(80, 20);
                    ctr.lineTo(95, 20);
                    ctr.lineTo(95, 30);
                    ctr.lineTo(80, 30);
                    ctr.lineTo(80, 35);
                    ctr.closePath();
                    ctr.fill();
                }
            }

            Text {
                id: zero
                font.pixelSize: 50
                color: "white"
                anchors.centerIn: parent
                text: "0"
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    zeroSetBtn.color = "#1a4670"
                }
                onReleased: {
                    zeroSetBtn.color = "#29313c"
                }
            }
        }

    }
}
