import QtQuick 2.0
import CommonControl 1.0

Rectangle {
    id: waitDialog
    color: "gray"
    anchors.centerIn: parent
    border.color: "white"
    border.width: 3

    width: if(text1.width < waitProgressBar.width){
               waitProgressBar.width + 40
           }else{
               text1.width + 40
           }
    height:text1.height + waitProgressBar.height + 50

    Text {
        id: text1
        text: qsTr("USB出力中です。しばらくお待ちください。")
        font.pixelSize: 20
        anchors.top: waitDialog.top
        anchors.topMargin: 20
        anchors.horizontalCenter: waitDialog.horizontalCenter
    }

    TK_ProgressBar{
        id: waitProgressBar
        anchors.top:text1.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: waitDialog.horizontalCenter
        width:200
        height:10
        mStyle: 2
        mMarqueeAnimationSpeed: 10
        mBackColor: "black"
        mForcolor: "greenyellow"
    }
}
