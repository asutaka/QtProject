import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
Rectangle{
    property string textLeft: "All"
    property string textRight: "ForLine"
    property bool isLeft: true

    id: startSwitchControl
    width: 230
    height: 40
    color: "transparent"
    border.width: 1
    border.color: "#C1C0C7"
    radius:5
    signal switchControl(bool isLeft)
    RowLayout {
        x: parent.x + 2
        width: parent.width
        height: 30
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        ExclusiveGroup {
            id: tabPositionGroup
        }
        RadioButton {
//            x: 8
//            width: 105
            checked: isLeft
            exclusiveGroup: tabPositionGroup
            style: RadioButtonStyle{
                indicator: Rectangle{
                    implicitWidth: 105
                    implicitHeight: 30
                    color: "transparent"
                    radius: 1
                    Image
                    {
//                        x: 3
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: (isLeft) ? "qrc:/Images/statistics_btn_on.png" : "qrc:/Images/statistics_btn_off.png"
                        Text {
                            anchors.centerIn: parent
                            text: textLeft
                            font.pixelSize: 24
                            color: (isLeft) ? "black" : "white"
                        }
                    }
                }
            }
            onClicked: {
                isLeft = true;
                startSwitchControl.switchControl(isLeft);
            }
        }
        RadioButton {
//            x: 140
//            width: 105
            exclusiveGroup: tabPositionGroup
            style: RadioButtonStyle{
                indicator: Rectangle{
                    implicitWidth: 105
                    implicitHeight: 30
                    color: "transparent"
                    radius: 1
                    Image
                    {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: (!isLeft)? "qrc:/Images/statistics_btn_on.png" : "qrc:/Images/statistics_btn_off.png"
                        Text{
                            anchors.centerIn: parent
                            text: textRight
                            font.pixelSize: 24
                            color:  (!isLeft) ? "black":"white"
                        }
                    }
                }
            }
            onClicked:{
                isLeft = false;
                startSwitchControl.switchControl(isLeft);
            }
        }
    }
}
