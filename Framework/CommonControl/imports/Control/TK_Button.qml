import QtQuick 2.7
import QtQuick.Controls 1.4

Button {
    id: button
    width: 100
    height: 36

    //    property	alias	id:                     Not customize   <=> CONTROL LIST: Name
    //    property	alias	mEnabled                Not customize   <=> CONTROL LIST: Enabled
    //    property	alias	mVisible                Not customize   <=> CONTROL LIST: Visible
    //    property	alias	x:                      Not customize   <=> CONTROL LIST: Location(x)
    //    property	alias	y:                      Not customize   <=> CONTROL LIST: Location(y)
    //    property	alias	width:                  Not customize   <=> CONTROL LIST: Size(Width)
    //    property	alias	height:                 Not customize   <=> CONTROL LIST: Size(Height)
    //    property	alias	anchors.margins:        Not customize   <=> CONTROL LIST: Margin(All)
    //    property	alias	anchors.leftMargin:     Not customize   <=> CONTROL LIST: Margin(Left)
    //    property	alias	anchors.rightMargin:    Not customize   <=> CONTROL LIST: Margin(Right)
    //    property	alias	anchors.topMargin:      Not customize   <=> CONTROL LIST: Margin(Top)
    //    property	alias	anchors.bottomMargin:   Not customize   <=> CONTROL LIST: Margin(Bottom)
    //    property	alias	anchors.top:            Not customize   <=> CONTROL LIST: Anchors(Top)
    //    property	alias	anchors.bottom:         Not customize   <=> CONTROL LIST: Anchors(Bottom)
    //    property	alias	anchors.right:          Not customize   <=> CONTROL LIST: Anchors(Right)
    //    property	alias	anchors.left:           Not customize   <=> CONTROL LIST: Anchors(Left)



    //    property	bool	mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property	bool 	mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property	var 	mModifiers              Not used        <=> CONTROL LIST: Modifiers
    //    property  alias   mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property	alias	mDock                   Not used        <=> CONTROL LIST: Dock
    //    property  alias   mImageIndex             Not used        <=> CONTROL LIST: ImageIndex
    //    property  alias   mImageKey               Not used        <=> CONTROL LIST: ImageKey
    //    property  alias   mImageList              Not used        <=> CONTROL LIST: ImageList
    //    property  alias   mTextImageRelation      Not used        <=> CONTROL LIST: TextImageRelation


    property	size    mMaximumSize:           Qt.size(0, 0)                   // <=> CONTROL LIST: MaximumSize
    property	size    mMinimumSize:           Qt.size(0, 0)                   // <=> CONTROL LIST: MinimumSize
    property	color	mBackColor:             "white"                         // <=> CONTROL LIST: BackColor
    property    string  mBackgroundImage:       ""                              // <=> CONTROL LIST: BackgroundImage

    property	alias	mFont:                  textBtn.font                    // <=> CONTROL LIST: Font
    property	alias	mForeColor:             textBtn.color                   // <=> CONTROL LIST: ForeColor
    property	bool	mRightToLeft:           false                           // <=> CONTROL LIST: RightToLeft

    property    alias   mImage:                 iconImg.source                  // <=> CONTROL LIST: Image
    property	int     mImageAlignH                                            // <=> ImageAlign
    property	int     mImageAlignV                                            // <=> ImageAlign

    property	alias	mText:                  textBtn.text                    // <=> CONTROL LIST: Text
    property	int     mTextAlignH:            Text.AlignHCenter                                             // <=> TextAlign
    property	int     mTextAlignV                                             // <=> TextAlign
    property	alias	mAutoEllipsis:          textBtn.elide                   // <=> CONTROL LIST: AutoEllipsis
    property    bool    mAutoSize:              false                           // <=> AutoSize
    property    alias   mBackgroundImageLayout: imgBtn.fillMode                 // <=> CONTROL LIST: BackgroundImageLayout
    property    bool    mCausesValidation:      true                            // <=> CONTROL LIST: CausesValidation

    property    alias   mPadding:               textBtn.padding                 // <=> CONTROL LIST: Padding
    property    alias   mBottomPadding:         textBtn.bottomPadding           // <=> CONTROL LIST: Padding(Bottom)
    property    alias   mLeftPadding:           textBtn.leftPadding             // <=> CONTROL LIST: Padding(Left)
    property    alias   mTopPadding:            textBtn.topPadding              // <=> CONTROL LIST: Padding(Top)
    property    alias   mRightPadding:          textBtn.rightPadding            // <=> CONTROL LIST: Padding(Right)

    property    bool    mUseWaitCursor:         false                           // <=> CONTROL LIST: UseWaitCursor

    property    int     mFlatStyle:             flatStyle.mStandard             // <=> CONTROL LIST: FlatStyle
    property	color   mBorderColor:           "gray"                          // <=> CONTROL LIST: FlatAppearance(BorderColor)
    property	int     mBorderWidth :          1                               // <=> CONTROL LIST: FlatAppearance(BorderWidth)
    property    color   mMouseDownBackColor:    "green"                         // <=> CONTROL LIST: FlatAppearance(MouseDownBackColor)
    property    color   mMouseOverBackColor:    "yellow"                        // <=> CONTROL LIST: FlatAppearance(MouseOverBackColor)
    property    int     mDialogResult:          dialogResult.mNone
    property    alias   imageWidth:             iconImg.width
    property    alias   imageHeight:            iconImg.height

    property	int     mRadius :               2                               // create new
    signal validating()
    signal ok()
    signal cancel()
    signal abort()
    signal retry()
    signal ignore()
    signal yes()
    signal no()

    QtObject {
        id: flatStyle
        property int mFlat: 0
        property int mPopup: 1
        property int mStandard: 2
        property int mSystem: 3
    }

    QtObject {
        id: dialogResult
        property int mNone: 0
        property int mOk: 1
        property int mCancel: 2
        property int mAbort:3
        property int mRetry: 4
        property int mIgnore: 5
        property int mYes: 6
        property int mNo: 7
    }

    Rectangle{
        id: rectBtn
        anchors.fill: parent
        border.color: mBorderColor
        border.width: button.pressed ? 0 : mBorderWidth
        radius: mRadius
        color: (button.mFlatStyle == flatStyle.mFlat) ?
        (button.pressed ? mMouseDownBackColor:(button.hovered ? mMouseOverBackColor: mBackColor))
                 : mBackColor

        Image {
            id: imgBtn
            anchors.fill: parent
            source: mBackgroundImage
            fillMode: Image.Stretch
        }

        Image {
            id: iconImg
        }
        Text {
            id: textBtn
            anchors.fill: parent
            horizontalAlignment: mTextAlignH
            verticalAlignment: mTextAlignV

            Component.onCompleted: {
                if(mRightToLeft) {
                    horizontalAlignment: Text.AlignRight;
                }
            }

        }
    }

    Text {
        id: temp
        visible: false
        text: textBtn.text
    }

    Component.onCompleted: {
        if (mAutoSize) {
            if (textBtn.contentWidth > button.width || mAutoSizeMode) {
                width = textBtn.contentWidth;
            }
            if (textBtn.contentHeight > button.height || mAutoSizeMode) {
                height = textBtn.contentHeight;
            }
        }

        if(mFlatStyle == flatStyle.mFlat) {
            rectBtn.border.color = "Black"
            rectBtn.radius = 0
        }
        if(mFlatStyle == flatStyle.mPopup) {
            rectBtn.border.color = "#BBBBBB"
            rectBtn.radius = 0
        }
        if(mFlatStyle == flatStyle.mStandard) {
            rectBtn.border.color = "#0081f6"
            rectBtn.radius = mRadius
        }
        if(mFlatStyle == flatStyle.mSystem) {
            rectBtn.border.color = "#0081f6"
            rectBtn.radius = mRadius
        }
        if(mAutoSize) {
            if(button.width < temp.width)
                button.width = temp.width;
            if(button.height < temp.height)
                button.height = temp.height;
        }
    }




    onClicked: {
        if(mCausesValidation)                       validating();
        if(mDialogResult == dialogResult.mAbort)    abort();
        if(mDialogResult == dialogResult.mYes)      yes();
        if(mDialogResult == dialogResult.mNo)       no();
        if(mDialogResult == dialogResult.mCancel)   cancel();
        if(mDialogResult == dialogResult.mOk)       ok();
        if(mDialogResult == dialogResult.mRetry)    retry();
        if(mDialogResult == dialogResult.mIgnore)   ignore();
    }



}
