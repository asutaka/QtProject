import QtQuick 2.0
import QtQuick.Controls 1.4
import ControlApp 1.0

Rectangle {
    property MenuBarSubControlVM menuBarVM: _menuBarVM
    property real fontSizeDefault: menuBarVM.fontSizeDefault
    property string fontNameDefault: menuBarVM.fontNameDefault
    property string fontColorDefault: menuBarVM.fontColorDefault

    MenuBarSubControlVM {
        id: _menuBarVM
    }

    ToolButton {
        id: btnAddress1
        x: 0
        y: 0
        width: 189
        height: parent.height
        visible: true

        Image {
            id: imgBtnAddr1
            anchors.fill: parent
            source: "image://MyProvider/addressbar.png"
        }

        Text {
            id: _txtbtnAddress1
            text: menuBarVM.txtAddress1
            font.family: fontNameDefault
            font.pixelSize: fontSizeDefault
            anchors.centerIn: parent
            color: fontColorDefault
        }
    }

    ToolButton {
        id: btnAddress2
        x: 190
        y: 0
        width: 189
        height: parent.height
        visible: true

        Image {
            id: imgBtnAddr2
            anchors.fill: parent
            source: "image://MyProvider/addressbar.png"
        }

        Text {
            id: _txtbtnAddress2
            text: menuBarVM.txtAddress2
            font.family: fontNameDefault
            font.pixelSize: fontSizeDefault
            anchors.centerIn: parent
            color: fontColorDefault
        }

        MouseArea {
            anchors.fill: parent
        }
    }

    ToolButton {
        id: btnAddress3
        x: 380
        y: 0
        width: 189
        height: parent.height
        visible: true

        Image {
            id: imgBtnAddr3
            anchors.fill: parent
            source: "image://MyProvider/addressbar.png"
        }

        Text {
            id: _txtbtnAddress3
            text: menuBarVM.txtAddress3
            font.family: fontNameDefault
            font.pixelSize: fontSizeDefault
            anchors.centerIn: parent
            color: fontColorDefault
        }
    }

    ToolButton {
        id: btnAddress4
        x: 570
        y: 0
        width: 189
        height: parent.height
        visible: true

        Image {
            id: imgBtnAddr4
            anchors.fill: parent
            source: "image://MyProvider/addressbar.png"
        }

        Text {
            id: _txtbtnAddress4
            text: menuBarVM.txtAddress4
            font.family: fontNameDefault
            font.pixelSize: fontSizeDefault
            anchors.centerIn: parent
            color: fontColorDefault
        }
    }

    Component.onCompleted: {
        updateText()
        mainModel.onChangeLanguage.connect(updateText)
    }

    function updateText() {
        menuBarVM.onUpdateLang()
        _txtbtnAddress1.text = menuBarVM.txtAddress1
        _txtbtnAddress2.text = menuBarVM.txtAddress2
        _txtbtnAddress3.text = menuBarVM.txtAddress3
        _txtbtnAddress4.text = menuBarVM.txtAddress4
        fontNameDefault = menuBarVM.fontNameDefault
        fontSizeDefault = menuBarVM.fontSizeDefault
        fontColorDefault = menuBarVM.fontColorDefault
    }
}
