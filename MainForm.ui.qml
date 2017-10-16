import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: mainForm
    width: 400
    height: 400

    property alias btnStart: btnStart
    property alias btnStop: btnStop

    Button {
        id: btnStart
        x: 163
        y: 243
        width: 75
        height: 75
        text: qsTr("Start")
    }

    Button {
        id: btnStop
        x: 261
        y: 243
        width: 75
        height: 75
        text: qsTr("Stop")
    }
}

