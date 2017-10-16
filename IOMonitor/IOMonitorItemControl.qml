import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Item {
    id: ioMonitorItemControl

    property int chanel: 0
    property string lineNoName: ""
    property string portName: "なし"
    property string signalName: ""
    property bool isSelected: false
    property color background: "transparent"
    signal clicked();

    RowLayout {
        id: rowIOMonitorItemControl
        width: 360
        height: 37

        ToolButton {
            id: btnIOMonitorItemControl
            Layout.fillHeight: true
            Layout.fillWidth: true
            background: Rectangle {
                id: rectItemControl
                border.color: isSelected === false ? "#848385" : "#FFEBDE"
                border.width: isSelected === false ? 1 : 2
                color: background
                radius: 5
            }

            contentItem: Image {
                id: imgIOMonitorItemControl
                anchors.fill: parent

                Text {
                    id: txtChanel
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    color: "white"
                    text: chanel
                }

                Text {
                    id: txtPortName
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: txtChanel.right
                    anchors.leftMargin: 5
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    color: "#95B3D7"
                    text: portName
                }

                Text {
                    id: txtSignalName
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: txtPortName.right
                    anchors.leftMargin: 30
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    color: "#95B3D7"
                    text: signalName
                }

                Text {
                    id: txtLineNoName
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    color: "#95B3D7"
                    text: lineNoName
                }
            }

            onClicked: ioMonitorItemControl.clicked()
        }
    }
}
