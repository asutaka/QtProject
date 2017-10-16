import QtQuick 2.0

Rectangle {
    id: pictureBox

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

    property	alias	mSizeMode:              mainImage.fillMode  //  <=> CONTROL LIST: SizeMode
    property	size    mMaximumSize:           Qt.size(0, 0)       //  <=> CONTROL LIST: MaximumSize
    property	size    mMinimumSize:           Qt.size(0, 0)       //  <=> CONTROL LIST: MinimumSize
    property	int     mPaddingAll                                 //  <=> CONTROL LIST: Padding
    property	int     mPaddingLeft                                //  <=> CONTROL LIST: Padding
    property	int     mPaddingRight                               //  <=> CONTROL LIST: Padding
    property	int     mPaddingTop                                 //  <=> CONTROL LIST: Padding
    property	int     mPaddingBottom                              //  <=> CONTROL LIST: Padding
    property	string	mErrorImage                                 //  <=> CONTROL LIST: ErrorImage
    property	alias	mImage:                 mainImage.source    //  <=> CONTROL LIST: Image
    property	string	mInitialImage                               //  <=> CONTROL LIST: InitialImage
    property	string	mImageLocation                              //  <=> CONTROL LIST: ImageLocation
    property	bool	mWaitOnLoad                                 //  <=> CONTROL LIST: WaitOnLoad
    property	alias	mBackColor:             pictureBox.color    //  <=> CONTROL LIST: BackColor
    property	alias	mBackgroundImage:       backImage.source    //  <=> CONTROL LIST: BackgroundImage
    property	alias	mBackgroundImageLayout: backImage.fillMode  //  <=> CONTROL LIST: BackgroundImageLayout
    property	color	mBorderColor                                //  <=> CONTROL LIST: BorderStyle
    property	int     mBorderWidth                                //  <=> CONTROL LIST: BorderStyle
    property	alias	mBorderRadius:          pictureBox.radius   //  <=> CONTROL LIST: BorderStyle
    property    bool    mUseWaitCursor:         false               //  <=> CONTROL LIST: UseWaitCursor
    property    int     mCursor:                Qt.ArrowCursor      //  <=> CONTROL LIST: Cursor

    border.color: mBorderColor
    border.width: mBorderWidth

    Image {
        id: backImage
        anchors.fill: parent
    }

    Image {
        id: mainImage
        anchors.fill: parent
        anchors.margins: mPaddingAll
        anchors.leftMargin: mPaddingLeft
        anchors.rightMargin: mPaddingRight
        anchors.topMargin: mPaddingTop
        anchors.bottomMargin: mPaddingBottom

        onStatusChanged: {
            switch(mainImage.status) {
                case Image.Null:
                    mainImage.source = mInitialImage
                    break
                case Image.Ready:
                    mainImage.source = mImage
                    if (mWaitOnLoad)
                        pictureBox.enabled = true
                    break
                case Image.Loading:
                    mainImage.source = mInitialImage
                    if (mWaitOnLoad)
                        pictureBox.enabled = false
                    break
                case Image.Error:
                    mainImage.source = mErrorImage
                    break
                default:
                    break
            }
        }
    }

    onHeightChanged: {
        if (mMinimumSize.height > 0 && pictureBox.height <= mMinimumSize.height) {
            pictureBox.height = mMinimumSize.height
        }

        if (mMaximumSize.height > 0 && pictureBox.height >= mMaximumSize.height) {
            pictureBox.height = mMaximumSize.height
        }
    }

    onWidthChanged: {
        if (mMinimumSize.width > 0 && pictureBox.width <= mMinimumSize.width) {
            pictureBox.width = mMinimumSize.width
        }

        if (mMaximumSize.width > 0 && pictureBox.width >= mMaximumSize.width) {
            pictureBox.width = mMaximumSize.width
        }
    }

    Component.onCompleted: {
         if (mMinimumSize.height > 0 && pictureBox.height <= mMinimumSize.height) {
            pictureBox.height =  mMinimumSize.height
         }

         if (mMaximumSize.height > 0 && pictureBox.height >= mMaximumSize.height) {
             pictureBox.height = mMaximumSize.height
         }

         if (mMinimumSize.width > 0 && pictureBox.width <= mMinimumSize.width) {
             pictureBox.width = mMinimumSize.width
         }

         if (mMaximumSize.width > 0 && pictureBox.width >= mMaximumSize.width) {
             pictureBox.width = mMaximumSize.width
         }
     }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
    }
}
