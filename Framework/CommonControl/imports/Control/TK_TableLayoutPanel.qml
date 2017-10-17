import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Rectangle {
    id:rectMain

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

    //    property  bool    mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property  bool    mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property  var     mModifiers              Not used        <=> CONTROL LIST: Modifiers
    //    property  bool    mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property  int     mDock                   Not used        <=> CONTROL LIST: Dock
    //    property  alias   mImeMode                Not used        <=> CONTROL LIST: ImeMode
    //    property  int     mRows                   Not used        <=> CONTROL LIST: Row Replace by mModel

    property    alias       mRowCount:                  grid.rows            //  <=> CONTROL LIST: RowCount
    property    alias       mColumnsCount:              grid.columns         //  <=> CONTROL LIST: ColumnCount
    property    size        mSize:                      Qt.size(10, 10)      //  <=> CONTROL LIST: Size
    property    size        mMaximumSize:               Qt.size(800, 800)    //  <=> CONTROL LIST: MaximumSize
    property    size        mMinimumSize:               Qt.size(0, 0)        //  <=> CONTROL LIST: MinimumSize
    property    color       mBackColor:                 "#ffffff"            //  <=> CONTROL LIST: BackColor
    property    alias       mBackgroundImage:           backImage.source     //  <=> CONTROL LIST: BackgroundImage
    property    int         mBackgroundImageLayout:     backImage.fillMode   //  <=> CONTROL LIST: BackgroundImageLayout
    property    bool        mRightToLeft:               Qt.LeftToRight       //  <=> CONTROL LIST: RightToLeft
    property    real        mTopPadding:                0                    //  <=> CONTROL LIST: TopPadding
    property    real        mRightPadding:              0                    //  <=> CONTROL LIST: RightPadding
    property    real        mLeftPadding:               0                    //  <=> CONTROL LIST: LeftPadding
    property    real        mBottomPadding:             0                    //  <=> CONTROL LIST: BottomPadding
    property    bool        mCausesValidation:          true                 //<=> CONTROL LIST: CausesValidation
    property    bool        mUseWaitCursor:             false                //<=> CONTROL LIST: UseWaitCursor
    property    int         mCursor:                    Qt.ArrowCursor       // <=> CONTROL LIST: Cursor
    property    size        mAutoScrollMargin:          Qt.size(0,0)         //<=> CONTROL LIST: AutoScrollMargin
    property    size        mAutoScrollMinSize:         Qt.size(0,0)         // <=> CONTROL LIST: AutoScrollMinSize
    property    bool        mAutoSize:                  false                // <=> CONTROL LIST: AutoSize
    property    bool        mAutoSizeMode:          	objAutoSizeMode.mGrowOnly // <=> CONTROL LIST: AutoSizeMode
    property    int         mColumns                                         //<=> CONTROL LIST: Columns
    property    int         mGrowStyle:                 growStyle.mAddRows   //<=> CONTROL LIST: GrowStyle
    property    int         mCellBorderStyle                                 // <=> CONTROL LIST: CellBorderStyle
    property    font        mFont:                  	lbl.font                    // <=> CONTROL LIST: Font
    property    color       mForeColor:             	lbl.color                   // <=> CONTROL LIST: ForeColor
    property    int         mScrollBarVPolicy:          Qt.ScrollBarAsNeeded        //  <=> CONTROL LIST: AutoScroll
    property    int         mScrollBarHPolicy:          Qt.ScrollBarAsNeeded        //  <=> CONTROL LIST: AutoScroll

    property    alias       mModel:                     repeater.model       //  <=> Create newly
    property    int         mRowsNumber:                2                    //  <=> Create newly
    property    int         mColumnsNumber:             2                    //  <=> Create newly
    property    real        mWidth:                     400                  //  <=> Create newly
    property    real        mHeight:                    200                  //  <=> Create newly
    property    var         mSpacing:                   [3, 2]               //  <=> Create newly(distance between two cells(row and column))


    property alias mDelegate : repeater.delegate
    color: mBackColor

    signal validating();

    QtObject {
        id: cellBorder
        property int mNone: 0
        property int mSingle: 1
        property int mInset: 2
        property int mInsetDouble: 3
        property int mOutset: 4
        property int mOutsetDouble:5
        property int mOutsetPartial:6
    }

    QtObject {
        id: growStyle
        property int mFixedSize: 0
        property int mAddRows: 1
        property int mAddColumns: 2
    }

    QtObject{
        id: objAutoSizeMode
        property bool mGrowOnly: true
        property bool mGrowAndShrink: false
    }

    Image {
        id: backImage
        anchors.fill: parent
    }

    TK_ScrollView {
        id: scroll
        anchors.fill: parent
        clip: true
        verticalScrollBarPolicy: mScrollBarVPolicy
        horizontalScrollBarPolicy: mScrollBarHPolicy
        contentItem: grid
    }

    Grid {
        id: grid
        columns:
        {
            if(mGrowStyle === growStyle.mAddColumns)
            {
                if(mRowsNumber*mColumnsNumber<repeater.model.count)
                {
                    mColumnsNumber = Math.ceil(repeater.model.count/mRowsNumber)
                }
            }
            mColumnsNumber

        }

        rows:
        {
            if(mGrowStyle === growStyle.mAddRows)
            {
                if(mRowsNumber*mColumnsNumber<repeater.model.count)
                {
                    mRowsNumber = Math.ceil(repeater.model.count/mColumnsNumber)
                }
            }
            mRowsNumber
        }

        rowSpacing: mSpacing[0]
        columnSpacing: mSpacing[1]
        flow: Grid.TopToBottom
        topPadding: mTopPadding
        leftPadding: mLeftPadding
        rightPadding: mRightPadding
        bottomPadding: mBottomPadding
        layoutDirection: {
            if(mRightToLeft) {
                return Qt.RightToLeft
            } else {
                return Qt.LeftToRight
            }
        }

        Repeater {
            id: repeater
            anchors.fill: parent
        }
        Component.onCompleted:{

            //mAutoScrollMargin
            if(mAutoScrollMargin.width > 0){
                grid.width += mAutoScrollMargin.width
            }
            if(mAutoScrollMargin.height > 0){
                grid.height += mAutoScrollMargin.height
            }

            //mAutoScrollMinSize
            if (mAutoScrollMinSize.width > 0) {
                mScrollBarVPolicy = Qt.ScrollBarAlwaysOn;
                if(mAutoScrollMinSize.width > grid.width){
                    grid.width = mAutoScrollMinSize.width
                } else return grid.width
            }
            if (mAutoScrollMinSize.height > 0) {
                mScrollBarHPolicy = Qt.ScrollBarAlwaysOn;
                if(mAutoScrollMinSize.height > grid.height){
                    grid.height = mAutoScrollMinSize.height
                } else return grid.height
            }
        }
    }
    Item {
        id: itemNull
    }

    Label {
        id:lbl
    }

    MouseArea {
        anchors.fill: parent
        cursorShape:{
            if(mUseWaitCursor){
                return Qt.WaitCursor
            } else{
                return mCursor
            }
        }
        acceptedButtons: Qt.NoButton
    }

    Component.onCompleted: {
        rectMain.width = getWidth()
        rectMain.height = getHeight()

        //Validation
        if(mCausesValidation)
        {
            validating()
        }

        //forecolor
        if (rectMain.mForeColor!==lbl.color) {
            var i;
            for (i=0; i < repeater.model.count; i++) {
                switch(qmltypeof(repeater.itemAt(i))) {
                case "TK_PictureBox":
                case "TK_TrackBar":
                case "TK_DateTimePicker":
                case "TK_TabControl":
                    break;
                default:
                    repeater.itemAt(i).mForeColor = rectMain.mForeColor
                    break;
                }
            }
        }

        //font
        if (rectMain.mFont!==lbl.font){
            var i;
            for (i = 0; i < repeater.model.count; i++) {
                switch(qmltypeof(repeater.itemAt(i))) {
                case "TK_ProgressBar":
                case "TK_PictureBox":
                case "TK_TrackBar":
                    break;
                default:
                    repeater.itemAt(i).mFont=rectMain.mFont
                    break;
                }
            }
        }
        //Autosize
        if (mAutoSize){
            var totalWidth=0
            var i;
            for (i = 0; i < repeater.model.count; i++) {
                totalWidth += repeater.itemAt(i).width
                if(mAutoSizeMode === objAutoSizeMode.mGrowOnly){
                    if(totalWidth>rectMain.width) {
                        rectMain.width=totalWidth
                        return
                    }
                } else {
                    rectMain.width=totalWidth
                    return
                }

            }
        }
    }

    function getWidth() {
        if (mWidth > mMaximumSize.width) return mMaximumSize.width
        if (mWidth < mMinimumSize.width) return mMinimumSize.width
        return mWidth
    }

    function getHeight() {
        if (mHeight > mMaximumSize.height) return mMaximumSize.height
        if (mHeight < mMinimumSize.height) return mMinimumSize.height
        return mHeight
    }

    function qmltypeof(obj) {
        var str = obj.toString();
        var str2 = str.substring(0,str.indexOf('('));
        var index = str2.indexOf("_QMLTYPE");
        if(index === -1){
            return str2
        } else {
            return str2.substring(0,str2.indexOf("_QMLTYPE"))
        }
    }
}
