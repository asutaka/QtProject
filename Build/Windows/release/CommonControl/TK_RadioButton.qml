import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

RadioButton {
    id: radioBtn

    //    property	alias	id:                     Not customize   <=> CONTROL LIST: Name
    //    property	alias	enabled:                Not customize   <=> CONTROL LIST: Enabled
    //    property	alias	visible:                Not customize   <=> CONTROL LIST: Visibled
    //    property	alias	checked:                Not customize   <=> CONTROL LIST: Checked
    //    property	alias	anchors.top:            Not customize   <=> CONTROL LIST: Anchors(Top)
    //    property	alias	anchors.bottom:         Not customize   <=> CONTROL LIST: Anchors(Bottom)
    //    property	alias	anchors.right:          Not customize   <=> CONTROL LIST: Anchors(Right)
    //    property	alias	anchors.left:           Not customize   <=> CONTROL LIST: Anchors(Left)
    //    property	alias	x:                      Not customize   <=> CONTROL LIST: Location(x)
    //    property	alias	y:                      Not customize   <=> CONTROL LIST: Location(y)
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
    //    property	var 	mImageKey               Not used        <=> CONTROL LIST: ImageKey
    //    property	var 	mImageList              Not used        <=> CONTROL LIST: ImageList
    //    property	alias	mImageIndex             Not used        <=> CONTROL LIST: ImageIndex

    property    bool        mAutoCheck:             true                                    // <=> CONTROL LIST: AutoCheck
    property    bool        mAutoSize:              false                                   // <=> CONTROL LIST: AutoSize
    property    var         mMaximumSize:           Qt.size(999, 999)                       // <=> CONTROL LIST: MaximumSize
    property    var         mMinimumSize:           Qt.size(0, 0)                           // <=> CONTROL LIST: MinimumSize
    property    bool        mAppearance:            false                                   // <=> CONTROL LIST: Appearance
    property    alias       mBackColor:             backRect.color                          // <=> CONTROL LIST: BackColor
    property    alias       mBackgroundImage:       backImage.source                        // <=> CONTROL LIST: BackgroundImage
    property    alias       mBackgroundImageLayout: backImage.fillMode                      // <=> CONTROL LIST: BackgroundImageLayout
    property    bool        mFlatStyle:             true                                    // <=> CONTROL LIST: FlatStyle
    property    alias       mFont:                  content.font                            // <=> CONTROL LIST: Font
    property    alias       mForeColor:             content.color                           // <=> CONTROL LIST: ForeColor
    property    alias       mText:                  content.text                            // <=> CONTROL LIST: Text
    property    alias       mImage:                 img.source                              // <=> CONTROL LIST: Image
    property    alias       mAutoEllipsis:          content.elide                           // <=> CONTROL LIST: AutoEllipsis
    property    bool        mCausesValidation:      true                                    // <=> CONTROL LIST: CausesValidation
    property    int         mPadding:               0                                       // <=> CONTROL LIST: Padding
    property    int         mCheckAlign:            align.mMiddleLeft                       // <=> CONTROL LIST: CheckAlign
    property    int         mTextAlign:             align.mMiddleRight                      // <=> CONTROL LIST: TextAlign
    property    bool        mRightToLeft:           false                                   // <=> CONTROL LIST: RightToLeft
    property    int         mCursor:                Qt.ArrowCursor                          // <=> CONTROL LIST: Cursor
    property    bool        mUseWaitCursor:         false                                   // <=> CONTROL LIST: UseWaitCursor
    property    int         mTextImageRelation:     textImageRelation.mOverlay              // <=> CONTROL LIST: TextImageRelation
    property    int         mFlatAppearance:        1                                       // <=> CONTROL LIST: FlatAppearance

    property    string      imgRadioOffSrc:         "image://MyProvider/radiobtn_off.png"   // create newly
    property    string      imgRadioOnSrc:          "image://MyProvider/radiobtn_on.png"    // create newly
    property    alias       wrapText:               content.wrapMode                           // create newly
    property    size        mCheckedSize:           Qt.size(20, 20)                         // create new

    signal validating()

    // TextImageRelation Enum
    QtObject {
        id: textImageRelation
        property int mOverlay: 1
        property int mImageAboveText: 2
        property int mTextAboveImage: 3
        property int mImageBeforeText: 4
        property int mTextBeforeImage: 5
    }

    // ALign Enum
    QtObject {
        id: align
        property int mTopLeft: 1
        property int mTopCenter: 2
        property int mTopRight: 3
        property int mMiddleLeft: 4
        property int mMiddleCenter: 5
        property int mMiddleRight: 6
        property int mBottomLeft: 7
        property int mBottomCenter: 8
        property int mBottomRight: 9
    }

    // RadioButton Style
    indicator: Rectangle {
        id: rdbItem
        color: "transparent"

        width: {
            switch(mCheckAlign) {
                case align.mTopLeft:       // Number 1
                case align.mTopRight:      // Number 3
                case align.mMiddleLeft:    // Number 4
                case align.mMiddleRight:   // Number 6
                case align.mBottomLeft:    // Number 7
                case align.mBottomRight:   // Number 9
                    bound.width + rectCont.width + mPadding + 10
                    break
                case align.mTopCenter:     // Number 2
                case align.mBottomCenter:  // Number 8
                case align.mMiddleCenter:  // Number 5
                    bound.width >= rectCont.width ? bound.width + mPadding : rectCont.width + mPadding
                    break
                default:
                    break
            }
        }

        height: {
            switch(mCheckAlign) {
                case align.mMiddleLeft:    // Number 4
                case align.mMiddleRight:   // Number 6
                case align.mTopCenter:     // Number 2
                    bound.height >= rectCont.height ? bound.height + mPadding : rectCont.height + mPadding
                    break
                case align.mTopLeft:       // Number 1
                case align.mTopRight:      // Number 3
                case align.mBottomCenter:  // Number 8
                case align.mMiddleCenter:  // Number 5
                case align.mBottomLeft:    // Number 7
                case align.mBottomRight:   // Number 9
                    bound.height + rectCont.height + mPadding
                    break
                default:
                    break
            }
        }

        Rectangle {
            id: bound
            width: 25
            height: 25
            radius: height/2
            border.color: "gray"
            border.width: 2
            anchors.margins: 5
            color: "transparent"
            visible: mFlatStyle
            z: 2

            Rectangle {
                id: checked
                anchors.fill: parent
                anchors.margins: 5
                radius: height/2
                visible: radioBtn.checked
                color: "#555"
            }

            Image {
                id: indicatorImage
                anchors.fill: parent
                visible: !mFlatStyle
                source: radioBtn.checked ? imgRadioOnSrc : imgRadioOffSrc
            }
        }

        Rectangle {
            id: rectCont
            color: "transparent"

            width: {
                switch (mTextImageRelation) {
                    case textImageRelation.mOverlay:
                    case textImageRelation.mImageAboveText:
                    case textImageRelation.mTextAboveImage:
                        img.width >= content.width ? img.width : content.width
                        break
                    case textImageRelation.mImageBeforeText:
                    case textImageRelation.mTextBeforeImage:
                        img.width + content.width
                        break
                    default:
                        break
                }
            }

            height: {
                switch (mTextImageRelation) {
                    case textImageRelation.mOverlay:
                    case textImageRelation.mImageBeforeText:
                    case textImageRelation.mTextBeforeImage:
                        img.height >= content.height ? img.height : content.height
                        break
                    case textImageRelation.mImageAboveText:
                    case textImageRelation.mTextAboveImage:
                        img.height + content.height
                        break
                    default:
                        break
                }
            }

            Image{
                id: img
            }

            Text {
                id: content
                text: qsTr("ABCXYZ")
                font.pixelSize: 30

                onTextChanged: {
                    if (mCausesValidation) validating()
                }
            }

            Component.onCompleted: {
                switch (mTextImageRelation) {
                    case textImageRelation.mOverlay:
                        content.anchors.left = rectCont.left
                        img.anchors.centerIn = content
                        break
                    case textImageRelation.mImageAboveText:
                        img.anchors.top = rectCont.top
                        content.anchors.top = img.bottom
                        img.anchors.horizontalCenter = rectCont.horizontalCenter
                        content.anchors.horizontalCenter = rectCont.horizontalCenter
                        break
                    case textImageRelation.mTextAboveImage:
                        content.anchors.top = rectCont.top
                        img.anchors.top = content.bottom
                        img.anchors.horizontalCenter = rectCont.horizontalCenter
                        content.anchors.horizontalCenter = rectCont.horizontalCenter
                        break
                    case textImageRelation.mImageBeforeText:
                        img.anchors.left = rectCont.left
                        content.anchors.left = img.right
                        img.anchors.verticalCenter = rectCont.verticalCenter
                        content.anchors.verticalCenter = rectCont.verticalCenter
                        break
                    case textImageRelation.mTextBeforeImage:
                        img.anchors.left = rectCont.left
                        content.anchors.left = img.right
                        img.anchors.verticalCenter = rectCont.verticalCenter
                        content.anchors.verticalCenter = rectCont.verticalCenter
                        break
                    default:
                        break
                }
            }
        }

        Component.onCompleted: {
            __checkAlign(mCheckAlign, bound, rdbItem)
            __textAlign()
        }

        function __checkAlign(_align, _objChilden, _objParent) {
            switch(_align) {
                case align.mTopLeft:       // Number 1
                    _objChilden.anchors.left = _objParent.left
                    _objChilden.anchors.top = _objParent.top
                    break
                case align.mTopCenter:     // Number 2
                    _objChilden.anchors.top = _objParent.top
                    _objChilden.anchors.horizontalCenter = _objParent.horizontalCenter
                    break
                case align.mTopRight:      // Number 3
                    _objChilden.anchors.right = _objParent.right
                    _objChilden.anchors.top = _objParent.top
                    break
                case align.mMiddleLeft:    // Number 4
                    _objChilden.anchors.left = _objParent.left
                    _objChilden.anchors.verticalCenter = _objParent.verticalCenter
                    break
                case align.mMiddleCenter:  // Number 5
                    _objChilden.anchors.verticalCenter = _objParent.verticalCenter
                    _objChilden.anchors.horizontalCenter = _objParent.horizontalCenter
                    break
                case align.mMiddleRight:   // Number 6
                    _objChilden.anchors.right = _objParent.right
                    _objChilden.anchors.verticalCenter = _objParent.verticalCenter
                    break
                case align.mBottomLeft:    // Number 7
                    _objChilden.anchors.left = _objParent.left
                    _objChilden.anchors.bottom = _objParent.bottom
                    break
                case align.mBottomCenter:  // Number 8
                    _objChilden.anchors.horizontalCenter = _objParent.horizontalCenter
                    _objChilden.anchors.bottom = _objParent.bottom
                    break
                case align.mBottomRight:   // Number 9
                    _objChilden.anchors.right = _objParent.right
                    _objChilden.anchors.bottom = _objParent.bottom
                    break
                default:
                    break
            }
        }

        function __textAlign() {
            switch(mTextAlign) {
                case align.mTopLeft:       // Number 1
                    rectCont.anchors.left = (mCheckAlign === align.mTopLeft
                                                || mCheckAlign === align.mMiddleLeft
                                                || mCheckAlign === align.mBottomLeft)
                                            ? bound.right : rdbItem.left
                    rectCont.anchors.top = rdbItem.top
                    break
                case align.mTopCenter:     // Number 2
                    rectCont.anchors.top = (mCheckAlign === align.mTopCenter
                                                || mCheckAlign === align.mTopLeft
                                                || mCheckAlign === align.mTopRight)
                                            ? bound.bottom : rdbItem.top
                    rectCont.anchors.horizontalCenter = rdbItem.horizontalCenter
                    break
                case align.mTopRight:      // Number 3
                    rectCont.anchors.right = (mCheckAlign === align.mTopRight
                                                || mCheckAlign === align.mMiddleRight
                                                || mCheckAlign === align.mBottomRight)
                                            ? bound.left : rdbItem.right
                    rectCont.anchors.top = rdbItem.top
                    break
                case align.mMiddleLeft:    // Number 4
                    rectCont.anchors.left = (mCheckAlign === align.mTopLeft
                                                || mCheckAlign === align.mMiddleLeft
                                                || mCheckAlign === align.mBottomLeft)
                                            ? bound.right : rdbItem.left
                    rectCont.anchors.verticalCenter = rdbItem.verticalCenter
                    break
                case align.mMiddleCenter:  // Number 5
                    rectCont.anchors.centerIn = rdbItem
                    break
                case align.mMiddleRight:   // Number 6
                    rectCont.anchors.right = (mCheckAlign === align.mTopRight
                                                || mCheckAlign === align.mMiddleRight
                                                || mCheckAlign === align.mBottomRight)
                                            ? bound.left : rdbItem.right
                    rectCont.anchors.verticalCenter = rdbItem.verticalCenter
                    break
                case align.mBottomLeft:    // Number 7
                    rectCont.anchors.left = (mCheckAlign === align.mTopLeft
                                                || mCheckAlign === align.mMiddleLeft
                                                || mCheckAlign === align.mBottomLeft)
                                            ? bound.right : rdbItem.left
                    rectCont.anchors.bottom = rdbItem.bottom
                    break
                case align.mBottomCenter:  // Number 8
                    rectCont.anchors.bottom = (mCheckAlign === align.mBottomCenter
                                                || mCheckAlign === align.mBottomLeft
                                                || mCheckAlign === align.mBottomRight)
                                            ? bound.top : rdbItem.bottom
                    rectCont.anchors.horizontalCenter = rdbItem.horizontalCenter
                    break
                case align.mBottomRight:   // Number 9
                    rectCont.anchors.right = (mCheckAlign === align.mTopRight
                                                || mCheckAlign === align.mMiddleRight
                                                || mCheckAlign === align.mBottomRight)
                                            ? bound.left : rdbItem.right
                    rectCont.anchors.bottom = rdbItem.bottom
                    break
                default:
                    break
            }
        }
    }

    // RadionButton Background
    background: Rectangle {
        id: backRect
        anchors.fill: parent

        Image {
            id: backImage
            anchors.fill: parent
        }

        ToolButton {
            id: backButton
            anchors.fill: parent
            visible: mAppearance
        }
    }

    // Set Control Size
    Component.onCompleted: {
        if (mAutoCheck) radioBtn.checked = true

        if (mAutoSize) {
            width = rdbItem.width
            height = rdbItem.height
        } else {
            __controlHeight()
            __controlWidth()
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }

    // Set Control Width If No AutoSize
    function __controlWidth() {
        if (radioBtn.width > mMaximumSize.width) return mMaximumSize.width
        if (radioBtn.width < mMinimumSize.width) return mMinimumSize.width
        return radioBtn.width
    }

    // Set Control Height If No AutoSize
    function __controlHeight() {
        if (radioBtn.height > mMaximumSize.height) return mMaximumSize.height
        if (radioBtn.height < mMinimumSize.height) return mMinimumSize.height
        return radioBtn.height
    }
}
