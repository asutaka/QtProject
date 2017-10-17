import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.0
import CommonControl 1.0

Window{
    id: instructionWindow
    visible: true
    width:447
    height: 400
    flags: Qt.Dialog
    maximumWidth: 447
    maximumHeight: 1030
    title: "取扱説明書"

    TK_Panel{
        id: instructionPanel
        anchors.fill: parent
        mScrollBarVPolicy: Qt.ScrollBarAsNeeded
        mScrollBarHPolicy: Qt.ScrollBarAsNeeded

        Component.onCompleted: {
            addControl(content);
        }

        Image {
            id: content
            source: "qrc:/Images/instruction_manual.png"
        }
    }
}


