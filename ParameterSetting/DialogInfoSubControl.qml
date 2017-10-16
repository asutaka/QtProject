import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.2

Rectangle {
    id: rectInfo

    property real   mWidth:             712
    property real   mHeight:            177
    property color  mBgColor:           "#fff"
    property string mTxtContent:        "String"
    property string mFontFamily:        "MS Gothic"
    property int    mFontSize:          23
    property bool   enableMouseArea:    false
    property bool   mVisible:           false

    width: mWidth
    height: mHeight
    visible: mVisible
    color: mBgColor

    ScrollView {
        id: scrollInfo
        anchors.fill: parent
        TextArea {
            id: txtInfo
            text: mTxtContent
            font.family: mFontFamily
            font.pixelSize: mFontSize
        }
        verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: false
    }
}
