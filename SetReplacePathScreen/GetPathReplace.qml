import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import ControlApp 1.0

Item {
    id: settingReplacePathScreen
    width: 1024
    height: 640
    property GetPathReplace getPathRep: getPathReplace

    Rectangle {
        anchors.fill: parent
        color: "black"
        GetPathReplace {
            id: getPathReplace
        }


        Rectangle {
            id: btnReplace
            x: 54
            y: 25
            width: 250
            height: 75
            color: "white"

            Text {
                id: txtRep
                text: qsTr("REPLACE FOLDER...")
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 8
                anchors.bottomMargin: 0
                font.family: "MS Gothic"
                font.pixelSize:24
                color: "black"
                anchors.bottom: parent.bottom
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    btnReplace.color ="gray"


                }
                onReleased: {
                    btnReplace.color ="white"
                    getPathReplace.setPath()
                }
            }
        }
    }
}
