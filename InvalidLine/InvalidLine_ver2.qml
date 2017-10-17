import QtQuick 2.0
import ControlApp 1.0

Item {
    id: invalidLine2
    width: 1024
    height: 640
    property alias objInvalidLineScreenVM: invalidLineScreenVM
    property alias invalidLineScreen: drawContentInvalid

    InvalidLineVM {
        id:invalidLineScreenVM
    }

    InvalidLine_ver2{
        id: drawContentInvalid
        width: 1024
        height: 640

        MouseArea{
            anchors.fill: parent
            onClicked: {
                invalidLineScreen.onClickInvalidLinePanel(mouseX, mouseY);
            }

            onPressAndHold: {
                invalidLineScreen.onLongPressInvalidLinePanel(mouseX, mouseY);
            }
        }
    }
    Component.onCompleted: {
        objInvalidLineScreenVM.onLoad();
    }
}
