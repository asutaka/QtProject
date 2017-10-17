import QtQuick 2.0
import QtQuick.Controls 2.0

Text{
    property string colorText: "white"
    property string strText: ""
    id:txtText
    text: strText
    signal clicked();
    MouseArea {
        anchors.fill: parent
        onClicked: {
            txtText.clicked();
        }
    }
}
