import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Rectangle{
    id: main

    //    property	alias		id                              Not Customize <=> CONTROL LIST: Name
    //    property	alias       anchors.top:                    Not customize   <=> CONTROL LIST: Anchors(Top)
    //    property	alias       anchors.bottom:                 Not customize   <=> CONTROL LIST: Anchors(Bottom)
    //    property	alias       anchors.right:                  Not customize   <=> CONTROL LIST: Anchors(Right)
    //    property	alias       anchors.left:                   Not customize   <=> CONTROL LIST: Anchors(Left)
    //    property	alias       anchors.margins:                Not customize   <=> CONTROL LIST: Margin(All)
    //    property	alias       anchors.leftMargin:             Not customize   <=> CONTROL LIST: Margin(Left)
    //    property	alias       anchors.rightMargin:            Not customize   <=> CONTROL LIST: Margin(Right)
    //    property	alias       anchors.topMargin:              Not customize   <=> CONTROL LIST: Margin(Top)
    //    property	alias       anchors.bottomMargin:           Not customize   <=> CONTROL LIST: Margin(Bottom)

    //    property	alias		mGeneratemember                 Not Used <=> CONTROL LIST: GenerateMember
    //    property	alias		mLocked                         Not Used <=> CONTROL LIST: Locked
    //    property	alias		mModifiers                      Not Used <=> CONTROL LIST: Modifiers
    //    property	alias		mAllowDrop                      Not Used <=> CONTROL LIST: AllowDrop
    //    property	alias		mDock                           Not Used <=> CONTROL LIST: Dock

    property    alias       mX:                         main.x                      // <=> CONTROL LIST: Location.X
    property    alias       mY:                         main.y                      // <=> CONTROL LIST: Location.Y
    property    alias       mWidth:                     main.width                  // <=> CONTROL LIST: Size.width
    property    alias       mHeight:                    main.height                 // <=> CONTROL LIST: Size.height
    property    alias       mEnabled:                   main.enabled                // <=> CONTROL LIST: Enabled
    property    alias       mVisible:                   main.visible                // <=> CONTROL LIST: Visible
    property	color		mBackColor:                 "#f0f0f0"                   // <=> CONTROL LIST: BackColor
    property	color       mBorderColor:               "#CD853F"                   // <=> CONTROL LIST: BorderStyle
    property	int         mBorderWidth:               0                           // <=> CONTROL LIST: BorderStyle
    property	alias		mBackgroundImage:           imgBackground.source        // <=> CONTROL LIST: BackgroundImage
    property	alias       mBackgroundImageLayout:     imgBackground.fillMode      // <=> CONTROL LIST: BackgroundImageLayout
    property    int         mScrollBarVPolicy:          Qt.ScrollBarAsNeeded        // <=> CONTROL LIST: AutoScroll
    property    int         mScrollBarHPolicy:          Qt.ScrollBarAsNeeded        // <=> CONTROL LIST: AutoScroll
    property	font		mFont                                                   // <=> CONTROL LIST: Font
    property	color		mForeColor:                 labelDefault.color          // <=> CONTROL LIST: ForeColor
    property    int         mPadding:                   0                           // <=> CONTROL LIST: Padding
    property    int         mLeftPadding:               0                           // <=> CONTROL LIST: Padding(Left)
    property    int         mRightPadding:              0                           // <=> CONTROL LIST: Padding(Right)
    property    int         mTopPadding:                0                           // <=> CONTROL LIST: Padding(Top)
    property    int         mBottomPadding:             0                           // <=> CONTROL LIST: Padding(Bottom)
    property	size		mMaximumSize:               Qt.size(0, 0)               // <=> CONTROL LIST: MaximumSize
    property	size		mMinimumSize:               Qt.size(0, 0)               // <=> CONTROL LIST: MinimumSize
    property	bool		mRightToLeft:               false                       // <=> CONTROL LIST: RightToLeft    // Draw right-to-left for RTL language
    property	bool		mAutoSize:                  false                       // <=> CONTROL LIST: AutoSize
    property	bool        mAutoSizeMode:              objAutoSizeMode.mGrowOnly   // <=> CONTROL LIST: AutoSizeMode
    property	size        mAutoScrollMargin:          Qt.size(0, 0)               // <=> CONTROL LIST: AutoScrollMargin
    property	size		mAutoScrollMinSize:         Qt.size(0, 0)               // <=> CONTROL LIST: AutoScrollMinSize
    property    int         mCursor:                    Qt.ArrowCursor              // <=> CONTROL LIST: Cursor
    property	bool        mUseWaitCursor:             false                       // <=> CONTROL LIST: UseWaitCursor
    property    bool        mCausesValidation:          false                       // <=> CONTROL LIST: CausesValidation

    signal validating()

    width: 300
    height: 200
    color: mBackColor
    border.color: mBorderColor
    border.width: mBorderWidth

    Image {
        id: imgBackground
        anchors.fill: parent
    }

    TK_ScrollView {
        id: scroll
        clip: true
        anchors.fill: parent
        horizontalScrollBarPolicy: mScrollBarHPolicy
        verticalScrollBarPolicy: mScrollBarVPolicy

        Rectangle {
            id: rectPadding
            width: childrenRect.width + getValue(mPadding,mLeftPadding) +getValue(mPadding,mRightPadding)
            height: childrenRect.height + getValue(mPadding,mTopPadding) +getValue(mPadding,mBottomPadding)
            color: 'transparent'
            anchors{
                top: parent.top
                topMargin: getValue(mPadding,mTopPadding)
                left: parent.left
                leftMargin: getValue(mPadding,mLeftPadding)
            }

            Rectangle {
                id: content
                width: childrenRect.width
                height: childrenRect.height
                color: 'transparent'
                Component.onCompleted:{
                    //mAutoScrollMargin
                    if(mAutoScrollMargin.width > 0){
                        content.width += mAutoScrollMargin.width
                    }
                    if(mAutoScrollMargin.height > 0){
                        content.height += mAutoScrollMargin.height
                    }
                    //mAutoScrollMinSize
                    if(mAutoScrollMinSize.width > 0){
                        content.width = (content.width > mAutoScrollMinSize.width)?content.width:mAutoScrollMinSize.width
                    }
                    if(mAutoScrollMinSize.height > 0){
                        content.height = (content.height > mAutoScrollMinSize.height)?content.height:mAutoScrollMinSize.height
                    }
                }
            }
        }
    }

    MouseArea{
        anchors.fill: parent
        propagateComposedEvents: true
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }

    QtObject{
        id: objAutoSizeMode
        property bool mGrowOnly: true
        property bool mGrowAndShrink: false
    }

    Text{
        id:textDefault
    }

    Label{
        id: labelDefault
    }

    Component.onCompleted: {
        if(mCausesValidation){
            validating()
        }
    }

    function addControl(obj){
        //set parent for Children
        obj.parent = content
        //mFont
        try{
            if(obj.font === textDefault.font || obj.font === labelDefault.font){
                obj.font = mFont
            }
        }
        catch(notProperty_Font) {}
        //mForecolor
        try {
            if(mForeColor !== labelDefault.color){
                obj.color = mForeColor
            }
        } catch (error) {}
        //mRightToLeft
        if(mRightToLeft){
            try {
                obj.horizontalAlignment = Text.AlignRight
            } catch (error) {}
        }
        //mAutoSize
        if(mAutoSize){
            if(mAutoSizeMode === objAutoSizeMode.mGrowOnly){
                main.width = (main.width<rectPadding.width)?rectPadding.width:main.width
                main.height = (main.height<rectPadding.height)?rectPadding.height:main.height
            }
            else {
                main.width = rectPadding.width
                main.height = rectPadding.height
            }
            scroll.verticalScrollBarPolicy = Qt.ScrollBarAlwaysOff
            scroll.horizontalScrollBarPolicy = Qt.ScrollBarAlwaysOff
        }

        //Maximumsize
        if(mMaximumSize.width !== 0){
            main.width = (main.width > mMaximumSize.width)?mMaximumSize.width:main.width
        }
        if(mMaximumSize.height !== 0){
            main.height = (main.height > mMaximumSize.height)?mMaximumSize.height:main.height
        }
        //Minimumsize
        if(mMinimumSize.width !== 0){
            main.width = (main.width < mMinimumSize.width)?mMinimumSize.width:main.width
        }
        if(mMinimumSize.height !== 0){
            main.height = (main.height < mMinimumSize.height)?mMinimumSize.height:main.height
        }
    }

    function getValue(obj1,obj2){
        return (obj1>obj2)?obj1:obj2
    }
}
