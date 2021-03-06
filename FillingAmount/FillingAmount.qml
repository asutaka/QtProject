import QtQuick 2.0
import ControlApp 1.0
import CommonControl 1.0
import QtQuick.Controls 1.4
import "../Control/VirtualKey.js" as Ops
import QtQuick.Controls.Styles 1.4
//import "../FillingAmount"

Item {
    property alias objFillAmount: fillingAmount
    property real  txtUpperValue: 100
    property real  txtValue2:100
    property real  txtLowerValue: 1
    width: 1024
    height: 640
    x: 0
    y: 0
    FillAmountVM {
        id: fillingAmount
    }

    FillingAmount{
        id: fillingAmountMain
        width: 1024
        height: 640
        TK_SwitchControl{
            id: switch1
            x: 480
            y: 595
            strLeft: "各個"
            strRight: "平均"
            onSwitchButton: {
                fillingAmountMain.setInDiv(switch1.isLeft);
            }
        }
        TK_SwitchControl{
            id: switch2
            x: 750
            y: 595
            strLeft: "相対値"
            strRight: "絶対値"
            onSwitchButton: {
                fillingAmountMain.setRelVal(switch2.isLeft);
            }
        }
        ToolButton{
            id: btnZero
            x: 930
            y: 10
            Image {
                id: imgBgZero
                source: "../Images/Key_Zeroset_w86h40.png";
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    imgBgZero.source ="../Images/Key_Zeroset_w86h40_p.png"
                }
                onReleased: {
                    imgBgZero.source ="../Images/Key_Zeroset_w86h40.png"
                }
            }
        }
        Rectangle{
            x: 35
            y: 570
            width: 200
            height: 30
            color:"transparent"
            radius: 3
            border.width: 1
            border.color: "green"
            TextField{
                id: txtUpperWeight
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                text: txtUpperValue.toString();
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                anchors.right: parent.right
                anchors.rightMargin: 35
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(txtUpperWeight,"1","500");
                    }
                }
                onEditingFinished: {
                    fillingAmountMain.setUpperValue(parseInt(txtUpperWeight.text));
                }
            }
        }
        Rectangle{
            x: 240
            y: 570
            width: 200
            height: 30
            color:"transparent"
            radius: 3
            border.width: 1
            border.color: "green"
            Text {
                x: 10
                color: "white"
                y: 3
                font.pixelSize: 20
                text: "平均個数"
            }
            Text {
                x: 160
                color: "white"
                y: 3
                font.pixelSize: 20
                text: "個"
            }
            TextField{
                id: txt2
                x: 100
                y: 5
                width: 100
                anchors.verticalCenter: parent.verticalCenter
                text: txtValue2.toString();
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                anchors.right: parent.right
                anchors.rightMargin: 35
                font.pixelSize:20
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(txt2,"1","500");
                    }
                }
            }

        }
        Rectangle{
            x: 35
            y: 605
            width: 200
            height: 30
            color:"transparent"
            radius: 3
            border.width: 1
            border.color: "green"
            TextField{
                id: txtLowerWeight
                x: 300
                width: 100
                anchors.verticalCenter: parent.verticalCenter
                text: txtLowerValue.toString();
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                anchors.right: parent.right
                anchors.rightMargin: 35
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(txtLowerWeight,"1","30");
                    }
                }
                onEditingFinished: {
                    fillingAmountMain.setLowerValue(parseInt(txtLowerWeight.text));
                }
            }
        }

    }

    Component.onCompleted:{
        objFillAmount.onLoad();
    }

}
