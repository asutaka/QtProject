import QtQuick 2.7
import QtQuick.Controls 2.0

GroupBox {
    id:groupbox

    //  property    alias id:                                           Not Customize <=> CONTROL LIST: Name
    //  property    alias anchors{left,top,right,bottom}                Not Customize <=> Anchor{Top,Left,Right,Bottom}
    //  property    alias anchors{margins,leftMargin,topMargin,rightMargin,bottomMargin} Not Customize <=> Margin{All,Left,Top,Right,Bottom}

    //  property    bool        mGenerateMember:                        Not Used <=> CONTROL LIST: GenerateMember
    //  property    bool        mLocked:            false               Not Used <=> CONTROL LIST: Locked
    //  property    int         mModifiers:         0                   Not Used <=> CONTROL LIST: Modifiers
    //  property    string      mImeMode:                               Not Used <=> CONTROL LIST: ImeMode
    //  property    int         mDock:                                  Not Used <=> CONTROL LIST: Dock

    property    alias       mEnabled:               groupbox.enabled            // <=> CONTROL LIST: Enabled
    property    alias       mVisible:               groupbox.visible            // <=> CONTROL LIST: Visible
    property    bool        mAutoSize:              false                       // <=> CONTROL LIST: AutoSize
    property    bool        mAutoSizeMode:          false                       // <=> CONTROL LIST: AutoSizeMode             //  GrowOnly:EnumControl.AUTOSIZE_MODE_GROW_ONLY, GrowAndShrink:EnumControl.AUTOSIZE_MODE_GROW_AND_SHRINK
    property    alias       mX:                     groupbox.x                  // <=> CONTROL LIST: Location.X
    property    alias       mY:                     groupbox.y                  // <=> CONTROL LIST: Location.Y
    property    size        mMaximumSize:           Qt.size(0,0)                // <=> CONTROL LIST: MaximumSize
    property    size        mMinimumSize:           Qt.size(0,0)                // <=> CONTROL LIST: MinimumSize
    property    alias       mWidth:                 groupbox.width              // <=> CONTROL LIST: Size.width
    property    alias       mHeight:                groupbox.height             // <=> CONTROL LIST: Size.height
    property    string      mBackColor:             "#f0f0f0"                   // <=> CONTROL LIST: BackColor
    property    alias       mBackgroundImage:       backGroundImage.source      // <=> CONTROL LIST: BackgroundImage
    property    alias       mBackgroundImageLayout: backGroundImage.fillMode    // <=> CONTROL LIST: BackgroundImageLayout
    property    string      mFont:                  lbl.font                    // <=> CONTROL LIST: Font
    property    color       mForeColor:             lbl.color                   // <=> CONTROL LIST: ForeColor
    property    bool        mRightToLeft:           false                       // <=> CONTROL LIST: RightToLeft
    property    string      mText:                  "GroupBox"                  // <=> CONTROL LIST: Text
    property    int         mCursor:                Qt.ArrowCursor              // <=> CONTROL LIST: Cursor
    property    bool        mUseWaitCursor:         false                       // <=> CONTROL LIST: UseWaitCursor
    property    int         mFlatStyle:             flatStyle.mPopup            // <=> CONTROL LIST: FlatStyle
    property    bool        mCausesValidation:      true                        // <=> CONTROL LIST: CausesValidation
    property    int         mPadding:               0                           // <=> CONTROL LIST: Padding
    property    int         mLeftPadding:           0                           // <=> CONTROL LIST: Padding(Left)
    property    int         mRightPadding:          0                           // <=> CONTROL LIST: Padding(Right)
    property    int         mTopPadding:            20                          // <=> CONTROL LIST: Padding(Top)
    property    int         mBottomPadding:         0                           // <=> CONTROL LIST: Padding(Bottom)

    property    int         mRadius:                5                           // Create new
    property    int         mBorderWidth:           2                           // Create new
    property    int         mPaddingTitle:          5                           // Create new

    signal validating()

    clip:true
    title: groupbox.mText
    font: groupbox.mFont

    padding: mPadding
    leftPadding: mLeftPadding
    rightPadding: mRightPadding
    topPadding: mTopPadding
    bottomPadding: mBottomPadding

    QtObject {
        id: flatStyle
        property int mFlat: 0
        property int mPopup: 1
        property int mStandard: 2
        property int mSystem: 3
    }

    background: Rectangle{
        id: rectBack
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color: groupbox.mBackColor
        border.width: mBorderWidth

        Image {
            id: backGroundImage
            anchors.fill: parent
        }

        Component.onCompleted: {
            if(mFlatStyle == flatStyle.mFlat){
                rectBack.border.color = "Black"
                rectBack.radius = 0
            }
            else if(mFlatStyle == flatStyle.mPopup){
                rectBack.border.color = "#BBBBBB"
                rectBack.radius = 0
            }
            else if(mFlatStyle == flatStyle.mStandard){
                rectBack.border.color = "#0081f6"
                rectBack.radius = mRadius
            }
            else if(mFlatStyle == flatStyle.mSystem){
                rectBack.border.color = "#0081f6"
                rectBack.radius = mRadius
            }
        }

    }

    label: Text {
        padding: mPaddingTitle
        color: groupbox.mForeColor
        text: groupbox.title
        font: groupbox.mFont

        anchors.right:{
            if (groupbox.mRightToLeft) parent.right
        }
    }

    Label {
        id:lbl
    }

    property int mX_Autosize: 0
    property int mY_Autosize: 0
    function addControl(obj) {
        // Forecolor
        if (groupbox.mForeColor !== lbl.color) {
            if (Qt.colorEqual(obj.color,lbl.color)) {
                obj.mForeColor = groupbox.mForeColor
            }
        }

        // Init
        if (groupbox.mX_Autosize < obj.x + obj.width) {
            groupbox.mX_Autosize = obj.x + obj.width
        }
        if (groupbox.mY_Autosize < obj.y + obj.height) {
            groupbox.mY_Autosize = obj.y + obj.height
        }

        // AutoSize
        if (groupbox.mAutoSize) {
            if (groupbox.mX_Autosize > groupbox.mWidth) {
                groupbox.mWidth = groupbox.mX_Autosize + 10
            }
            if (groupbox.mY_Autosize > groupbox.mHeight) {
                groupbox.mHeight = groupbox.mY_Autosize + 10
            }
        }

        // Maximumsize
        if (groupbox.mMaximumSize.width !== 0) {
            if (groupbox.mWidth > groupbox.mMaximumSize.width)
                groupbox.mWidth = groupbox.mMaximumSize.width;
        }
        if (groupbox.mMaximumSize.height !== 0) {
            if (groupbox.mHeight > groupbox.mMaximumSize.height)
                groupbox.mHeight = groupbox.mMaximumSize.height;
        }

        // Minimumsize
        if (groupbox.mMinimumSize.width !== 0) {
            if(groupbox.mWidth < groupbox.mMinimumSize.width)
                groupbox.mWidth = groupbox.mMinimumSize.width;
        }
        if (groupbox.mMinimumSize.height !== 0) {
            if(groupbox.mHeight < groupbox.mMinimumSize.height)
                groupbox.mHeight = groupbox.mMinimumSize.height;
        }

        if (mCausesValidation){
            validating()
        }
    }

    // Type of component
    function qmltypeof(obj) {
        var str = obj.toString();
        var str2 = str.substring(0,str.indexOf('('));
        var index = str2.indexOf("_QMLTYPE");
        if(index == -1)
            return str2
        return str2.substring(0,str2.indexOf("_QMLTYPE"))
    }

    MouseArea{
        anchors.fill: parent
        cursorShape:{
            if(mUseWaitCursor)
                return Qt.WaitCursor
            return mCursor
        }
        acceptedButtons: Qt.NoButton
    }
}

