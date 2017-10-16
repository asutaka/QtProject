import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    id:rectMain


    //    property	alias	id:                     Not customize   <=> CONTROL LIST: Name
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


    //    property  bool    mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property  bool    mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property  var     mModifiers              Not used        <=> CONTROL LIST: Modifiers
    //    property  bool    mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property  alias   mImeMode                Not used        <=> CONTROL LIST: ImeMode
    //    property  int     mDock                   Not used        <=> CONTROL LIST: Dock


    property alias           mEnabled:               rectMain.enabled       //<=> CONTROL LIST: Enabled
    property alias           mVisible:               rectMain.visible       //<=> CONTROL LIST: Visibled
    property bool            mAutoScroll:            false                  //  <=> CONTROL LIST: AutoScroll
    property variant         mAutoScrollMinSize:     Qt.size(0,0)           // <=> CONTROL LIST: AutoScrollMinSize
    property bool            mAutoSize:              false                  // <=> CONTROL LIST: AutoSize
    property bool            mAutoSizeMode:          false                  // <=> CONTROL LIST: AutoSizeMode
    property bool            mRightToLeft:           false                  //  <=> CONTROL LIST: RightToLeft
    property int             mFlowDirection:         flowDirection.pLeftToRight
    property size            mMaximumSize:           Qt.size(800, 800)      //  <=> CONTROL LIST: MaximumSize
    property size            mMinimumSize:           Qt.size(0, 0)          //  <=> CONTROL LIST: MinimumSize
    property real            mTopPadding:            3                      //  <=> CONTROL LIST: TopPadding
    property real            mRightPadding:          3                      //  <=> CONTROL LIST: RightPadding
    property real            mLeftPadding:           3                      //  <=> CONTROL LIST: LeftPadding
    property real            mBottomPadding:         3                      //  <=> CONTROL LIST: BottomPadding
    property bool            mWrapContents:          true                   //  <=> CONTROL LIST: WrapContents
    property color           mBackColor:             "#ffffff"              //  <=> CONTROL LIST: BackColor
    property url             mBackgroundImage:       ""                     //  <=> CONTROL LIST: BackgroundImage
    property int             mBackgroundImageLayout: imageLayout.pNone      //  <=> CONTROL LIST: BackgroundImageLayout
    property int             mBorderStyle:           borderStyle.pNone      //<=> CONTROL LIST: BorderStyle
    property color           mForeColor  :           lbl.color
    property font            mFont:                  lbl.font
    property int             mCursor:                Qt.ArrowCursor         // <=> CONTROL LIST: Cursor
    property size            mAutoScrollMargin:      Qt.size(0,0)           //<=> CONTROL LIST: AutoScrollMargin
    property bool            mCausesValidation:      true                   // <=> CONTROL LIST: CausesValidation
    property bool            mUseWaitCursor:         false                  // <=> CONTROL LIST: UseWaitCursor

    property    size        mSize:                      Qt.size(10, 10)     //  <=> Create newly
    property    alias       mModel:                     repeater.model      //  <=> Create newly
    property    int         mRowsNumber:                2                   //  <=> Create newly
    property    int         mColumnsNumber:             2                   //  <=> Create newly
    property    real        mWidth:                     400                 //  <=> Create newly
    property    real        mHeight:                    200                 //  <=> Create newly
    property    int         mSpacing:                   3                   //  <=> Create newly

    property    int         mScrollBarVPolicy:          Qt.ScrollBarAsNeeded    //  <=> Create newly
    property    int         mScrollBarHPolicy:          Qt.ScrollBarAsNeeded    //  <=> Create newly
    property    color       mScrollbarColor:            "#F69642"               //  <=> Create newly
    property    real        mScrollBarLeftMargin:       5                       //  <=> Create newly
    property    real        mScrollBarRightMargin:      0                       //  <=> Create newly
    property    real        mScrollBarTopMargin:        2                       //  <=> Create newly
    property    real        mScrollBarBottomMargin:     2                       //  <=> Create newly

    color: mBackColor
    clip:true
    border.color: mBorderStyle==0?"transparent":"#000000"

    QtObject {
        id: imageLayout
        property int mNone: 0
        property int mTile: 1
        property int mCenter: 2
        property int mStretch: 3
        property int mZoom: 4
    }
    QtObject {
        id: flowDirection
        property int pLeftToRight: 0
        property int pTopDown: 1
        property int pRightToLeft: 2
        property int pBottomUp: 3
    }
    QtObject {
        id: borderStyle
        property int pNone: 0
        property int pFixedSingle: 1
        property int pFixed3D: 2
    }
    QtObject {
        id: qAutoSize
        property int pTotalWidth: 0
        property int pTotalHeight: 0
    }
    Label {
        id:lbl
    }
    Item {
        id: itemNull
    }
    MouseArea {
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
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
        contentItem: mAutoScroll ? flow : itemNull
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

    Flow {
        id: flow
        spacing: rectMain.mSpacing
        flow: {
            switch(mFlowDirection) {
            case flowDirection.pLeftToRight:
                Flow.LeftToRight;
                break;
            case flowDirection.pTopDown:
                Flow.TopToBottom
                break;
            case flowDirection.pRightToLeft:
                if(mRightToLeft) {
                    Flow.LeftToRight;
                } else {
                    mRightToLeft = true;
                    Flow.LeftToRight;
                }
                break;
            case flowDirection.pBottomUp:
                Flow.TopToBottom;
                break;
            default:
                Flow.LeftToRight;
                break;
            }
        }
        topPadding: mTopPadding
        leftPadding: mLeftPadding
        rightPadding: mRightPadding
        bottomPadding: mBottomPadding
        layoutDirection: mRightToLeft ? Qt.RightToLeft : Qt.LeftToRight
        width: {
            if(!(!rectMain.mAutoSize&&!rectMain.mWrapContents &&
                 (rectMain.mFlowDirection===flowDirection.pLeftToRight||
                  rectMain.mFlowDirection===flowDirection.pRightToLeft))) {
                rectMain.width
            }
        }
        height: {
            if(!(!rectMain.mAutoSize&&!rectMain.mWrapContents &&
                 (rectMain.mFlowDirection === flowDirection.pTopDown ||
                  rectMain.mFlowDirection === flowDirection.pBottomUp))) {
                rectMain.height
            }
        }

        Repeater {
            id: repeater
            anchors.fill: parent
            model: mModel
        }
        Component.onCompleted:{
            if (mAutoScrollMinSize.width>0) {
                mAutoScroll=true;
                flow.width = (mAutoScrollMinSize.width>flow.width)?mAutoScrollMinSize.width:flow.width;
            }
            if (mAutoScrollMinSize.height>0) {
                mAutoScroll=true;
                flow.height = (mAutoScrollMinSize.height>flow.height)?mAutoScrollMinSize.height:flow.height;
            }
        }
    }

    Component.onCompleted: {
        scroll.width = getWidth()
        scroll.height = getHeight()

        //forecolor
        if (rectMain.mForeColor!==lbl.color) {
            var i;
            for (i=0; i < repeater.model.count; i++) {
                switch(qmltypeof(repeater.itemAt(i))) {
                case "QQuickText":
                case "QQuickLabel":
                    repeater.itemAt(i).color = rectMain.mForeColor
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
                case "QQuickText":
                case "QQuickLabel":
                    repeater.itemAt(i).font=rectMain.mFont
                    break;
                default:
                    repeater.itemAt(i).mFont=rectMain.mFont
                    break;
                }
            }
        }
        //Autosize
        if (rectMain.mAutoSize){
            var i;
            for (i = 0; i < repeater.model.count; i++) {
                qAutoSize.pTotalWidth += repeater.itemAt(i).width
                qAutoSize.pTotalHeight += repeater.itemAt(i).height
            }
            switch(rectMain.mFlowDirection) {
            case flowDirection.pLeftToRight:
            case flowDirection.pRightToLeft:
                if(qAutoSize.pTotalWidth>rectMain.width) rectMain.width=qAutoSize.pTotalWidth;
                break;
            case flowDirection.pTopDown:
            case flowDirection.pBottomUp:
                if(qAutoSize.pTotalHeight>rectMain.height) rectMain.height = qAutoSize.pTotalHeight;
                break;
            default:
                if(qAutoSize.pTotalWidth>rectMain.width) rectMain.width=qAutoSize.pTotalWidth;
                break;
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
