import QtQuick 2.0
import ControlApp 1.0
import CommonControl 1.0

Item {
    id: panelItem
    property AdjustTimingVer4_VM adjust_VM: adjustViewModel
    property int        widthItem:          280
    property int        heightItem:         45
    property color      backGroundColor:    adjust_VM.getBackGColor()
    property color      borderColor:        adjust_VM.getLineColor()
    property int        borderWidthItem:    1
    property int        sRadius:            5
    property int        space:              0
    property string     txtTitle:           "Title"
    property string     txtUnit:            "Value"
    property string     txtTextField
    property string     txtInputColor:      adjust_VM.getValueColor()
    property string     colorLabel:         adjust_VM.getTextColor()
    property TK_TextBox txtBox:             textInput
    property alias      validator:          textInput.mCausesValidation

    property bool       isSelected:         false

    width: widthItem
    height: heightItem

    signal pressTitle()
    signal pressTextInput()
    signal inputComplete()
    signal clickedItem()

    AdjustTimingVer4_VM {
        id: adjustViewModel
    }

    Rectangle {
        id: rectParent
        color: backGroundColor
        border.width: isSelected ? 2 : borderWidthItem
        border.color: isSelected ? "#FFEBDE" : borderColor
        radius: sRadius
        anchors.fill: parent

        TK_Label {
            id: textTitle
            x: borderWidthItem
            y: borderWidthItem
            width: widthItem / 2 - borderWidthItem
            height: heightItem - 2 * borderWidthItem
            mBackColor: backGroundColor
            mBorderRadius: sRadius
            mText: txtTitle
            mForeColor:colorLabel
            mFont.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M6)
            mFont.family: fontFactory.getFontFamily(FontFactory.FNT_M6)
            mTextAlignV: Text.AlignVCenter

            MouseArea{
                anchors.fill: parent
                onPressed: {
                    pressTitle()
                }
            }
        }

        TK_TextBox {
            id: textInput
            x: textTitle.x + textTitle.width
            y: borderWidthItem
            width: widthItem / 3
            height: heightItem - 2 * borderWidthItem
            mBackColor: backGroundColor
            mForeColor: txtInputColor
            mText: txtTextField
            mTextAlignH: Qt.AlignRight
            mTextAlignV: Qt.AlignVCenter
            mFont.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M6)
            mFont.family: fontFactory.getFontFamily(FontFactory.FNT_M6)
            focus: false
            mReadOnly: true
            mBorderStyle: 1

            onTextInputChanged: {
                txtTextField = textInput.mText
                inputComplete()
            }

            Component.onCompleted: {
                txtTextField = textInput.mText
                inputComplete();
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    pressTextInput()
                }
            }
        }

        TK_Label {
            id: textUnit
            x: textInput.x + textInput.width
            y: borderWidthItem
            width: widthItem/6 - borderWidthItem
            height: heightItem - 2*borderWidthItem
            mBackColor: backGroundColor
            mBorderRadius: sRadius
            mText: txtUnit
            mForeColor:colorLabel
            mRightToLeft: false
            mFont.pixelSize: fontFactory.getFontSize(FontFactory.FNT_M6)
            mFont.family: fontFactory.getFontFamily(FontFactory.FNT_M6)
            mTextAlignV: Text.AlignVCenter

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    pressTextInput()
                }
            }
        }
    }

    function updateTitle(strTitle){
        txtTitle = strTitle
    }

    function updateTextInput(strInput){
        textInput.text=strInput
    }
}
