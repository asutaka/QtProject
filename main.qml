import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0

ApplicationWindow {
    id: root
    visible: true
    width: 400
    height: 400
    property variant win;
    property var component;

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Export")
            }
            MenuItem {
                text: qsTr("&Clear")
            }
        }
    }
    StatusBar{}
    MainForm {
        anchors.fill: parent
        btnStart.enabled: true;
        btnStop.enabled: false;
        btnStart.onClicked:
        {
            component = Qt.createComponent("ZoomLine.qml");
            win = component.createObject();
            win.show();
            btnStart.enabled = false;
            btnStop.enabled = true;
        }
        btnStop.onClicked:
        {
            btnStart.enabled = true;
            btnStop.enabled = false;
            win.close();
        }
    }

    onClosing: {
        win.close();
    }
}

