import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import Production 1.0

Item{
    property Production productScreen: drawContentProduction
    width: 1024
    height: 640

    Production{
        id: drawContentProduction
        anchors.fill: parent
    }
}
