import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.2
import "qrc:/Control/VirtualKey.js" as Ops

Rectangle{
    id: navigator

    property alias      locationX:          navigator.x
    property alias      locationY:          navigator.y
    property int        sWidth:             86
    property int        sHeight:            500
    property int        btnWidth:           68
    property int        btnHeight:          68
    property int        centerKeyHeight:    81
    property int        marginY:            5
    property int        fontSize:           24
    property bool       centerKeyVisible:   true
    property int        indexRowSelected:   1
    property int        numberRow:          0
    property int        maxIndex:           99
    property int        pageStep:           10
    property int        minWidth:           83
    property int        minHeight:          400
    property int        minHeightNoCenterKey: 310
    property string     colorBackground:    "transparent"
    property string     colorLabel:         "transparent"
    property string     colorValue:         "black"
    property string     fontName:           "Times New Roman"
    property string     imgPageUpOffSrc:    "image://MyProvider/scroll_pageup_off.png"
    property string     imgLineUpOffSrc:    "image://MyProvider/scroll_lineup_off.png"
    property string     imgCenterKeyOffSrc: "image://MyProvider/scroll_centerkey.png"
    property string     imgPageDownOffSrc:  "image://MyProvider/scroll_pagedown_off.png"
    property string     imgLineDownOffSrc:  "image://MyProvider/scroll_linedown_off.png"
    property string     imgPageUpOnSrc:     "image://MyProvider/scroll_pageup_on.png"
    property string     imgLineUpOnSrc:     "image://MyProvider/scroll_lineup_on.png"
    property string     imgCenterKeyOnSrc:  "image://MyProvider/scroll_centerkey_p.png"
    property string     imgPageDownOnSrc:   "image://MyProvider/scroll_pagedown_on.png"
    property string     imgLineDownOnSrc:   "image://MyProvider/scroll_linedown_on.png"

    signal pressCenterKey()
    signal keyChanged()

    width: sWidth
    height: sHeight
    color: colorBackground

    ColumnLayout {
        id: content
        width: parent.width
        height: parent.height

        Rectangle {
            id: pageUpBtn
            color: colorBackground
            anchors.top: content.top
            anchors.topMargin: marginY
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: btnWidth
            Layout.preferredHeight: btnHeight

            Image {
                id: imgPageUp
                anchors.fill: parent
                source: imgPageUpOffSrc
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgPageUp.source = imgPageUpOnSrc
                    var temp = ((Math.floor(indexRowSelected / pageStep)) - 1) * pageStep
                    if(temp < 1){
                        indexRowSelected = 1
                    }
                    else {
                        indexRowSelected = temp
                    }
                }
                onReleased: imgPageUp.source = imgPageUpOffSrc
            }

        }

        Rectangle {
            id: lineUpBtn
            color: colorBackground
            anchors.top: pageUpBtn.bottom
            anchors.topMargin: marginY
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: btnWidth
            Layout.preferredHeight: btnHeight

            Image {
                id: imgLineUp
                anchors.fill: parent
                source: imgLineUpOffSrc
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgLineUp.source = imgLineUpOnSrc
                    if (indexRowSelected < 1) indexRowSelected = 1
                    if (indexRowSelected <= maxIndex && indexRowSelected > 1) {
                        --indexRowSelected
                    }
                }

                onPressAndHold: {
                    imgLineUp.source = imgLineUpOnSrc
                    while (indexRowSelected <= maxIndex && indexRowSelected > 1) {
                        --indexRowSelected
                    }
                }

                onReleased: imgLineUp.source = imgLineUpOffSrc
            }
        }

        Rectangle {
            id: centerKey
            color: colorBackground
            visible: centerKeyVisible
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: btnWidth
            Layout.preferredHeight: centerKeyHeight

            Image {
                id:imgCenterKey
                anchors.fill: parent
                source: imgCenterKeyOffSrc
            }

            Rectangle {
                color: colorValue
                width: parent.width * 2/3
                height: 2
                anchors.centerIn: parent
            }

            Label {
                id: selectedlb
                width: parent.width
                height: parent.height/2
                color: colorLabel
                anchors.top: parent.top

                Text {
                    id: txtIndexSelected
                    color: colorValue
                    font.family: fontName
                    font.pixelSize: fontSize
                    text: indexRowSelected.toString()
                    anchors.centerIn: parent
                    onTextChanged: {
                        keyChanged()
                    }
                }
            }

            Label {
                id: sumlb
                width: parent.width
                height: parent.height / 2
                color: colorLabel
                anchors.bottom: parent.bottom

                Text {
                    color: colorValue
                    font.family: fontName
                    font.pixelSize: fontSize
                    text: numberRow.toString()
                    anchors.centerIn: parent
                }
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgCenterKey.source = imgCenterKeyOnSrc
                    pressCenterKey()
                }
                onReleased: imgCenterKey.source = imgCenterKeyOffSrc
            }
        }

        Rectangle {
            id: pageDownBtn
            color: colorBackground
            anchors.bottom: content.bottom
            anchors.bottomMargin: marginY
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: btnWidth
            Layout.preferredHeight: btnHeight

            Image {
                id: imgPageDown
                anchors.fill: parent
                source: imgPageDownOffSrc
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgPageDown.source = imgPageDownOnSrc
                    var temp = ((Math.floor(indexRowSelected / pageStep)) + 1) * pageStep;
                    if(temp < maxIndex) {
                        indexRowSelected = temp
                    } else {
                        indexRowSelected = maxIndex
                    }
                }
                onReleased: imgPageDown.source = imgPageDownOffSrc
            }

        }

        Rectangle {
            id: lineDownBtn
            color: colorBackground
            anchors.bottom: pageDownBtn.top
            anchors.bottomMargin: marginY
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: btnWidth
            Layout.preferredHeight: btnHeight

            Image {
                id: imgLineDown
                anchors.fill: parent
                source: imgLineDownOffSrc
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgLineDown.source = imgLineDownOnSrc
                    if (indexRowSelected < maxIndex) {
                        ++indexRowSelected
                    }
                }
                onPressAndHold: {
                    imgLineDown.source = imgLineDownOnSrc
                    while (indexRowSelected < maxIndex){
                        ++indexRowSelected
                    }
                }
                onReleased: imgLineDown.source = imgLineDownOffSrc
            }
        }
    }

    Component.onCompleted: {
        if (navigator.width < minWidth) navigator.width = minWidth
        if (centerKeyVisible) {
            if (navigator.height < minHeight) navigator.height = minHeight
        } else {
            if (navigator.height < minHeightNoCenterKey) navigator.height = minHeightNoCenterKey
        }
    }
}
