import QtQuick 2.7
import QtQuick.Controls 2.0

Item {
    id: domainUpDown

    //    property	alias	id:                     Not customize   <=> CONTROL LIST: Name
    //    property	alias	enabled:                Not customize   <=> CONTROL LIST: Enabled
    //    property	alias	visible:                Not customize   <=> CONTROL LIST: Visibled
    //    property	alias	anchors.top:            Not customize   <=> CONTROL LIST: Anchors(Top)
    //    property	alias	anchors.bottom:         Not customize   <=> CONTROL LIST: Anchors(Bottom)
    //    property	alias	anchors.right:          Not customize   <=> CONTROL LIST: Anchors(Right)
    //    property	alias	anchors.left:           Not customize   <=> CONTROL LIST: Anchors(Left)
    //    property	alias	x:                      Not customize   <=> CONTROL LIST: Location(x)
    //    property	alias	y:                      Not customize   <=> CONTROL LIST: Location(y)
    //    property	alias	width:                  Not customize   <=> CONTROL LIST: Size(Width)
    //    property	alias	height:                 Not customize   <=> CONTROL LIST: Size(Height)
    //    property	alias	anchors.margins:        Not customize   <=> CONTROL LIST: Margin(All)
    //    property	alias	anchors.leftMargin:     Not customize   <=> CONTROL LIST: Margin(Left)
    //    property	alias	anchors.rightMargin:    Not customize   <=> CONTROL LIST: Margin(Right)
    //    property	alias	anchors.topMargin:      Not customize   <=> CONTROL LIST: Margin(Top)
    //    property	alias	anchors.bottomMargin:   Not customize   <=> CONTROL LIST: Margin(Bottom)

    //    property	bool 	mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property	bool	mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property	var 	mModifiers              Not used        <=> CONTROL LIST: Modifiers
    //    property	bool	mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property	int 	mDock                   Not used        <=> CONTROL LIST: Dock
    //    property	alias	mImeMode                Not used        <=> CONTROL LIST: ImeMode

    property	var 	mItems:                 []                     			// <=> CONTROL LIST: Items
    property	alias	mReadOnly:              content.readOnly                // <=> CONTROL LIST: ReadOnly
    property	bool	mInterceptArrowKeys:    true                            // <=> CONTROL LIST: InterceptArrowKeys
    property	bool	mSorted                                                 // <=> CONTROL LIST: Sorted
    property	bool 	mWrap:                  false                           // <=> CONTROL LIST: Wrap
    property	color	mBackColor                                              // <=> CONTROL LIST: BackColor
    property	color	mBorderColor:           "gray"                          // <=> CONTROL LIST: BorderStyle
    property    int     mBorderWidth:           1                               // <=> CONTROL LIST: BorderStyle
    property    int     mBorderRadius:          3                               // <=> CONTROL LIST: BorderStyle
    property	alias	mFont:                  content.font                    // <=> CONTROL LIST: Font
    property	color	mForeColor:             content.color                   // <=> CONTROL LIST: ForeColor
    property	alias	mText:                  content.text                    // <=> CONTROL LIST: Text
    property	alias	mTextUp:                textUp.text                     // <=> create newly
    property	alias	mTextDown:              textDown.text                   // <=> create newly
    property	alias	mTextAlignH:            content.horizontalAlignment     // <=> CONTROL LIST: TextAlign
    property	alias	mTextAlignV:            content.verticalAlignment       // <=> CONTROL LIST: TextAlign
    property	int     mUpDownAlign                                            // <=> CONTROL LIST: UpDownAlign
    property	bool	mRightToLeft                                            // <=> CONTROL LIST: RightToLeft
    property    int     mCursor:                Qt.ArrowCursor                  // <=> CONTROL LIST: Cursor
    property    bool    mUseWaitCursor:         false                           // <=> CONTROL LIST: UseWaitCursor
    property	size 	mMaximumSize:           Qt.size(0, 0)                   // <=> CONTROL LIST: MaximumSize
    property	size 	mMinimumSize:           Qt.size(0, 0)                   // <=> CONTROL LIST: MinimumSize
    property	bool	mCausesValidation:      true                            // <=> CONTROL LIST: CausesValidation

    property    bool    mAutoSize:              false
    property    alias   mImageUp:               imageUp.source                  // <=> create newly
    property    alias   mImageDown:             imageDown.source                // <=> create newly
    property    int     mImgFillMode                                            // <=> create newly
    property    int     mAutoEllipsis                                           // <=> create newly
    property    int     mCurrentIndex:          1                               // <=> create newly

    signal validating()

    Column {
        id: btnColumn
        spacing: 2

        Rectangle{
            id: upBtn
            color: mBackColor
            border.width: mBorderWidth
            border.color: mBorderColor
            enabled: mInterceptArrowKeys

            Row {
                id: rowUp
                anchors.margins: 2
                spacing: 5
                layoutDirection: mUpDownAlign

                Image {
                    id: imageUp
                    anchors.leftMargin:  {if (mUpDownAlign == Qt.LeftToRight) 5}
                    anchors.rightMargin: {if (mUpDownAlign == Qt.RightToLeft) 5}
                    fillMode: mImgFillMode
                    source: "qrc:/Images/icon_up.png"
                }

                Text {
                    id: textUp
                    font: mFont
                    color: mForeColor
                    elide: mAutoEllipsis
                    padding: 2
                    horizontalAlignment: mTextAlignH
                    verticalAlignment: mTextAlignV
                }
            }

            MouseArea{
                anchors.fill: parent
                onPressed: {
                    if(mCurrentIndex < mItems.length){
                        mCurrentIndex++
                    } else if(mWrap){
                        mCurrentIndex = 1
                    } else {
                        mCurrentIndex = mItems.length
                    }
                }
            }
        }

        Rectangle{
            id: dispRect
            width: mAutoSize? childrenRect.width : parent.width
            height: mAutoSize? childrenRect.height : parent.height/3
            color: mBackColor
            border.color: mBorderColor
            border.width: mBorderWidth
            radius: mBorderRadius

            TextField {
                id: content
                anchors.margins: 2
                width: mAutoSize? maxText.width : parent.width
                height: mAutoSize? maxText.height : parent.height
                color: mForeColor

                background: Rectangle {
                    id: backRect
                    color: "transparent"
                }

                onEditingFinished: {
                    for(var i = 0; i < mItems.length; i++ ){
                        if(mItems[i].toString() === content.text) {
                            mCurrentIndex = i + 1
                            break;
                        }
                    }
                }

                onTextChanged: {
                    if (mCausesValidation) { validating() }
                }
            }
        }

        Rectangle{
            id: downBtn
            color: mBackColor
            border.width: mBorderWidth
            border.color: mBorderColor
            enabled: mInterceptArrowKeys

            Row {
                id: rowDown
                spacing: 5
                layoutDirection: mUpDownAlign

                Image {
                    id: imageDown
                    anchors.leftMargin:  {if (mUpDownAlign == Qt.LeftToRight) 10}
                    anchors.rightMargin: {if (mUpDownAlign == Qt.RightToLeft) 10}
                    fillMode: mImgFillMode
                    source: "qrc:/Images/icon_down.png"
                }

                Text {
                    id: textDown
                    font: mFont
                    color: mForeColor
                    elide: mAutoEllipsis
                    horizontalAlignment: mTextAlignH
                    verticalAlignment: mTextAlignV
                }
            }

            MouseArea{
                anchors.fill: parent
                onPressed: {
                    if(mCurrentIndex > 1){
                        mCurrentIndex--
                    } else if(mWrap){
                        mCurrentIndex = mItems.length
                    } else {
                        mCurrentIndex = 1
                    }
                }
            }
        }

        Component.onCompleted: {
            setSizeSubControl(mAutoSize)
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }

    //maxText is only used for cal maxWidth in autosize mode
    Text {
        id: maxText
        font: mFont
        padding: 5
        visible: false
    }

    onMCurrentIndexChanged: {
        mText = mItems[mCurrentIndex - 1]
    }

    onMItemsChanged: {
        var maxLength = 0
        for(var i= 0; i < mItems.length; i++){
            if(maxLength < mItems[i].length){
                maxLength = mItems[i].length
                maxText.text = mItems[i]
            }
        }

        if(mSorted){
            mItems.sort()
        }
    }

    onMSortedChanged: {
        if(mSorted){
            mItems.sort()
        }
    }

    onHeightChanged: {
        if (mMinimumSize.height > 0 && domainUpDown.height <= mMinimumSize.height) {
            domainUpDown.height = mMinimumSize.height
        }

        if (mMaximumSize.height > 0 && domainUpDown.height >= mMaximumSize.height) {
            domainUpDown.height = mMaximumSize.height
        }

        setSizeSubControl(mAutoSize)
    }

    onWidthChanged: {
        if (mMinimumSize.width > 0 && domainUpDown.width <= mMinimumSize.width) {
            domainUpDown.width = mMinimumSize.width
        }

        if (mMaximumSize.width > 0 && domainUpDown.width >= mMaximumSize.width) {
            domainUpDown.width = mMaximumSize.width
        }

        setSizeSubControl(mAutoSize)
    }

    onMAutoSizeChanged: {
        setSizeSubControl(mAutoSize)
    }

    onMRightToLeftChanged: {
        if(mRightToLeft){
            mTextAlignH = (mTextAlignH == Text.AlignLeft && mTextAlignH != Text.AlignHCenter) ? Text.AlignRight : Text.AlignLeft
            mUpDownAlign = (mUpDownAlign == Qt.RightToLeft) ? Qt.LeftToRight : Qt.RightToLeft
        }
    }

    onChildrenRectChanged: {
        setSizeSubControl(mAutoSize)
    }

    Component.onCompleted: {
        if (mMinimumSize.width > 0 && domainUpDown.width <= mMinimumSize.width) {
            domainUpDown.width = mMinimumSize.width
        }

        if (mMaximumSize.width > 0 && domainUpDown.width >= mMaximumSize.width) {
            domainUpDown.width = mMaximumSize.width
        }

        if (mMinimumSize.height > 0 && domainUpDown.height <= mMinimumSize.height) {
            domainUpDown.height = mMinimumSize.height
        }

        if (mMaximumSize.height > 0 && domainUpDown.height >= mMaximumSize.height) {
            domainUpDown.height = mMaximumSize.height
        }

        if(mSorted){
            mItems.sort()
        }
        mText = mItems[mCurrentIndex - 1]
    }

    function setSizeSubControl(autoSizeMode){
        if(autoSizeMode){

            //Calculate width-height of domainupdown
            upBtn.width = rowUp.childrenRect.width
            upBtn.height = rowUp.childrenRect.height

            dispRect.width = dispRect.childrenRect.width
            dispRect.height = dispRect.childrenRect.height

            downBtn.width = rowDown.childrenRect.width
            downBtn.height = rowDown.childrenRect.height

            btnColumn.width = Math.max(upBtn.width, dispRect.width, downBtn.width) + 5
            btnColumn.height = Math.max(upBtn.height, dispRect.height, downBtn.height) * 3 + btnColumn.spacing * 2

            //Set width-height of childrenRect
            upBtn.width = dispRect.width = downBtn.width = btnColumn.width
            upBtn.height = dispRect.height = downBtn.height = (btnColumn.height - btnColumn.spacing * 2) / 3

            //Set width-height of upBtn
            imageUp.height = textUp.height = upBtn.height
            textUp.width = upBtn.width - imageUp.width - rowUp.spacing

            //Set width-height of downBtn
            imageDown.height = textDown.height = downBtn.height
            textDown.width = downBtn.width - imageDown.width - rowDown.spacing
        } else {
            btnColumn.width = domainUpDown.width
            btnColumn.height = domainUpDown.height

            //Set width-height of childrenRect
            upBtn.width = dispRect.width = downBtn.width = btnColumn.width
            upBtn.height = dispRect.height = downBtn.height = (btnColumn.height - btnColumn.spacing * 2) / 3

            //Set width-height of upBtn
            imageUp.height = textUp.height = upBtn.height
            imageUp.width = imageUp.height
            textUp.width = upBtn.width - imageUp.width - rowUp.spacing


            //Set width-height of downBtn
            imageDown.height = textDown.height = downBtn.height
            imageDown.width = imageDown.height
            textDown.width = downBtn.width - imageDown.width - rowDown.spacing
        }

            //Set width-height of dispRect
            content.height = dispRect.height
            content.width = dispRect.width
    }
}
