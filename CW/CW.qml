import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import CW 1.0

Item {
    CW{
        id: cw
        width: 1024
        height: 640
    }

    ToolButton {
        id: zeroset_discrmark
        x: 128
        y: 264
        width: 32
        height: 16
        Image {
            id: imgzeroset_discrmark
            anchors.fill: parent
            source: "qrc:/Images/zeroset_discrmark.png"
        }
    }

    ToolButton {
        id: zeroset
        x: 592
        y: 264
        width: 92
        height: 54
        Image {
            id: imgzeroset
            anchors.fill: parent
            source: "qrc:/Images/zeroset_off_92_54.png"
            Text {
                text: "ゼロ"
                anchors.verticalCenterOffset: 16
                anchors.horizontalCenterOffset: 0
                anchors.bottomMargin: -16
                font.family: "MS Gothic"
                font.pixelSize: 27
                color: "#ffffff"
                anchors.bottom: parent.bottom
                anchors.centerIn: parent
            }
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onPressed: {
                imgzeroset.source= "qrc:/Images/zeroset_on_92_54.png"
            }
            onReleased: {
                imgzeroset.source= "qrc:/Images/zeroset_off_92_54.png"
            }
            onCanceled: {
                imgzeroset.source= "qrc:/Images/zeroset_off_92_54.png"
            }
        }
    }
}
