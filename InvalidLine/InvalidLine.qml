import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0

Item {
    id: invalidLine
    width: 1024
    height: 640
    property InvalidLine invalidLineScreen: drawContentInvalid
    InvalidLine{
        id: drawContentInvalid
        width: 1024
        height: 640

        MouseArea{
            anchors.fill: parent
            propagateComposedEvents: true
            onPressed: {
                invalidLineScreen.onClickInvalidLinePanel(mouseX, mouseY);           
            }
        }
    }
}
