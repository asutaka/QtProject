import QtQuick 2.0
import ControlApp 1.0

Item {
    id: integration_ver2
    width: 1024
    height: 640
    property alias objIntegration: integrationVM
    Integartion_VM{
        id:integrationVM
    }
    Component.onCompleted: {
        objIntegration.onLoad();
    }
    Rectangle{
        anchors.fill: parent
        color: "#414E60"
        Integration_ver2{
            id: drawContent2
            width: 1024
            height: 640
        }
    }
}
