import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

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


    property    bool        mAutoScroll:                false                //  <=> CONTROL LIST: AutoScroll
    property    alias       mRowCount:                  grid.rows            //  <=> CONTROL LIST: RowCount
    property    alias       mColumnsCount:              grid.columns         //  <=> CONTROL LIST: ColumnCount
    property    size        mSize:                      Qt.size(10, 10)      //  <=> CONTROL LIST: Size
    property    size        mMaximumSize:               Qt.size(800, 800)    //  <=> CONTROL LIST: MaximumSize
    property    var         mMinimumSize:               Qt.size(0, 0)        //  <=> CONTROL LIST: MinimumSize
    property    color       mBackColor:                 "#ffffff"            //  <=> CONTROL LIST: BackColor
    property    url         mBackgroundImage:           ""                   //  <=> CONTROL LIST: BackgroundImage
    property    int         mBackgroundImageLayout:     imageLayout.mNone    //  <=> CONTROL LIST: BackgroundImageLayout
    property    bool        mRightToLeft:               Qt.LeftToRight       //  <=> CONTROL LIST: RightToLeft
    property    real        mTopPadding:                0                    //  <=> CONTROL LIST: TopPadding
    property    real        mRightPadding:              0                    //  <=> CONTROL LIST: RightPadding
    property    real        mLeftPadding:               0                    //  <=> CONTROL LIST: LeftPadding
    property    real        mBottomPadding:             0                    //  <=> CONTROL LIST: BottomPadding
    property    bool        mCausesValidation:          true                 //<=> CONTROL LIST: CausesValidation
    property    bool        mUseWaitCursor:             false                //<=> CONTROL LIST: UseWaitCursor
    property    int         mCursor:                    Qt.ArrowCursor       // <=> CONTROL LIST: Cursor
    property    size        mAutoScrollMargin:          Qt.size(0,0)         //<=> CONTROL LIST: AutoScrollMargin
    property    var         mAutoScrollMinSize:         Qt.size(0,0)         // <=> CONTROL LIST: AutoScrollMinSize
    property    bool        mAutoSize:                  false                // <=> CONTROL LIST: AutoSize
    property    bool        mAutoSizeMode:          	false                       // <=> CONTROL LIST: AutoSizeMode
    property    int         mColumns                                         //<=> CONTROL LIST: Columns
    property    int         mGrowStyle:                 growStyle.mAddRows   //<=> CONTROL LIST: GrowStyle
    property    int         mRows                                            //<=> CONTROL LIST: Rows
    property    int         mCellBorderStyle                                 // <=> CONTROL LIST: CellBorderStyle
    property    font        mFont:                  	lbl.font                    // <=> CONTROL LIST: Font
    property    color       mForeColor:             	lbl.color                   // <=> CONTROL LIST: ForeColor

    property    alias       mModel:                     repeater.model       //  <=> Create newly
    property    int         mRowsNumber:                2                    //  <=> Create newly
    property    int         mColumnsNumber:             2                    //  <=> Create newly
    property    real        mWidth:                     400                  //  <=> Create newly
    property    real        mHeight:                    200                  //  <=> Create newly
    property    var         mSpacing:                   [3, 2]               //  <=> Create newly(distance between two cells(row and column))

    property    int         mScrollBarVPolicy:          Qt.ScrollBarAsNeeded    //  <=> Create newly
    property    int         mScrollBarHPolicy:          Qt.ScrollBarAsNeeded    //  <=> Create newly
    property    color       mScrollbarColor:            "#F69642"               //  <=> Create newly
    property    real        mScrollBarLeftMargin:       5                       //  <=> Create newly
    property    real        mScrollBarRightMargin:      0                       //  <=> Create newly
    property    real        mScrollBarTopMargin:        2                       //  <=> Create newly
    property    real        mScrollBarBottomMargin:     2                       //  <=> Create newly



    property alias mDelegate : repeater.delegate
    color: mBackColor

    signal validating();


    QtObject {
        id: imageLayout
        property int mNone: 0
        property int mTile: 1
        property int mCenter: 2
        property int mStretch: 3
        property int mZoom: 4
    }
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


    Image {
        source: mBackgroundImage
        fillMode: {
            switch (mBackgroundImageLayout) {
                case imageLayout.mTile:
                    Image.Tile;
                    break;
                case imageLayout.mStretch:
                    Image.Stretch;
                    break;
                case imageLayout.mZoom:
                    Image.PreserveAspectFit
                    break;
                default:
                    Image.Stretch;
                    break;
            }
        }

        Component.onCompleted: {
            switch (mBackgroundImageLayout) {
                case imageLayout.mTile:
                case imageLayout.mStretch:
                case imageLayout.mZoom:
                    anchors.fill = parent
                case imageLayout.mCenter:
                    anchors.centerIn = parent
                    break
                default:
                    Image.Tile;
                    break;
            }
        }
    }

    ScrollView {
        id: scroll
        contentItem: mAutoScroll ? grid : itemNull
        verticalScrollBarPolicy: mScrollBarVPolicy
        horizontalScrollBarPolicy: mScrollBarHPolicy
        visible: mAutoScroll
        anchors.fill: parent
        style: ScrollViewStyle {
            handle: Item {
                implicitWidth: mSize.width
                implicitHeight: mSize.height
                Rectangle {
                    color: mScrollbarColor
                    anchors.fill: parent
                    anchors.leftMargin: mScrollBarLeftMargin
                    anchors.topMargin: mScrollBarTopMargin
                    anchors.bottomMargin: mScrollBarBottomMargin
                    anchors.rightMargin: mScrollBarRightMargin
                }
            }
        }
    }

    Item {
        id: itemNull
    }
    Label
    {
        id:lbl
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
        layoutDirection: mRightToLeft ? Qt.RightToLeft : Qt.LeftToRight

        Repeater {
            id: repeater
            anchors.fill: parent
        }
        Component.onCompleted:{
            console.log("grid:"+grid.rows+";"+grid.columns)
        }
    }
    MouseArea {
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }

    Component.onCompleted: {
        scroll.width = getWidth()
        scroll.height = getHeight()

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
                if(totalWidth>rectMain.width) {
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
      var str2= str.substring(0,str.indexOf('('));
      var index=str2.indexOf("_QMLTYPE");
      return index===-1?str2:str2.substring(0,str2.indexOf("_QMLTYPE"))
    }
}
