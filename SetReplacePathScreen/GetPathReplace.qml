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
    property alias objGetPathReplaceVM: getPathReplaceVM
    property GetPathReplace getPathRep: getPathReplace

    SetReplacePathScreenVM {
        id:getPathReplaceVM
    }

    Rectangle {
        anchors.fill: parent
        color: "black"
        GetPathReplace {
            id: getPathReplace
        }

        FileBrowser {
            id: fileBrowser
            anchors.fill: parent
            folder: "file:///sdcard"
            selectFolder: true
            onFolderSelected: {
                getPathRep.settingApp(fileBrowser.folder)
                fileBrowser.visible = false
                btnReplace.visible = true
            }
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
                font.pixelSize: 24
                color: "black"
                anchors.bottom: parent.bottom
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: btnReplace.color ="gray"

                onReleased: {
                    btnReplace.color ="white"
                    var isAndroid = getPathRep.isAndroid();

                    if(isAndroid){
                        btnReplace.visible = false
                        if (fileBrowser.visible) { fileBrowser.show() }
                        else { fileBrowser.visible = true }
                    } else { getPathRep.setPath() }
                }
            }
        }
    }
    Component.onCompleted: {
        objGetPathReplaceVM.onLoad();
    }
    function convertPathFolder(pathFile){
        var list = pathFile.split("/")
        var pathFolder = "file:";
        for (var i = 1; i < list.length - 1; i++){
            pathFolder = pathFolder.concat("/", list[i])
        }
        return pathFolder
    }
}
