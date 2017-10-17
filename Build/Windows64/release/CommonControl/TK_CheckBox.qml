import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Item {
    id: checkBox
    //    property	alias	id:                     Not customize   <=> CONTROL LIST: Name
    //    property	alias	enabled:                Not customize   <=> CONTROL LIST: Enabled
    //    property	alias	visible:                Not customize   <=> CONTROL LIST: Visibled
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
    //    property	alias	width:                  Not customize   <=> CONTROL LIST: Size(Width)
    //    property	alias	height:                 Not customize   <=> CONTROL LIST: Size(Height)

    //    property	bool 	mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property	bool	mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property	var 	mModifiers              Not used        <=> CONTROL LIST: Modifiers
    //    property	bool	mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property	int 	mDock                   Not used        <=> CONTROL LIST: Dock
    //    property	var 	mImageKey               Not used        <=> CONTROL LIST: ImageKey
    //    property	var 	mImageList              Not used        <=> CONTROL LIST: ImageList
    //    property	alias	mImageIndex             Not used        <=> CONTROL LIST: ImageIndex

    property    bool        mCausesValidation:      true                                    // <=> CONTROL LIST: CausesValidation
    property    bool        mAutoCheck:             true                                    // <=> CONTROL LIST: AutoCheck
    property    int         mAutoEllipsis:          Text.ElideNone                          // <=> CONTROL LIST: AutoEllipsis
    property    bool        mThreeState:            false                                   // <=> CONTROL LIST: ThreeState
    property    bool        mAutoSize:              true                                    // <=> CONTROL LIST: AutoSize
    property	size        mMaximumSize:           Qt.size(999, 999)                       // <=> CONTROL LIST: MaximumSize
    property	size        mMinimumSize:           Qt.size(0, 0)                           // <=> CONTROL LIST: MinimumSize
    property	int         mPaddingAll:            0                                       //  <=> CONTROL LIST: Padding
    property	int         mPaddingLeft:           0                                       //  <=> CONTROL LIST: Padding
    property	int         mPaddingRight:          0                                       //  <=> CONTROL LIST: Padding
    property	int         mPaddingTop:            0                                       //  <=> CONTROL LIST: Padding
    property	int         mPaddingBottom:         0                                       //  <=> CONTROL LIST: Padding
    property	bool        mAppearance:            appearance.mNormal                      // <=> CONTROL LIST: Appearance
    property	color       mBackColor:             "transparent"                           // <=> CONTROL LIST: BackColor
    property	alias       mBackgroundImage:       backImage.source                        // <=> CONTROL LIST: BackgroundImage
    property	alias       mBackgroundImageLayout: backImage.fillMode                      // <=> CONTROL LIST: BackgroundImageLayout
    property    int         mCheckAlign:            align.mMiddleLeft                       // <=> CONTROL LIST: CheckAlign
    property	bool        mChecked:               false                                   // <=> CONTROL LIST: Checked
    property    int         mCheckState:            Qt.Unchecked                            // <=> CONTROL LIST: CheckState
    property    color       mFlatStyleBorderColor:  "Black"                                 // <=> CONTROL LIST: FlatAppearance
    property    int         mFlatStyleBorderSize:   2                                       // <=> CONTROL LIST: FlatAppearance
    property    color       mFlatStyleCheckedBackColor:     "white"                         // <=> CONTROL LIST: FlatAppearance
    property    color       mFlatStyleMouseDownBackColor:   "white"                         // <=> CONTROL LIST: FlatAppearance
    property    color       mFlatStyleMouseOverBackColor:   "lightgrey"                     // <=> CONTROL LIST: FlatAppearance
    property    color       mFlatStyleBackColor:            "white"                         // <=> CONTROL LIST: FlatAppearance+α
    property	int         mFlatStyle:             flatStyle.mFlat                         // <=> CONTROL LIST: FlatStyle
    property	font        mFont:                  Qt.font({pixelSize: 25})                // <=> CONTROL LIST: Font
    property	color       mForeColor:             "black"                                 // <=> CONTROL LIST: ForeColor
    property	alias       mImage:                 img.source                              // <=> CONTROL LIST: Image
    property    int         mImageAlign:            align.mMiddleCenter                      // <=> CONTROL LIST: ImageAlign
    property	bool        mRightToLeft:           false                                   // <=> CONTROL LIST: RightToLeft
    property    int         mTextAlign:             align.mMiddleCenter                     // <=> CONTROL LIST: TextAlign
    property    int         mTextImageRelation:     textImageRelation.mOverlay              // <=> CONTROL LIST: TextImageRelation
    property    int         mCursor:                Qt.ArrowCursor                          // <=> CONTROL LIST: Cursor
    property    bool        mUseWaitCursor:         false                                   // <=> CONTROL LIST: UseWaitCursor
    property	string      mText:                  "Check Box"                             // <=> CONTROL LIST: Text
    property    int         wrapText:               Text.NoWrap                             // create newly
    property    size        checkBoxSize:           Qt.size(25,25)                          // create newly

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

    // FlatStyle Enum
    QtObject {
        id: flatStyle
        property int mFlat: 0
        property int mPopup: 1
        property int mStandard: 2
        property int mSystem: 3
    }

    // Appearance Enum
    QtObject{
        id: appearance
        property int mButton: 0
        property int mNormal: 1
    }

    // Button Appearance
    TK_Button{
        id:appearanceButton
        mAutoSize: true
        anchors.left: parent.left
        anchors.top: parent.top
        mPadding: mPaddingAll
        mLeftPadding: mPaddingLeft
        mRightPadding: mPaddingRight
        mTopPadding: mPaddingTop
        mBottomPadding: mPaddingBottom
        mText: checkBox.mText
        mBackColor: mBackColor
        visible: mAppearance == appearance.mButton
    }

    // Normal Appearance
    Rectangle{
        id:appearanceNormal
        anchors.left: parent.left
        anchors.top: parent.top
        visible: mAppearance == appearance.mNormal
        color: mBackColor

        Image {
            id: backImage
            anchors.fill: parent
        }

        width: {
            switch(mCheckAlign) {
                case align.mTopLeft:       // Number 1
                case align.mTopRight:      // Number 3
                case align.mMiddleLeft:    // Number 4
                case align.mMiddleRight:   // Number 6
                case align.mBottomLeft:    // Number 7
                case align.mBottomRight:   // Number 9
                    if(mPaddingAll == 0){
                        flame.width + textImage.width + 10 + mPaddingLeft + mPaddingRight
                    }else{
                        flame.width + textImage.width + 10 + (mPaddingAll * 2)
                    }
                    break
                case align.mTopCenter:     // Number 2
                case align.mBottomCenter:  // Number 8
                case align.mMiddleCenter:  // Number 5
                    if(mPaddingAll == 0){
                        if(flame.width >= textImage.width){
                            flame.width + mPaddingLeft + mPaddingRight
                        }else{
                            textImage.width + mPaddingLeft + mPaddingRight
                        }
                    }else{
                        if(flame.width >= textImage.width){
                            flame.width + (mPaddingAll * 2)
                        }else{
                            textImage.width + (mPaddingAll * 2)
                        }
                    }
                    break
                default:
                    break
            }
        }

        height: {
            switch(mCheckAlign) {
                case align.mTopLeft:       // Number 1
                case align.mTopRight:      // Number 3
                case align.mMiddleLeft:    // Number 4
                case align.mMiddleCenter:  // Number 5
                case align.mMiddleRight:   // Number 6
                case align.mBottomLeft:    // Number 7
                case align.mBottomRight:   // Number 9
                    if(mPaddingAll == 0){
                        if(flame.height >= textImage.height){
                            flame.height + mPaddingTop + mPaddingBottom
                        }else{
                            textImage.height + mPaddingTop + mPaddingBottom
                        }
                    }else{
                        if(flame.height >= textImage.height){
                            flame.height + (mPaddingAll * 2)
                        }else{
                            textImage.height + (mPaddingAll * 2)
                        }
                    }
                    break
                case align.mTopCenter:     // Number 2
                case align.mBottomCenter:  // Number 8
                    if(mPaddingAll == 0){
                        flame.height + textImage.height + mPaddingTop + mPaddingBottom
                    }else{
                        flame.height + textImage.height + (mPaddingAll * 2)
                    }
                    break
                default:
                    break
            }
        }

        Rectangle{
            id: makeMargin
            anchors.fill: parent
            anchors.margins: mPaddingAll
            anchors.leftMargin: mPaddingLeft
            anchors.rightMargin: mPaddingRight
            anchors.topMargin: mPaddingTop
            anchors.bottomMargin: mPaddingBottom
            color: "transparent"

            Rectangle{
                id: flame
                width: checkBoxSize.width
                height: checkBoxSize.height
                anchors.margins: 2
                color:if(mFlatStyle == flatStyle.mFlat){
                          mFlatStyleBackColor
                      }else{
                          "white"
                      }
                border.color: if(mFlatStyle == flatStyle.mFlat){
                                  mFlatStyleBorderColor
                              }else{
                                  "Black"
                              }
                border.width: if(mFlatStyle == flatStyle.mFlat){
                                  mFlatStyleBorderSize
                              }else{
                                  2
                              }
                visible: mFlatStyle != flatStyle.mSystem

                Rectangle{
                    id: flameFor3D
                    anchors.fill: parent
                    anchors.margins: 2
                    color: "darkgrey"
                    border.color: "lightgrey"
                    border.width: 2
                    visible: mFlatStyle == flatStyle.mStandard
                }

                Text{
                    id: check
                    anchors.centerIn: parent
                    anchors.margins: 5
                    text: qsTr("✓")
                    font.pixelSize: parent.width
                    visible: (((checkBox.mThreeState == false) && (checkBox.mChecked))|| ((checkBox.mThreeState == true)  && (checkBox.mCheckState == Qt.Checked)))
                }

                Text{
                    id: bar
                    anchors.centerIn: parent
                    anchors.margins: 5
                    text: qsTr("-")
                    font.pixelSize: parent.width
                    visible: ((checkBox.mThreeState == true) && (checkBox.mCheckState == Qt.PartiallyChecked))
                }

                // mFlatStyle:mSystem
                CheckBox{
                    id:mSystemCheckBox
                    visible: mFlatStyle == flatStyle.mSystem
                }
            }

            Rectangle{
                id:textImage
                color: "transparent"

                width: {
                    switch (mTextImageRelation) {
                    case textImageRelation.mOverlay:
                    case textImageRelation.mImageAboveText:
                    case textImageRelation.mTextAboveImage:
                        img.width >= name.width ? img.width : name.width
                        break
                    case textImageRelation.mImageBeforeText:
                    case textImageRelation.mTextBeforeImage:
                        img.width + name.width
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
                        img.height >= name.height ? img.height : name.height
                        break
                    case textImageRelation.mImageAboveText:
                    case textImageRelation.mTextAboveImage:
                        img.height + name.height
                        break
                    default:
                        break
                    }
                }

                Image{
                    id: img
                    visible: true
                }

                Text{
                    id: name
                    text:mText
                    font:mFont
                    elide:mAutoEllipsis
                }

                Component.onCompleted: {
                    switch (mTextImageRelation) {
                    case textImageRelation.mOverlay:
                        break
                    case textImageRelation.mImageAboveText:
                        img.anchors.top = textImage.top
                        name.anchors.top = img.bottom
                        break
                    case textImageRelation.mTextAboveImage:
                        name.anchors.top = textImage.top
                        img.anchors.top = name.bottom
                        break
                    case textImageRelation.mImageBeforeText:
                        img.anchors.left = textImage.left
                        name.anchors.left = img.right
                        break
                    case textImageRelation.mTextBeforeImage:
                        name.anchors.left = textImage.left
                        img.anchors.left = name.right
                        break
                    default:
                        break
                    }

                    //　Reflect mImageAlign
                    switch(mImageAlign){
                    case align.mTopLeft:       // Number 1
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            img.anchors.left = textImage.left
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            img.anchors.top = textImage.top
                            break
                        default:
                            break
                        }
                        break
                    case align.mTopCenter:     // Number 2
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            img.anchors.horizontalCenter = textImage.horizontalCenter
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            img.anchors.top = textImage.top
                            break
                        default:
                            break
                        }
                        break
                    case align.mTopRight:      // Number 3
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            img.anchors.right = textImage.right
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            img.anchors.top = textImage.top
                            break
                        default:
                            break
                        }
                        break
                    case align.mMiddleLeft:    // Number 4
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            img.anchors.left = textImage.left
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            img.anchors.verticalCenter  = textImage.verticalCenter
                            break
                        default:
                            break
                        }
                        break
                    case align.mMiddleCenter:  // Number 5
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            img.anchors.horizontalCenter = textImage.horizontalCenter
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            img.anchors.verticalCenter = textImage.verticalCenter
                            break
                        default:
                            break
                        }
                        break
                    case align.mMiddleRight:   // Number 6
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            img.anchors.right = textImage.right
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            img.anchors.verticalCenter = textImage.verticalCenter
                            break
                        default:
                            break
                        }
                        break
                    case align.mBottomLeft:    // Number 7
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            img.anchors.left = textImage.left
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            img.anchors.bottom = textImage.bottom
                            break
                        default:
                            break
                        }
                        break

                    case align.mBottomCenter:  // Number 8
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            img.anchors.horizontalCenter = textImage.horizontalCenter
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            img.anchors.bottom = textImage.bottom
                            break
                        default:
                            break
                        }
                        break

                    case align.mBottomRight:   // Number 9
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            img.anchors.right = textImage.right
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            img.anchors.bottom = textImage.bottom
                            break
                        default:
                            break
                        }
                        break
                    default:
                        break
                    }

                    // Reflect mTextAlign
                    switch(mTextAlign){
                    case align.mTopLeft:       // Number 1
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            name.anchors.left = textImage.left
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            name.anchors.top = textImage.top
                            break
                        default:
                            break
                        }
                        break
                    case align.mTopCenter:     // Number 2
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            name.anchors.horizontalCenter = textImage.horizontalCenter
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            name.anchors.top = textImage.top
                            break
                        default:
                            break
                        }
                        break
                    case align.mTopRight:      // Number 3
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            name.anchors.right = textImage.right
                            textImage.color = "red"
                            console.log(name.anchors.right)
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            name.anchors.top = textImage.top
                            break
                        default:
                            break
                        }
                        break
                    case align.mMiddleLeft:    // Number 4
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            name.anchors.left = textImage.left
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            name.anchors.verticalCenter  = textImage.verticalCenter
                            break
                        default:
                            break
                        }
                        break
                    case align.mMiddleCenter:  // Number 5
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            name.anchors.horizontalCenter = textImage.horizontalCenter
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            name.anchors.verticalCenter = textImage.verticalCenter
                            break
                        default:
                            break
                        }
                        break
                    case align.mMiddleRight:   // Number 6
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            name.anchors.right = textImage.right
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            name.anchors.verticalCenter = textImage.verticalCenter
                            break
                        default:
                            break
                        }
                        break
                    case align.mBottomLeft:    // Number 7
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            name.anchors.left = textImage.left
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            name.anchors.bottom = textImage.bottom
                            break
                        default:
                            break
                        }
                        break
                    case align.mBottomCenter:  // Number 8
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            name.anchors.horizontalCenter = textImage.horizontalCenter
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            name.anchors.bottom = textImage.bottom
                            break
                        default:
                            break
                        }
                        break
                    case align.mBottomRight:   // Number 9
                        switch(mTextImageRelation){
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageAboveText:
                        case textImageRelation.mTextAboveImage:
                            name.anchors.right = textImage.right
                            break
                        case textImageRelation.mOverlay:
                        case textImageRelation.mImageBeforeText:
                        case textImageRelation.mTextBeforeImage:
                            name.anchors.bottom = textImage.bottom
                            break
                        default:
                            break
                        }
                        break
                    default:
                        break
                    }
                }
            }
        }

        Component.onCompleted: {
            // Reflect mCheckAlign
            __checkAlign(mCheckAlign, flame, makeMargin)
        }

        function __checkAlign(_align, _objCheckBox, _objParent) {
            switch(_align) {
                case align.mTopLeft:       // Number 1
                    _objCheckBox.anchors.left = _objParent.left
                    _objCheckBox.anchors.top = _objParent.top
                    break
                case align.mTopCenter:     // Number 2
                    _objCheckBox.anchors.top = _objParent.top
                    _objCheckBox.anchors.horizontalCenter = _objParent.horizontalCenter
                    break
                case align.mTopRight:      // Number 3
                    _objCheckBox.anchors.right = _objParent.right
                    _objCheckBox.anchors.top = _objParent.top
                    break
                case align.mMiddleLeft:    // Number 4
                    _objCheckBox.anchors.left = _objParent.left
                    _objCheckBox.anchors.verticalCenter = _objParent.verticalCenter
                    break
                case align.mMiddleCenter:  // Number 5
                    _objCheckBox.anchors.verticalCenter = _objParent.verticalCenter
                    _objCheckBox.anchors.horizontalCenter = _objParent.horizontalCenter
                    break
                case align.mMiddleRight:   // Number 6
                    _objCheckBox.anchors.right = _objParent.right
                    _objCheckBox.anchors.verticalCenter = _objParent.verticalCenter
                    break
                case align.mBottomLeft:    // Number 7
                    _objCheckBox.anchors.left = _objParent.left
                    _objCheckBox.anchors.bottom = _objParent.bottom
                    break
                case align.mBottomCenter:  // Number 8
                    _objCheckBox.anchors.horizontalCenter = _objParent.horizontalCenter
                    _objCheckBox.anchors.bottom = _objParent.bottom
                    break
                case align.mBottomRight:   // Number 9
                    _objCheckBox.anchors.right = _objParent.right
                    _objCheckBox.anchors.bottom = _objParent.bottom
                    break
                default:
                    break
            }
        }
    }

    // Reflect mAutoSize, mRightToLeft, mCheckAlign
    Component.onCompleted: {
        if (mAutoSize) {
            width = appearanceNormal.width
            height = appearanceNormal.height
        } else {
            height = __controlHeight()
            width = __controlWidth()
        }

        if(mRightToLeft) {
            mCheckAlign = align.mMiddleRight
        }

        switch (mCheckAlign){
        case align.mTopLeft:       // Number 1
        case align.mMiddleLeft:    // Number 4
        case align.mBottomLeft:    // Number 7
            textImage.anchors.left = flame.right
            break
        case align.mTopRight:      // Number 3
        case align.mMiddleRight:   // Number 6
        case align.mBottomRight:   // Number 9
            textImage.anchors.right = flame.left
            break
        case align.mTopCenter:     // Number 2
            textImage.anchors.top = flame.bottom
            break
        case align.mMiddleCenter:  // Number 5
            textImage.anchors.verticalCenter = flame.verticalCenter
            break
        case align.mBottomCenter:  // Number 8
            textImage.anchors.bottom = flame.top
            break
        default:
            break
        }
    }

    // Set Control Width If No AutoSize
    function __controlWidth() {
        if (checkBox.width > mMaximumSize.width) return mMaximumSize.width
        if (checkBox.width < mMinimumSize.width) return mMinimumSize.width
        return checkBox.width
    }

    // Set Control Height If No AutoSize
    function __controlHeight() {
        if (checkBox.height > mMaximumSize.height) return mMaximumSize.height
        if (checkBox.height < mMinimumSize.height) return mMinimumSize.height
        return checkBox.height
    }

    MouseArea {
        id: checkBoxMouseArea
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        width: checkBox.width
        height: checkBox.height
        hoverEnabled: true

        // The cursor moved over the control
        onEntered: {
            // Change appearance
            if(mFlatStyle == flatStyle.mFlat){
                flame.color = mFlatStyleMouseOverBackColor
            }else if(mFlatStyle == flatStyle.mPopup){
                flameFor3D.visible = true
                flameFor3D.color = "white"
            }else if(mFlatStyle == flatStyle.mStandard){
                flameFor3D.color = "orchid"
            }
        }

        //　The cursor moved from over the control
        onExited: {
            // Change appearance
            if(mFlatStyle == flatStyle.mFlat){
                if((checkBox.mThreeState == false) && (checkBox.mChecked)){
                    flame.color = mFlatStyleCheckedBackColor
                }else{
                    flame.color = mFlatStyleBackColor
                }
            }else if(mFlatStyle == flatStyle.mPopup){
                flameFor3D.visible = false
                flameFor3D.color = "red"
            }else if(mFlatStyle == flatStyle.mStandard){
                flameFor3D.color = "whitesmoke"
            }
        }

        // Control pressed
        onPressed: {
            // Change appearance
            if(mAppearance == appearance.mNormal){
                if(mFlatStyle == flatStyle.mFlat){
                    flame.color = mFlatStyleMouseDownBackColor
                }else if(mFlatStyle == flatStyle.mPopup){
                    flameFor3D.color = "orange"
                }else if(mFlatStyle == flatStyle.mStandard){
                    flameFor3D.color = "mediumvioletred"
                }
            }
        }

        // Control Reseased
        onReleased: {
            // Change appearance
            if(mAppearance == appearance.mNormal){
                if(mFlatStyle == flatStyle.mFlat){
                    flame.color = mFlatStyleMouseOverBackColor
                }else if(mFlatStyle == flatStyle.mPopup){
                    flameFor3D.color = "white"
                }else if(mFlatStyle == flatStyle.mStandard){
                    flameFor3D.color = "orchid"
                }
            }

            // Change state
            if(mAutoCheck){
                // mAppearance:mNormal
                if(mAppearance == appearance.mNormal){
                    //mThreeState:true
                    if(mThreeState == true){
                        if(checkBox.mCheckState == Qt.Unchecked){
                            checkBox.mCheckState = Qt.Checked
                        }else if(checkBox.mCheckState == Qt.Checked){
                            checkBox.mCheckState = Qt.PartiallyChecked
                        }else{
                            checkBox.mCheckState = Qt.Unchecked
                        }
                    //mThreeState:false
                    }else{
                        if(checkBox.mChecked == true){
                            checkBox.mChecked = false
                        }else{
                            checkBox.mChecked = true
                        }
                    }
                // mAppearance:mButton
                }else{
                    if(checkBox.mChecked == true){
                        checkBox.mChecked = false
                        appearanceButton.mBackColor = "whitesmoke"
                    }else{
                        checkBox.mChecked = true
                        appearanceButton.mBackColor = "lightgrey"
                    }
                }
            }

            if (mCausesValidation) validating()
        }
    }
}
