import QtQuick 2.0
import QtQuick.Controls 2.0

ToolButton {
    property string imgSourceBg: ""
    property Image imagesBg: imgBackground
    property Image imagesIcon: imgIcon
    property string imgSourceActive: ""
    property string imgSourceIcon: ""
    property string  txtButton: ""
    property string  colorText: ""
    id: btnImage
    signal clicked();
    Image{
        id: imgBackground
        anchors.fill: parent
        source: imgSourceBg
        Text {
            id: txtText
            anchors.centerIn: parent
            text: txtButton
            font.family: "MS Gothic"
            font.pixelSize: 24
            color: colorText
        }
        Image {
            id: imgIcon
            source: imgSourceIcon
        }
        MouseArea {
            anchors.fill: parent
            onPressed: {
                imgBackground.source= imgSourceActive;
            }
            onReleased:{
                imgBackground.source= imgSourceBg;
                btnImage.clicked();
            }
            onCanceled: {
                imgBackground.source= imgSourceBg;
            }
        }
    }
}

