import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

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
    property size            mAutoScrollMinSize:     Qt.size(0,0)           // <=> CONTROL LIST: AutoScrollMinSize
    property bool            mAutoSize:              false                  // <=> CONTROL LIST: AutoSize
    property bool            mAutoSizeMode:          objAutoSizeMode.mGrowOnly  // <=> CONTROL LIST: AutoSizeMode
    property bool            mRightToLeft:           false                      // <=> CONTROL LIST: RightToLeft
    property int             mFlowDirection:         flowDirection.mLeftToRight
    property size            mMaximumSize:           Qt.size(800, 800)      //  <=> CONTROL LIST: MaximumSize
    property size            mMinimumSize:           Qt.size(0, 0)          //  <=> CONTROL LIST: MinimumSize
    property real            mTopPadding:            3                      //  <=> CONTROL LIST: TopPadding
    property real            mRightPadding:          3                      //  <=> CONTROL LIST: RightPadding
    property real            mLeftPadding:           3                      //  <=> CONTROL LIST: LeftPadding
    property real            mBottomPadding:         3                      //  <=> CONTROL LIST: BottomPadding
    property bool            mWrapContents:          true                   //  <=> CONTROL LIST: WrapContents
    property color           mBackColor:             "#ffffff"              //  <=> CONTROL LIST: BackColor
    property alias           mBackgroundImage:       backImage.source       //  <=> CONTROL LIST: BackgroundImage
    property alias           mBackgroundImageLayout: backImage.fillMode     //  <=> CONTROL LIST: BackgroundImageLayout
    property int             mBorderStyle:           borderStyle.mNone      //  <=> CONTROL LIST: BorderStyle
    property color           mForeColor  :           lbl.color
    property font            mFont:                  lbl.font
    property int             mCursor:                Qt.ArrowCursor         // <=> CONTROL LIST: Cursor
    property size            mAutoScrollMargin:      Qt.size(0,0)           // <=> CONTROL LIST: AutoScrollMargin
    property bool            mCausesValidation:      false                  // <=> CONTROL LIST: CausesValidation
    property bool            mUseWaitCursor:         false                  // <=> CONTROL LIST: UseWaitCursor

    property    size        mSize:                      Qt.size(10, 10)     //  <=> Create newly
    property    alias       mModel:                     repeater.model      //  <=> Create newly
    property    real        mWidth:                     400                 //  <=> Create newly
    property    real        mHeight:                    200                 //  <=> Create newly
    property    int         mSpacing:                   3                   //  <=> Create newly

    property    int         mScrollBarVPolicy:          Qt.ScrollBarAsNeeded    //  <=> CONTROL LIST: AutoScroll
    property    int         mScrollBarHPolicy:          Qt.ScrollBarAsNeeded    //  <=> CONTROL LIST: AutoScroll

    property    Item        mFlow:                      flow

    signal validating()

    color: mBackColor
    clip:true
    border.color:{
        if(mBorderStyle==0){
            return "transparent"
        } else {
            return "#000000"
        }
    }

    QtObject {
        id: flowDirection
        property int mLeftToRight: 0
        property int mTopDown: 1
        property int mRightToLeft: 2
        property int mBottomUp: 3
    }
    QtObject {
        id: borderStyle
        property int mNone: 0
        property int mFixedSingle: 1
        property int mFixed3D: 2
    }
    QtObject {
        id: qAutoSize
        property int mTotalWidth: 0
        property int mTotalHeight: 0
    }
    QtObject{
        id: objAutoSizeMode
        property bool mGrowOnly: true
        property bool mGrowAndShrink: false
    }

    Label {
        id:lbl
    }
    Item {
        id: itemNull
    }
    MouseArea {
        anchors.fill: parent
        cursorShape: {
            if(mUseWaitCursor){
                return Qt.WaitCursor
            } else {
                return mCursor
            }
        }
        acceptedButtons: Qt.NoButton
    }
    Image {
        id: backImage
        anchors.fill: parent

    }

    TK_ScrollView {
        id: scroll
        clip: true
        anchors.fill: parent
        horizontalScrollBarPolicy: mScrollBarHPolicy
        verticalScrollBarPolicy: mScrollBarVPolicy

        Flow {
            id: flow
            spacing: rectMain.mSpacing
            flow: {
                switch(mFlowDirection) {
                case flowDirection.mLeftToRight:
                    Flow.LeftToRight;
                    break;
                case flowDirection.mTopDown:
                    Flow.TopToBottom
                    break;
                case flowDirection.mRightToLeft:
                    if(mRightToLeft) {
                        Flow.LeftToRight;
                    } else {
                        mRightToLeft = true;
                        Flow.LeftToRight;
                    }
                    break;
                case flowDirection.mBottomUp:
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
            layoutDirection: {
                if(mRightToLeft){
                    return Qt.RightToLeft
                } else {

                    return Qt.LeftToRight
                }
            }
            width: {
                if(!(!rectMain.mAutoSize&&!rectMain.mWrapContents &&
                     (rectMain.mFlowDirection===flowDirection.mLeftToRight||
                      rectMain.mFlowDirection===flowDirection.mRightToLeft))) {
                    rectMain.width
                }
            }
            height: {
                if(!(!rectMain.mAutoSize&&!rectMain.mWrapContents &&
                     (rectMain.mFlowDirection === flowDirection.mTopDown ||
                      rectMain.mFlowDirection === flowDirection.mBottomUp))) {
                    rectMain.height
                }
            }

            Repeater {
                id: repeater
                anchors.fill: parent
                model: mModel
            }
            Component.onCompleted:{

                //mAutoScrollMargin
                if(mAutoScrollMargin.width > 0){
                    flow.width += mAutoScrollMargin.width
                }
                if(mAutoScrollMargin.height > 0){
                    flow.height += mAutoScrollMargin.height
                }

                //mAutoScrollMinSize
                if (mAutoScrollMinSize.width>0) {
                    mScrollBarHPolicy = Qt.ScrollBarAlwaysOn
                    if(mAutoScrollMinSize.width>flow.width){
                        flow.width = mAutoScrollMinSize.width
                    }
                }
                if (mAutoScrollMinSize.height>0) {
                    mScrollBarVPolicy = Qt.ScrollBarAlwaysOn
                    if(mAutoScrollMinSize.height>flow.height){
                        flow.height = mAutoScrollMinSize.height
                    }
                }
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
                qAutoSize.mTotalWidth += repeater.itemAt(i).width
                qAutoSize.mTotalHeight += repeater.itemAt(i).height
            }
            switch(rectMain.mFlowDirection) {
            case flowDirection.mLeftToRight:
            case flowDirection.mRightToLeft:
                if(mAutoSizeMode === objAutoSizeMode.mGrowOnly){
                    if(qAutoSize.mTotalWidth>rectMain.width) rectMain.width=qAutoSize.mTotalWidth;
                } else {
                    rectMain.width=qAutoSize.mTotalWidth;
                }

                break;
            case flowDirection.mTopDown:
            case flowDirection.mBottomUp:
                if(mAutoSizeMode === objAutoSizeMode.mGrowOnly){
                    if(qAutoSize.mTotalHeight>rectMain.height) rectMain.height = qAutoSize.mTotalHeight;
                }else {
                    rectMain.height = qAutoSize.mTotalHeight;
                }
                break;
            default:
                if(mAutoSizeMode === objAutoSizeMode.mGrowOnly){
                    if(qAutoSize.mTotalWidth>rectMain.width) rectMain.width=qAutoSize.mTotalWidth;
                } else {
                    rectMain.width=qAutoSize.mTotalWidth;
                }
                break;
            }
        }

        if(mCausesValidation){
            validating()
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
