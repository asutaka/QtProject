import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0


ComboBox {
    id: combobox

    //    property	alias	id:                     Not customize   <=> CONTROL LIST: Name
    //    property	alias	enabled:                Not customize   <=> CONTROL LIST: Enabled
    //    property	alias	visible:                Not customize   <=> CONTROL LIST: Visibled
    //    property	alias	x:                      Not customize   <=> CONTROL LIST: Location(x)
    //    property	alias	y:                      Not customize   <=> CONTROL LIST: Location(y)
    //    property	alias	width:                  Not customize   <=> CONTROL LIST: Size(Width)
    //    property	alias	height:                 Not customize   <=> CONTROL LIST: Size(Height)
    //    property	alias	anchors.top:            Not customize   <=> CONTROL LIST: Anchors(Top)
    //    property	alias	anchors.bottom:         Not customize   <=> CONTROL LIST: Anchors(Bottom)
    //    property	alias	anchors.right:          Not customize   <=> CONTROL LIST: Anchors(Right)
    //    property	alias	anchors.left:           Not customize   <=> CONTROL LIST: Anchors(Left)
    //    property	alias	anchors.margins:        Not customize   <=> CONTROL LIST: Margin(All)
    //    property	alias	anchors.leftMargin:     Not customize   <=> CONTROL LIST: Margin(Left)
    //    property	alias	anchors.rightMargin:    Not customize   <=> CONTROL LIST: Margin(Right)
    //    property	alias	anchors.topMargin:      Not customize   <=> CONTROL LIST: Margin(Top)
    //    property	alias	anchors.bottomMargin:   Not customize   <=> CONTROL LIST: Margin(Bottom)
    //    property  alias   editable: false         Not customize   <=> CONTROL LIST: DropDownStyle
    //    property	alias	mSize                   Defined in mFont <=> CONTROL LIST: Size

    //    property	bool	mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property	int 	mDock                   Not used        <=> CONTROL LIST: Dock
    //    property	alias	mDisplayMember          Not used        <=> CONTROL LIST: DisplayMember
    //    property	alias	mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property	alias	mImeMode                Not used        <=> CONTROL LIST: ImeMode
    //    property	alias	mItems                  Not used        <=> CONTROL LIST: Items
    //    property	bool	mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property	var 	mModifiers              Not used        <=> CONTROL LIST: Modifiers
    //    property	alias	mValueMember            Not used        <=> CONTROL LIST: ValueMember


    property	alias	mDataSource:        combobox.model                   // <=> CONTROL LIST: DataSource
    property	int     mDropDownHeight:    200                              // <=> CONTROL LIST: DropDownHeight
    property	int     mItemHeight:        combobox.height                  // <=> CONTROL LIST: DropDownWidth
    property	int 	mDropDownWidth:     combobox.width                   // <=> CONTROL LIST: mItemHeight
    property	color	mBackColor:         "#EEE8CD"                       // <=> CONTROL LIST: mBackColor
    property	font	mFont                                                // <=> CONTROL LIST: mFont
    property	color	mForeColor                                           // <=> CONTROL LIST: mForeColor
    property	bool	mRightToLeft:       true                             // <=> CONTROL LIST: mRightToLeft
    property	string	mText                                                // <=> CONTROL LIST: mText
    property	int     mFormatString:      Text.AutoText                    // <=> CONTROL LIST: FormatString
    property	size    mMaximumSize:       Qt.size(0, 0)                    // <=> CONTROL LIST: MaximumSize
    property	size    mMinimumSize:       Qt.size(0, 0)                    // <=> CONTROL LIST: MinimumSize
    property	bool	mSorted:            false                            // <=> CONTROL LIST: DataSource
    property	font	mFontPopup                                           // <=> CONTROL LIST: mFont
    property	color	mBackColorPopUp:    "#99FF99"                        // create new
    property	int     mTextAlignH:        Text.AlignHCenter                // create new
    property	int     mTextAlignV:        Text.AlignVCenter                // create new
    property	color	mBorderColor:       "#AAAAAA"                        // create new
    property	int     mBorderWidth:       2                                // create new
    property	int     mRadius:            5                                // create new
    property	color	mColorItemSelected: "#A9A9A9"                        // create new
    property	color	mColorItemDefault:  "transparent"                    // create new
    property	color	mBorderColorItem:   "#4F4F4F"                        // create new
    property	color	mTextColorSelected: "white"                          // create new
    property	color	mTextColorDefault:  "black"                          // create new
    property	alias	mDropDownStyle:     combobox.editable                // <=> CONTROL LIST: DropDownStyle                                                                             // (mDropDownStyle ==true ->DropDown)
    property	int     mMaxLength:         8                                // <=> CONTROL LIST: MaxLength
    property	bool	mFormattingEnabled: true                             // <=> CONTROL LIST: FormattingEnabled
    property	int 	mMaxDropDownItems:  0                                // <=> CONTROL LIST: MaxDropDownItems
    property	bool	mIntegralHeight:    true                             // <=> CONTROL LIST: IntegralHeight
    property	bool    mCausesValidation:  true                             // <=> CONTROL LIST: CausesValidation
    property    int     mCursor:            Qt.ArrowCursor                   // <=> CONTROL LIST: Cursor
    property	bool 	mUseWaitCursor:     false                            // <=> CONTROL LIST: UseWaitCursor
    property	int 	mFlatStyle:         flatStyle.mFlat                                // <=> CONTROL LIST: FlatStyle
    property	int	    mDrawMode:          1                                // <=> CONTROL LIST: DrawMode
    property    string  mSourceImage:       "qrc:/Images/arrow.png"          // create new
    width: 200
    height: 40
    signal validating()

    QtObject {
        id: flatStyle
        property int mFlat: 0
        property int mPopup: 1
        property int mStandard: 2
        property int mSystem: 3
    }
    style: ComboBoxStyle {
        id: comboStyle

        background:
            Rectangle {
            id: rectCategory
            border.width: mBorderWidth
            color: mBackColor

            Component.onCompleted: {
                if(mFlatStyle == flatStyle.mFlat){
                    rectCategory.border.color = "Black"
                    rectCategory.radius = 0
                }
                else if(mFlatStyle == flatStyle.mPopup){
                    rectCategory.border.color = "#BBBBBB"
                    rectCategory.radius = 0
                }
                else if(mFlatStyle == flatStyle.mStandard){
                    rectCategory.border.color = "#0081f6"
                    rectCategory.radius = mRadius
                }
                else if(mFlatStyle == flatStyle.mSystem){
                    rectCategory.border.color = "#0081f6"
                    rectCategory.radius = mRadius
                }
            }
            Image {
                id: arrow
                width: parent.height
                height: parent.height
                fillMode: Image.Pad
                source: mSourceImage
                anchors.right: {
                    if(mRightToLeft){
                        parent.right
                    }
                }
                anchors.left: {
                    if(!mRightToLeft){
                        parent.left
                    }
                }
            }
        }

        label: Text {
            id: txtTitle
            verticalAlignment: mTextAlignV
            horizontalAlignment: mTextAlignH
            font: mFont
            color: mForeColor
            text: control.currentText
            elide: Text.ElideRight

            onTextChanged: {
                if(mCausesValidation){
                    validating()
                }
            }
        }

        property Component __dropDownStyle: MenuStyle {

            __maxPopupHeight: mDropDownHeight
            __menuItemType: "comboboxitem"

            // Background pop-up
            frame: Rectangle {
                color: mBackColorPopUp
                border.width: 2
            }

            // an item text
            itemDelegate.label:  Text {
                height: mItemHeight
                width: mDropDownWidth -30
                verticalAlignment: mTextAlignV
                horizontalAlignment: mTextAlignH
                font: mFontPopup
                textFormat: combobox.mFormattingEnabled ? combobox.mFormatString : undefined
                color: styleData.selected ? mTextColorSelected : mTextColorDefault
                text: styleData.text
                elide: Text.ElideRight
            }

            // Background item selected
            itemDelegate.background: Rectangle {
                border.color: mBorderColorItem
                color: styleData.selected ? mColorItemSelected : mColorItemDefault
                // radius: 5
            }

            __scrollerStyle: ScrollViewStyle {

            }
        }

    }

    onEditTextChanged: {
        if(editText.length > mMaxLength)
        {
            editText = editText.substring(0, mMaxLength)
        }
    }

    Component.onCompleted: {

        // MaxDropDownItems
        if(mMaxDropDownItems !== 0){
            console.log("1111")
            mDropDownHeight = mItemHeight *(mMaxDropDownItems+1)
        }

        // Sort
        if(mSorted){
            mDataSource = mDataSource.sort()
        }
        //Maximumsize
        if(combobox.mMaximumSize.width !== 0)
        {
            if(combobox.width > combobox.mMaximumSize.width)
                combobox.width = combobox.mMaximumSize.width;
        }
        if(combobox.mMaximumSize.height !== 0)
        {
            if(combobox.height > combobox.mMaximumSize.height)
                combobox.height = combobox.mMaximumSize.height;
        }
        //Minimumsize
        if(combobox.mMinimumSize.width !== 0)
        {
            if(combobox.width < combobox.mMinimumSize.width)
                combobox.width = combobox.mMinimumSize.width;
        }
        if(combobox.mMinimumSize.height !== 0)
        {
            if(combobox.height < combobox.mMinimumSize.height)
                combobox.height = combobox.mMinimumSize.height;
        }
    }

    MouseArea{
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }
}





