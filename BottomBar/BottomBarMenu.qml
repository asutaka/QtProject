import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0

Item {
    id: bottomBarMenu
    Rectangle {
        id: rectBottom
        width: 1024
        height: 64
        color: "#ffffff"
        Image {
            id: imgBgr
            x: 0
            y: 0
            source: "../Images/ControlBar_bg.png"
        }

        ToolButton {
            id: btnBack
            x: 0
            y: 0
            width: 104
            height: 64
            Image{
                id: imgBack
                anchors.fill: parent
                source: btnBack.pressed?"image://MyProvider/contbar_btn_touched_104.png":"image://MyProvider/contbar_btn_104.png"
                Text {
                    text: "Back"
                    anchors.verticalCenterOffset: 16
                    anchors.horizontalCenterOffset: 0
                    anchors.bottomMargin: -16
                    font.family: "MS Gothic"
                    font.pixelSize:32
                    color: "#ffffff"
                    anchors.bottom: parent.bottom
                    anchors.centerIn: parent
                }
                Image {
                    x: 37
                    y: 4
                    source: "image://MyProvider/contbar_icon_back.png"
                }
            }

            onClicked: {
                mainModel.GoBackScreen();
            }
        }

        ToolButton {
            id: btnFunction
            x: 939
            y: 0
            width: 84
            height: 64
            Image{
                id:imgFn
                anchors.fill: parent
                source:"../Images/contbar_btn_function.png"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgFn.source= "../Images/contbar_btn_touched_function.png"
                }
                onReleased:{
                    imgFn.source= "../Images/contbar_btn_function.png"
                }
                onCanceled: {
                    imgFn.source= "../Images/contbar_btn_function.png"
                }
            }
        }
    }
}



