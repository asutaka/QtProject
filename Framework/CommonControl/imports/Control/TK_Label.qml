import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Label {
    id: label

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
    //    property  alias   mImageIndex             Not used        <=> CONTROL LIST: ImageIndex
    //    property  alias   mImageKey               Not used        <=> CONTROL LIST: ImageKey
    //    property  alias   mImageList              Not used        <=> CONTROL LIST: ImageList

    property	alias	mBackColor:         backRect.color              // <=> CONTROL LIST: BackColor
    property	alias	mBorderStyle:       content.style               // <=> CONTROL LIST: BorderStyle
    property	alias	mFont:              content.font                // <=> CONTROL LIST: Font
    property	alias	mForeColor:         content.color               // <=> CONTROL LIST: ForeColor
    property	bool	mRightToLeft:       false                       // <=> CONTROL LIST: RightToLeft
    property	bool	mAutoSize:          false                       // <=> CONTROL LIST: AutoSize
    property	var 	mMaximumSize:       Qt.size(0, 0)               // <=> CONTROL LIST: MaximumSize
    property	var 	mMinimumSize:       Qt.size(0, 0)               // <=> CONTROL LIST: MinimumSize
    property    alias   mTextAlignH:        content.horizontalAlignment // <=> CONTROL LIST: TextAlign
    property    alias   mTextAlignV:        content.verticalAlignment   // <=> CONTROL LIST: TextAlign
    property    alias   mText:              content.text                // <=> CONTROL LIST: Text
    property    alias   mAutoEllipsis:      content.elide               // <=> CONTROL LIST: AutoEllipsis
    property    alias   mImage:             backImg.source              // <=> CONTROL LIST: Imange
    property    alias   mImageAlignH:       backImg.horizontalAlignment // <=> CONTROL LIST: ImageAlign
    property    alias   mImageAlignV:       backImg.verticalAlignment   // <=> CONTROL LIST: ImageAlign
    property    int     mCursor:            Qt.ArrowCursor              // <=> CONTROL LIST: Cursor
    property    bool    mUseWaitCursor:     false                       // <=> CONTROL LIST: UseWaitCursor
    property    bool    mCausesValidation:  true                        // <=> CONTROL LIST: CausesValidation

    property    alias   mWrap:              content.wrapMode            // Create newly
    property    color   mBorderColor                                    // Create newly
    property    int     mBorderWidth                                    // Create newly
    property    alias   mBorderRadius:      backRect.radius             // Create newly

    signal clicklabel()
    signal validating()

    background: Rectangle {
        id: backRect
        anchors.fill: parent
        border.color: mBorderColor
        border.width: mBorderWidth

        Image {
            id: backImg
            anchors.fill: parent
        }
    }

    Text {
        id: content
        anchors.margins: 2
        text: "label"

        Component.onCompleted: {
            if (!mAutoSize) {
                width = label.width
                height = label.height
            }
        }

        onTextChanged: {
            if (mCausesValidation) { validating() }
        }
    }

    Component.onCompleted: {
        if (mMinimumSize.width > 0 && label.width <= mMinimumSize.width) {
            label.width = mMinimumSize.width
        }

        if (mMaximumSize.width > 0 && label.width >= mMaximumSize.width) {
            label.width = mMaximumSize.width
        }

        if (mMinimumSize.height > 0 && label.height <= mMinimumSize.height) {
            label.height = mMinimumSize.height
        }

        if (mMaximumSize.height > 0 && label.height >= mMaximumSize.height) {
            label.height = mMaximumSize.height
        }

        if (mAutoSize){
            label.height = content.height
            label.width = content.width
        }
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            clicklabel()
        }
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }
}
