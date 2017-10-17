import QtQuick 2.7
import QtQuick.Controls 2.0

Button {
    id: _btnParent

    //    property  alias   id:                     Not customize   <=> CONTROL LIST: Name
    //    property  alias   mEnabled                Not customize   <=> CONTROL LIST: Enabled
    //    property  alias   mVisible                Not customize   <=> CONTROL LIST: Visible
    //    property  alias   x:                      Not customize   <=> CONTROL LIST: Location(x)
    //    property  alias   y:                      Not customize   <=> CONTROL LIST: Location(y)
    //    property  alias   width:                  Not customize   <=> CONTROL LIST: Size(Width)
    //    property  alias   height:                 Not customize   <=> CONTROL LIST: Size(Height)
    //    property  alias   anchors.margins:        Not customize   <=> CONTROL LIST: Margin(All)
    //    property  alias   anchors.leftMargin:     Not customize   <=> CONTROL LIST: Margin(Left)
    //    property  alias   anchors.rightMargin:    Not customize   <=> CONTROL LIST: Margin(Right)
    //    property  alias   anchors.topMargin:      Not customize   <=> CONTROL LIST: Margin(Top)
    //    property  alias   anchors.bottomMargin:   Not customize   <=> CONTROL LIST: Margin(Bottom)
    //    property  alias   anchors.top:            Not customize   <=> CONTROL LIST: Anchors(Top)
    //    property  alias   anchors.bottom:         Not customize   <=> CONTROL LIST: Anchors(Bottom)
    //    property  alias   anchors.right:          Not customize   <=> CONTROL LIST: Anchors(Right)
    //    property  alias   anchors.left:           Not customize   <=> CONTROL LIST: Anchors(Left)

    //    property  bool    mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property  bool    mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property  var     mModifiers              Not used        <=> CONTROL LIST: Modifiers
    //    property  alias   mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property  alias   mDock                   Not used        <=> CONTROL LIST: Dock
    //    property  alias   mImageIndex             Not used        <=> CONTROL LIST: ImageIndex
    //    property  alias   mImageKey               Not used        <=> CONTROL LIST: ImageKey
    //    property  alias   mImageList              Not used        <=> CONTROL LIST: ImageList
    //    property  alias   mTextImageRelation      Not used        <=> CONTROL LIST: TextImageRelation


    property    size    mMaximumSize:           Qt.size(999, 999)               // <=> CONTROL LIST: MaximumSize
    property    size    mMinimumSize:           Qt.size(0, 0)                   // <=> CONTROL LIST: MinimumSize
    property    color   mBackColor:             "white"                         // <=> CONTROL LIST: BackColor

    property    alias   mBackgroundImage:       imgBtn.source                   // <=> CONTROL LIST: BackgroundImage
    property    alias   mBackgroundImageLayout: imgBtn.fillMode                 // <=> CONTROL LIST: BackgroundImageLayout

    property    alias   mFont:                  _btnText.font                   // <=> CONTROL LIST: Font
    property    alias   mForeColor:             _btnText.color                  // <=> CONTROL LIST: ForeColor
    property    bool    mRightToLeft:           false                           // <=> CONTROL LIST: RightToLeft

    property    alias   mImage:                 _iconImg.source                 // <=> CONTROL LIST: Image
    property    int     mImageAlign:            alignment.mMiddleCenter    // <=> CONTROL LIST: ImageAlign

    property    alias   mText:                  _btnText.text                   // <=> CONTROL LIST: Text
    property    int     mTextAlign:             alignment.mMiddleCenter         // <=> CONTROL LIST: TextAlign
    property    alias   mAutoEllipsis:          _btnText.elide                  // <=> CONTROL LIST: AutoEllipsis
    property    bool    mAutoSize:              false                           // <=> CONTROL LIST: AutoSize
    property    int     mAutoSizeMode:          autoSizeMode.mGrowOnly          // <=> CONTROL LIST: AutoSizeMode
    property    bool    mCausesValidation:      true                            // <=> CONTROL LIST: CausesValidation

    property    int     mPadding:               0                               // <=> CONTROL LIST: Padding
    property    int     mBottomPadding:         0                               // <=> CONTROL LIST: Padding(Bottom)
    property    int     mLeftPadding:           0                               // <=> CONTROL LIST: Padding(Left)
    property    int     mTopPadding:            0                               // <=> CONTROL LIST: Padding(Top)
    property    int     mRightPadding:          0                               // <=> CONTROL LIST: Padding(Right)
    property    bool    mUseWaitCursor:         false                           // <=> CONTROL LIST: UseWaitCursor
    property    int     mCursor:                Qt.ArrowCursor          		// <=> CONTROL LIST: Cursor
    property    int     mFlatStyle:             flatStyle.mStandard             // <=> CONTROL LIST: FlatStyle
    property    color   mBorderColor:           "gray"                          // <=> CONTROL LIST: FlatAppearance(BorderColor)
    property    int     mBorderWidth :          1                               // <=> CONTROL LIST: FlatAppearance(BorderWidth)
    property    color   mMouseDownBackColor:    "green"                         // <=> CONTROL LIST: FlatAppearance(MouseDownBackColor)
    property    color   mMouseOverBackColor:    "yellow"                        // <=> CONTROL LIST: FlatAppearance(MouseOverBackColor)
    property    int     mDialogResult:          dialogResult.mNone              // <=> CONTROL LIST: DialogResult

    property    alias   imageWidth:             _iconImg.width
    property    alias   imageHeight:            _iconImg.height
    property    int     mRadius :               2                               // create new

    signal validating()
    signal ok()
    signal cancel()
    signal abort()
    signal retry()
    signal ignore()
    signal yes()
    signal no()

    // FlatStyle Options
    QtObject {
        id: flatStyle
        property int mFlat: 0
        property int mPopup: 1
        property int mStandard: 2
        property int mSystem: 3
    }

    // DialogResult Options
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

    // Image Alignment Options
    QtObject {
        id: alignment
        property int mTopLeft:      0
        property int mTopCenter:    1
        property int mTopRight:     2
        property int mMiddleLeft:   3
        property int mMiddleCenter: 4
        property int mMiddleRight:  5
        property int mBottomLeft:   6
        property int mBottomCenter: 7
        property int mBottomRight:  8
    }

    // AutoSizeMode Options
    QtObject {
        id: autoSizeMode
        property int mGrowOnly: 0
        property int mGrowAndShrink: 1
    }

    // Background Image
    Image {
        id: imgBtn
        z: -1
        anchors.fill: parent
    }

    // Background Content
    background: Rectangle {
        id: _rectContent
        anchors.fill: parent
        border.color: mBorderColor
        border.width: {
            if (_btnParent.pressed) {
                return 0
            } else {
                return mBorderWidth
            }
        }
        radius: mRadius
        color: {
            if (_btnParent.mFlatStyle === flatStyle.mFlat) {
                if (_btnParent.pressed) {
                    return mMouseDownBackColor
                } else {
                    if (_btnParent.hovered) {
                        return mMouseOverBackColor
                    } else {
                        return mBackColor
                    }
                }
            } else {
                return mBackColor
            }
        }
    }

    // Button Content
    indicator: Rectangle {
        id: _contentRect
        anchors.fill: parent
        color: "transparent"

        // Control padding
        anchors.margins: mPadding
        anchors.topMargin: {
            if (mTopPadding == 0) {
                return mPadding
            } else {
                return mTopPadding
            }
        }
        anchors.bottomMargin: {
            if (mBottomPadding == 0) {
                return mPadding
            } else {
                return mBottomPadding
            }
        }
        anchors.leftMargin: {
            if (mLeftPadding == 0) {
                return mPadding
            } else {
                return mLeftPadding
            }
        }
        anchors.rightMargin: {
            if (mRightPadding == 0) {
                return mPadding
            } else {
                return mRightPadding
            }
        }

        // Button Icon
        Image {
            id: _iconImg
        }

        // Button Content text
        Text {
            id: _btnText

            onTextChanged: {
                if (mCausesValidation) {
                    validating()
                }
            }

            Component.onCompleted: {
                if (mRightToLeft) {
                    _btnText.horizontalAlignment = Text.AlignRight
                }
            }
        }

        Component.onCompleted: {
            __setImageAlign()
            __setTextAlign()
        }

        // Set Image Alignment
        function __setImageAlign() {
            switch (mImageAlign) {
                case alignment.mTopLeft:
                    _iconImg.anchors.left = _contentRect.left
                    _iconImg.anchors.top = _contentRect.top
                    break
                case alignment.mTopCenter:
                    _iconImg.anchors.top = _contentRect.top
                    _iconImg.anchors.horizontalCenter = _contentRect.horizontalCenter
                    break
                case alignment.mTopRight:
                    _iconImg.anchors.right = _contentRect.right
                    _iconImg.anchors.top = _contentRect.top
                    break
                case alignment.mMiddleLeft:
                    _iconImg.anchors.verticalCenter = _contentRect.verticalCenter
                    _iconImg.anchors.left = _contentRect.left
                    break
                case alignment.mMiddleCenter:
                    _iconImg.anchors.verticalCenter = _contentRect.verticalCenter
                    _iconImg.anchors.horizontalCenter = _contentRect.horizontalCenter
                    break
                case alignment.mMiddleRight:
                    _iconImg.anchors.verticalCenter = _contentRect.verticalCenter
                    _iconImg.anchors.right = _contentRect.right
                    break
                case alignment.mBottomLeft:
                    _iconImg.anchors.left = _contentRect.left
                    _iconImg.anchors.bottom = _contentRect.bottom
                    break
                case alignment.mBottomCenter:
                    _iconImg.anchors.bottom = _contentRect.bottom
                    _iconImg.anchors.horizontalCenter = _contentRect.horizontalCenter
                    break
                case alignment.mBottomRight:
                    _iconImg.anchors.bottom = _contentRect.bottom
                    _iconImg.anchors.right = _contentRect.right
                    break
                default:
                    _iconImg.anchors.verticalCenter = _contentRect.verticalCenter
                    _iconImg.anchors.horizontalCenter = _contentRect.horizontalCenter
                    break
            }
        }

        // Set Text Alignment
        function __setTextAlign() {
            switch (mTextAlign) {
                case alignment.mTopLeft:
                    if (mImageAlign === alignment.mTopLeft || mImageAlign === alignment.mMiddleLeft || mImageAlign === alignment.mBottomLeft)
                    {
                        _btnText.anchors.left = _iconImg.right
                    } else { _btnText.anchors.left = _contentRect.left}

                    _btnText.anchors.top = _contentRect.top
                    break
                case alignment.mTopCenter:
                    if(mImageAlign === alignment.mTopLeft
                                            || mImageAlign === alignment.mTopCenter
                                            || mImageAlign === alignment.mTopRight)
                    {
                        _btnText.anchors.top = _iconImg.bottom
                    } else { _btnText.anchors.top = _contentRect.top}
                    _btnText.anchors.horizontalCenter = _contentRect.horizontalCenter
                    break
                case alignment.mTopRight:
                    if (mImageAlign === alignment.mTopRight
                                              || mImageAlign === alignment.mMiddleRight
                                              || mImageAlign === alignment.mBottomRight)
                    {
                        _btnText.anchors.right = _iconImg.left
                    } else {
                        _btnText.anchors.right = _contentRect.right
                    }
                    _btnText.anchors.top = _contentRect.top
                    break
                case alignment.mMiddleLeft:
                    if (mImageAlign === alignment.mTopLeft
                                             || mImageAlign === alignment.mMiddleLeft
                                             || mImageAlign === alignment.mBottomLeft)
                    {
                        _btnText.anchors.left = _iconImg.right
                    } else {
                        _btnText.anchors.left = _contentRect.left
                    }
                    _btnText.anchors.verticalCenter = _contentRect.verticalCenter
                    break
                case alignment.mMiddleCenter:
                    _btnText.anchors.verticalCenter = _contentRect.verticalCenter
                    _btnText.anchors.horizontalCenter = _contentRect.horizontalCenter
                    break
                case alignment.mMiddleRight:
                    if (mImageAlign === alignment.mTopRight
                                              || mImageAlign === alignment.mMiddleRight
                                              || mImageAlign === alignment.mBottomRight)
                    {
                        _btnText.anchors.right = _iconImg.left
                    } else {
                        _btnText.anchors.right = _contentRect.right
                    }
                    _btnText.anchors.verticalCenter = _contentRect.verticalCenter
                    break
                case alignment.mBottomLeft:
                    if (mImageAlign === alignment.mTopLeft
                                             || mImageAlign === alignment.mMiddleLeft
                                             || mImageAlign === alignment.mBottomLeft)
                    {
                        _btnText.anchors.left = _iconImg.right
                    } else {
                        _btnText.anchors.left = _contentRect.left
                    }
                    _btnText.anchors.bottom = _contentRect.bottom
                    break
                case alignment.mBottomCenter:
                    if (mImageAlign === alignment.mTopRight
                                               || mImageAlign === alignment.mMiddleRight
                                               || mImageAlign === alignment.mBottomRight)
                    {
                        _btnText.anchors.bottom = _iconImg.left
                    } else {
                        _btnText.anchors.bottom = _contentRect.right
                    }
                    _btnText.anchors.horizontalCenter = _contentRect.horizontalCenter
                    break
                case alignment.mBottomRight:
                    _btnText.anchors.right = _contentRect.right
                    _btnText.anchors.bottom = _contentRect.bottom
                    break
                default:
                    _btnText.anchors.verticalCenter = _contentRect.verticalCenter
                    _btnText.anchors.horizontalCenter = _contentRect.horizontalCenter
                    break
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: {
            if (mUseWaitCursor) {
                return Qt.WaitCursor
            } else {
                return mCursor
            }
        }
        acceptedButtons: Qt.NoButton
    }

    Component.onCompleted: {
        // Set Control Size
        __setControlSize()

        // Set FlatStyle
        __setFlatStyle(mFlatStyle)
    }

    onClicked: {
        // Set DialogResult
        __setDialogResult(mDialogResult)
    }

    // Set Dialog Result in use
    function __setDialogResult(_args) {
        switch (_args) {
            case dialogResult.mAbort:
                abort()
                break
            case dialogResult.mYes:
                yes()
                break
            case dialogResult.mNo:
                no()
                break
            case dialogResult.mCancel:
                cancel()
                break
            case dialogResult.mOk:
                ok()
                break
            case dialogResult.mRetry:
                retry()
                break
            case dialogResult.mIgnore:
                ignore()
                break
            default:
                break
        }
    }

    // Set FlatStyle in use
    function __setFlatStyle(_args) {
        switch (_args) {
            case flatStyle.mFlat:
                _rectContent.border.color = "Black"
                _rectContent.radius = 0
                break
            case flatStyle.mPopup:
                _rectContent.border.color = "#BBBBBB"
                _rectContent.radius = 0
                break
            case flatStyle.mStandard:
            case flatStyle.mSystem:
                _rectContent.border.color = "#0081f6"
                _rectContent.radius = mRadius
                break
            default:
                break
        }
    }

    // Set Control Width
    function __setWidth() {
        if (_btnParent.width >= mMaximumSize.width) return mMaximumSize.width
        if (_btnParent.width <= mMinimumSize.width) return mMinimumSize.width
        return _btnParent.width
    }

    // Set Control Height
    function __setHeight() {
        if (_btnParent.height >= mMaximumSize.height) return mMaximumSize.height
        if (_btnParent.height <= mMinimumSize.height) return mMinimumSize.height
        return _btnParent.height
    }

    // Set Control Size
    function __setControlSize() {
        if (mAutoSize) {
            if (mAutoSizeMode === autoSizeMode.mGrowOnly) {
                if (_btnParent.width < _btnText.contentWidth) {
                    _btnParent.width = __setWidthAutoSize()
                } else {
                    _btnParent.width = __setWidth()
                }
                if (_btnParent.height < _btnText.contentHeight) {
                    _btnParent.height = __setHeightAutoSize()
                } else {
                    _btnParent.height = __setHeight()
                }
            } else if (mAutoSizeMode === autoSizeMode.mGrowAndShrink) {
                _btnParent.width =  __setWidthAutoSize()
                _btnParent.height = __setHeightAutoSize()
            } else {
                mAutoSize = autoSizeMode.mGrowOnly
            }
        } else {
            _btnParent.width = __setWidth()
            _btnParent.height = __setHeight()
        }
    }

    // Set control width if autoSize = true
    function __setWidthAutoSize() {
        var _width = 0
        switch (mTextAlign) {
            case alignment.mTopLeft:
            case alignment.mMiddleLeft:
            case alignment.mBottomLeft:
            case alignment.mTopRight:
            case alignment.mMiddleRight:
            case alignment.mBottomRight:
                _width = _iconImg.width + _btnText.width + mLeftPadding + mRightPadding
                break
            case alignment.mTopCenter:
            case alignment.mMiddleCenter:
            case alignment.mBottomCenter:
                if (_iconImg.width > _btnText.width) {
                    _width = _iconImg.width + mLeftPadding + mRightPadding
                } else {
                    _width = _btnText.width + mLeftPadding + mRightPadding
                }
                break
            default:
                _width = _btnParent.width
                break
        }
        return _width
    }

    // Set control height if autoSize = true
    function __setHeightAutoSize() {
        var _height = 0
        switch (mTextAlign) {
            case alignment.mTopLeft:
            case alignment.mMiddleLeft:
            case alignment.mBottomLeft:
            case alignment.mTopRight:
            case alignment.mMiddleRight:
            case alignment.mBottomRight:
            case alignment.mMiddleCenter:
                if (_iconImg.height > _btnText.height) {
                    _height = _iconImg.height + mTopPadding + mBottomPadding
                } else {
                    _height = _btnText.height + mTopPadding + mBottomPadding
                }
                break
            case alignment.mTopCenter:
            case alignment.mBottomCenter:
                _height = _iconImg.height + _btnText.height + mTopPadding + mBottomPadding
                break
            default:
                _height = _btnParent.height
                break
        }
        return _height
    }
}
