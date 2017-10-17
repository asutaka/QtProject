import QtQuick 2.0
import CommonControl 1.0

Rectangle {
    property url imgBackground: "image://MyProvider/menulist_image_MultiLane.png"
    property real implicitWidth: 232
    property real implicitHeight: 600
    property string txtSwitchLeft: "All"
    property string txtSwitchRight: "For-line"
    property bool visibleBg: true
    id: rectLeftContent
    width: implicitWidth
    height: implicitHeight
    Image {
        anchors.fill: parent
        source: imgBackground
        visible: visibleBg
    }

    TK_SwitchControl {
        id: switchControl
        x: 1
        y: 80
        width: 230
        strLeft: txtSwitchLeft
        strRight: txtSwitchRight
    }

    TK_SwitchLineUC {
        id: switchLine
        x: 31
        y: 150
        width: 166
        height: 74
        visible: !switchControl.isLeft
    }
}
