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

    signal pressTitle()
    signal pressTextInput()
    signal inputComplete()

    AdjustTimingVer4_VM{
        id: adjustViewModel
    }

    Rectangle
    {
        width: widthItem
        height: heightItem
        color: backGroundColor
        border.width: borderWidthItem
        border.color: borderColor
        radius: sRadius

        TK_Label{
            id: textTitle
            x: borderWidthItem
            y: borderWidthItem
            width: widthItem/2 -borderWidthItem
            height: heightItem - 2*borderWidthItem
            mBackColor: backGroundColor
            mBorderRadius: sRadius
            mText: txtTitle
            mForeColor:colorLabel
            mFont: Qt.font({pixelSize: 18,
                                  family: "MS Gothic",
                                  italic: false,
                                  bold: false})
            mTextAlignV: Text.AlignVCenter
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    pressTitle()
                }
            }
        }
        TK_TextBox{
            id: textInput
            x: textTitle.x +textTitle.width
            y: borderWidthItem
            width: widthItem/3
            height: heightItem  - 2*borderWidthItem
            backgroundColor:backGroundColor
            foreColor: txtInputColor
            text: txtTextField
            textAlign: Text.AlignRight
            fontFamily: "MS Gothic"
            font.pixelSize: 18
            focus:false
            readOnly:true
            onActiveFocusChanged:
            {
                if(activeFocus)
                {
                    pressTextInput()
                }

            }
            onDisplayTextChanged:
            {
                txtTextField = txtBox.text
                inputComplete();
            }
            Component.onCompleted:
            {
                txtTextField = txtBox.text
                inputComplete();
            }

        }
        TK_Label{
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
            mFont: Qt.font({pixelSize: 18,
                                  family: "MS Gothic",
                                  italic: false,
                                  bold: false})
            mTextAlignV: Text.AlignVCenter
        }
    }
    function updateTitle(strTitle){
        txtTitle=strTitle
    }
    function updateTextInput(strInput){
        textInput.text=strInput
    }

}
