import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0

Item {
    id: objIntegrationV4
    width: 1024
    height: 640

    Integartion_ver4 {
        id: integration
        anchors.fill: parent
        width: parent.width
        height: parent.height

        BufferedGraphicsPanel {
            id: buffered
            anchors.fill: parent
        }

        Component.onCompleted: {
            integration.connectToBufferedGraphicsPanel(buffered)
        }
    }
}
