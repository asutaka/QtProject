import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Rectangle {
    id: switchControl
    property alias      locationX:          switchControl.x
    property alias      locationY:          switchControl.y
    property int        sWidth:             230
    property int        sHeight:            40
    property int        borderWidth:        1
    property int        textSize:           24
    property color      textColor:          "#fff"
    property color      colorBackGround:    "transparent"
    property color      colorBtnBackground: "transparent"
    property color      borderControlColor: "#B7B7B6"
    property color      borderTextSelected: "transparent"
    property color      borderTextUnSelect: "white"
    property string     strLeft:            "All"
    property string     strRight:           "ライン別"
    property real       borderRadius:       5
    property string     imgOn:              "qrc:/Images/statistics_btn_on.png"
    property string     imgOff:             "qrc:/Images/statistics_btn_off.png"

    property bool isLeft: true
    signal switchButton(bool isLeft)

    width: sWidth
    height: sHeight
    border.width: borderWidth
    border.color: borderControlColor
    color: colorBackGround
    radius: borderRadius

    Rectangle{
        id: btnLeft
        width: sWidth/2-borderWidth
        height: sHeight-2*borderWidth
        x: borderWidth
        y: borderWidth
        border.width: borderWidth
        border.color: borderTextSelected
        color: colorBtnBackground
        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: (isLeft) ? imgOn : imgOff
            Text {
                id:txtLeft
                anchors.centerIn: parent
                text: strLeft
                color: textColor
                font.pixelSize: textSize
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                isLeft = true
                switchControl.switchButton(isLeft);
            }
        }
    }

    Rectangle{
        id: btnRight
        width: sWidth/2-borderWidth
        height: sHeight-2*borderWidth
        x: btnLeft.width+borderWidth
        y: borderWidth
        border.width: borderWidth
        border.color: borderTextSelected
        color: colorBtnBackground
        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: (!isLeft)? imgOn : imgOff
            Text{
                id:txtRight
                anchors.centerIn: parent
                text: strRight
                color: textColor
                font.pixelSize: textSize
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                isLeft = false
                switchControl.switchButton(isLeft);
            }
        }
    }
}
