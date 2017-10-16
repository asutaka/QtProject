import QtQuick 2.7
import QtQuick.Controls 1.4

ScrollView {

    id : panel
    horizontalScrollBarPolicy: mAutoScroll
    verticalScrollBarPolicy: mAutoScroll

    //    property	alias		id                              Not Customize <=> CONTROL LIST: Name
    //    property	alias		mEnabled                        Not Customize <=> CONTROL LIST: Enabled
    //    property	alias		mVisible                        Not Customize <=> CONTROL LIST: Visible
    //    property	alias       anchors.top:                    Not customize   <=> CONTROL LIST: Anchors(Top)
    //    property	alias       anchors.bottom:                 Not customize   <=> CONTROL LIST: Anchors(Bottom)
    //    property	alias       anchors.right:                  Not customize   <=> CONTROL LIST: Anchors(Right)
    //    property	alias       anchors.left:                   Not customize   <=> CONTROL LIST: Anchors(Left)
    //    property	alias       anchors.margins:                Not customize   <=> CONTROL LIST: Margin(All)
    //    property	alias       anchors.leftMargin:             Not customize   <=> CONTROL LIST: Margin(Left)
    //    property	alias       anchors.rightMargin:            Not customize   <=> CONTROL LIST: Margin(Right)
    //    property	alias       anchors.topMargin:              Not customize   <=> CONTROL LIST: Margin(Top)
    //    property	alias       anchors.bottomMargin:           Not customize   <=> CONTROL LIST: Margin(Bottom)
    //    property	alias       x:                              Not customize   <=> CONTROL LIST: Location(x)
    //    property	alias       y:                              Not customize   <=> CONTROL LIST: Location(y)
    //    property	alias       width:                          Not customize   <=> CONTROL LIST: Size(Width)
    //    property	alias       height:                         Not customize   <=> CONTROL LIST: Size(Height)
    //    property	int         mPadding                        Not customize   <=> CONTROL LIST: Padding

    //    property	alias		mGeneratemember                 Not Used <=> CONTROL LIST: GenerateMember
    //    property	alias		mLocked                         Not Used <=> CONTROL LIST: Locked
    //    property	alias		mModifiers                      Not Used <=> CONTROL LIST: Modifiers
    //    property	alias		mAllowDrop                      Not Used <=> CONTROL LIST: AllowDrop
    //    property	alias		mDock                           Not Used <=> CONTROL LIST: Dock

    property	size		mMaximumSize:               Qt.size(1000, 800)          // <=> CONTROL LIST: MaximumSize
    property	size		mMinimumSize:               Qt.size(0, 0)               // <=> CONTROL LIST: MinimumSize
    property	bool		mAutoSize:                  false                       // <=> CONTROL LIST: AutoSize
    property	color		mBackColor:                 "#FFFFCC"                   // <=> CONTROL LIST: BackColor
    property	string		mBackgroundImage                                        // <=> CONTROL LIST: BackgroundImage
    property	alias       mBackgroundImageLayout:     imgBackground.fillMode      // <=> CONTROL LIST: BackgroundImageLayout
    property	color       mBorderColor:               "#CD853F"                   // <=> CONTROL LIST: BorderStyle
    property	int         mBorderWidth:               2                           // <=> CONTROL LIST: BorderStyle
    property	font		mFont                                                   // <=> CONTROL LIST: Font
    property	color		mForeColor:                 "green"                     // <=> CONTROL LIST: ForeColor
    property	bool		mRightToLeft:               false                       // <=> CONTROL LIST: RightToLeft    // Draw right-to-left for RTL language
    property	int         mAutoScroll:                Qt.ScrollBarAsNeeded        // <=> CONTROL LIST: AutoScroll--AsNeeded
    property    int         mX_Autosize:                0                           // Create new
    property    int         mY_Autosize:                0                           // Create new
    property	size		mAutoScrollMinSize:         Qt.size(0, 0)               // <=> CONTROL LIST: AutoScrollMinSize
    property    int         mCursor:                    Qt.ArrowCursor              // <=> CONTROL LIST: Cursor
    property	bool        mUseWaitCursor:             false                       // <=> CONTROL LIST: UseWaitCursor
    property    bool        mCausesValidation:          false                       // <=> CONTROL LIST: CausesValidation
    property	int         mAutoSizeMode                                           // <=> CONTROL LIST: AutoSizeMode
    property	int         mAutoScrollMargin                                       // <=> CONTROL LIST: AutoScrollMargin

    signal validating()
    width: 300
    height: 200

    contentItem: Rectangle {
        id: backRect
        width: parent.width
        height: parent.height
        color: mBackColor
        border.width: mBorderWidth
        border.color: mBorderColor

        Image {
            anchors.fill: parent
            id: imgBackground
            source: mBackgroundImage
        }
        Text{
            id:textDefault
        }
        Label{
            id: labelDefault
        }
        Component.onCompleted: {

        }
    }

    Component.onCompleted: {
        if(mCausesValidation){
            validating()
        }

    }

    function addControl(obj)
    {
        //Forecolor
        if(panel.mForeColor !== labelDefault.color || panel.mForeColor !== textDefault.color)
        {
            if (Qt.colorEqual(obj.color,labelDefault.color))
            {
                obj.color = panel.mForeColor;
            }
            else if(Qt.colorEqual(obj.color,textDefault.color))
            {
                obj.color = panel.mForeColor;
            }
        }

        // mFont
        try{
            if(obj.font === textDefault.font || obj.font === labelDefault.font){
                obj.font = mFont;
            }
        }
        catch(notProperty_Font){

        }

        //Initialization size panel in case autoSize
        if(panel.mX_Autosize <obj.x + obj.width)
        {
            panel.mX_Autosize = obj.x + obj.width;
        }
        if(panel.mY_Autosize < obj.y + obj.height)
        {
            panel.mY_Autosize = obj.y + obj.height;
        }

        // Property AutoSize
        if(panel.mAutoSize) {
            mAutoScroll = Qt.ScrollBarAlwaysOff
            if(panel.mX_Autosize > panel.width)
            {
                panel.width = panel.mX_Autosize + 10;
            }
            if(panel.mY_Autosize > panel.height)
            {
                panel.height = panel.mY_Autosize + 10;
            }
        }
        else{
            mAutoScroll = Qt.ScrollBarAsNeeded
        }

        //Maximumsize
        if(panel.mMaximumSize.width !== 0)
        {
            if(panel.width > panel.mMaximumSize.width)
                panel.width = panel.mMaximumSize.width;
        }
        if(panel.mMaximumSize.height !== 0)
        {
            if(panel.height > panel.mMaximumSize.height)
                panel.height = panel.mMaximumSize.height;
        }
        //Minimumsize
        if(panel.mMinimumSize.width !== 0)
        {
            if(panel.width < panel.mMinimumSize.width)
                panel.width = panel.mMinimumSize.width;
        }
        if(panel.mMinimumSize.height !== 0)
        {
            if(panel.height < panel.mMinimumSize.height)
                panel.height = panel.mMinimumSize.height;
        }
    }
    MouseArea{
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }

}

