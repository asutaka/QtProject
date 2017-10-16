import QtQuick 2.0
import QtQuick.Controls 2.0

ToolButton {
    property string imgSourceBg: ""
    property string imgSourceActive: ""
    property string imgSourceIcon: ""
    property string  txtButton: ""
    property color colorText
    property font fontText
    property int wIcon: 0
    property int hIcon: 0
    property int imgIconTopMargin: 0
    property int imgIconBottomMargin: 0
    property int imgIconLeftMargin: 0
    property int imgIconRightMargin: 0
    property int textAlignH: Text.AlignLeft
    property int textAlignV: Text.AlignVCenter
    property int textTopMargin: 0
    property int textBottomMargin: 0
    property int textLeftMargin: 0
    property int textRightMargin: 0
    property int wrapText: Text.NoWrap
    property int elideText: Text.ElideRight
    id: btnImage
    signal clicked();

    Image{
        id: imgBackground
        anchors.fill: parent
        source: imgSourceBg
        Text {
            id: txtText
            text: txtButton
            anchors.fill: parent
            anchors.topMargin: textTopMargin
            anchors.bottomMargin: textBottomMargin
            anchors.leftMargin: textLeftMargin
            anchors.rightMargin: textRightMargin
            horizontalAlignment: textAlignH
            verticalAlignment: textAlignV
            font: fontText
            color: colorText
            elide: elideText
            wrapMode: wrapText
        }

        Image {
            id: imgIcon
            anchors.top: parent.top
            anchors.left: parent.left
            width: wIcon
            height: hIcon
            source: imgSourceIcon
            anchors.topMargin: imgIconTopMargin
            anchors.bottomMargin: imgIconBottomMargin
            anchors.leftMargin: imgIconLeftMargin
            anchors.rightMargin: imgIconRightMargin
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

