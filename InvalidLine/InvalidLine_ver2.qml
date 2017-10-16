import QtQuick 2.0
import ControlApp 1.0

Item {
    property InvalidLine_ver2 invalidLineScreen: drawContentInvalid
    InvalidLine_ver2{
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
