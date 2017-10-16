import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
Item {
    id: sensCorrStart
    width: 1024
    height: 768
    opacity: 1
    Image{
        anchors.fill: parent
        source: "../Images/Navi_Background.png"
    }
    Rectangle{

        Text {
            id: _summaryLabel
            x: 5
            y: 0
            width: 809
            height: 45
            text: qsTr("Start Sensitive Correction")
            font.family: "MS Gothic"
            verticalAlignment: Text.AlignVCenter
            textFormat: Text.PlainText
            font.pixelSize: 28
        }
        Rectangle{
            id: _rectLine
            x: 5
            y: 40
            width: 809
            height: 4
            color: "#0099FF"
        }
        ToolButton {
            id: _cautionBtn
            x: 833
            y: 19
            width: 180
            height: 40
            Image{
                id: imgCaution
                anchors.fill: parent
                source: "../Images/btn_180_40.png"
                Text {
                    text: "Caution"
                    font.pointSize: 16
                    color: "#ffffff"
                    anchors.centerIn: parent            
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgCaution.source= "../Images/btn_touched_180_40.png"
                }
                onReleased:{
                    imgCaution.source= "../Images/btn_180_40.png"
                }
                onCanceled: {
                    imgCaution.source= "../Images/btn_180_40.png"
                }
            }
        }

        Text {
            id: _infoLabel
            x: 91
            y: 183
            width: 927
            height: 147
            text: qsTr("Calibrate weightcell using master weight.")
            font.family: "MS Gothic"
            font.pixelSize: 26
        }

        Text {
            id: _prepareLabel
            x: 91
            y: 354
            width: 595
            height: 31
            text: qsTr("Prepare the followings.")
            font.family: "MS Gothic"
            anchors.bottomMargin: 48
            font.pixelSize: 26
        }

        Text {
            id: text2
            x: 207
            y: 413
            width: 471
            height: 31
            text: qsTr("Weight")
            font.family: "MS Gothic"
            font.pixelSize: 26
        }

        Image {
            id: _weightIcon
            x: 141
            y: 407
            width: 40
            height: 40
            anchors.leftMargin: 3
            //anchors.left: text1.left
            source: "../Images/Icon_weight.png"
        }
        ToolButton {
            id: _exPlaneBtn
            x: 699
            y: 410
            width: 180
            height: 40
            Image{
                id: imgExplane
                anchors.fill: parent
                source: "../Images/btn_180_40.png"
                Text {
                    text: "Explain"
                    font.pixelSize: 21
                    color: "#ffffff"
                    anchors.centerIn: parent
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgExplane.source= "../Images/btn_touched_180_40.png"
                    //loaderBottomBar.source ="../BottomBar/BottomBarSensCorr.qml"
                }
                onReleased:{
                    imgExplane.source= "../Images/btn_180_40.png"
                }
                onCanceled: {
                    imgExplane.source= "../Images/btn_180_40.png"
                }
            }
        }

    }
}
