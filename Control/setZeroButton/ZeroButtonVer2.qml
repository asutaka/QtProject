import QtQuick 2.0

Rectangle {
    width: 86
    height: 40
    color: "transparent"
    radius: 5

    Image {
        anchors.fill: parent
        id: zeroImg
        source: "qrc:/Images/Key_Zeroset_w86h40.png"
    }
    MouseArea{
        anchors.fill: parent
        onPressed: {
            zeroImg.source="qrc:/Images/Key_Zeroset_w86h40_p.png"
        }
        onReleased: {
            zeroImg.source="qrc:/Images/Key_Zeroset_w86h40.png"
        }
    }

}
