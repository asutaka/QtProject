import CommonControl 1.0
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

ProgressBar {
    id: progressBar

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
    //    property  alias   position:               Not customize   <=> CONTROL LIST: Value
    //    property  alias   from:                   Not customize   <=> CONTROL LIST: Maximum
    //    property  alias   to:                     Not customize   <=> CONTROL LIST: Minimum
    //    property  alias   visualPosition :        Not customize   <=> CONTROL LIST: RightToLeftLayout

    //    property	bool 	mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property	bool	mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property	var 	mModifiers              Not used        <=> CONTROL LIST: Modifiers
    //    property	int 	mDock                   Not used        <=> CONTROL LIST: Dock
    //    property	alias	mRightToLeft            Not used        <=> CONTROL LIST: RightToLeft
    //    property	alias	mUseWaitCursor          Not used        <=> CONTROL LIST: UseWaitCursor

    property	size        mMaximumSize:           Qt.size(999, 999)                   // <=> CONTROL LIST: MaximumSize
    property	size        mMinimumSize:           Qt.size(0, 0)                       // <=> CONTROL LIST: MinimumSize
    property	color       mBackColor:             "yellow"                            // <=> CONTROL LIST: BackColor
    property    color       mForcolor:              "blue"                              // <=> CONTROL LIST: FrontColor
    property    int         mStyle:                 progressBarStyle.mBlock             // <=> CONTROL LIST: Style
    property    int         mMarqueeAnimationSpeed: 1                                   // <=> CONTROL LIST: MarqueeAnimationSpeed
    property    int         mStep:                  0                                   // <=> CONTROL LIST: Step
    property    bool        mRightToLeft:           false                                // <=> CONTROL LIST: RightToLeft
    property    bool        mRightToLeftLayout:     false                                // <=> CONTROL LIST: RightToLeftLayout
    property    bool        mUseWaitCursor:         false                               // <=> CONTROL LIST: UseWaitCursor
    property    int         mCursor:                Qt.ArrowCursor                      // <=> CONTROL LIST: Cursor

    QtObject {
        id: progressBarStyle
        property int mBar: 0
        property int mBlock: 1
        property int mScroll: 2
    }

    Rectangle{
        id: frame
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color: mBackColor
        visible : !indeterminate
        Rectangle{            
            id: bar
            width: parent.width - 4
            height: parent.height - 4
            anchors.fill: parent
            anchors.margins: 2

            // progressBarStyle:mBar
            Rectangle{
                id: dynamic_bar
                x: if((mRightToLeft == false) || (mRightToLeftLayout == false)){
                       bar.x
                   }else{
                       bar.x + bar.width - (to-from-value)*(parent.width/(to-from)) -2
                   }
                width: (value-from)*(parent.width/(to-from))
                height: parent.height
                color: mForcolor
                visible : (progressBar.mStyle == progressBarStyle.mBar)
            }

            // progressBarStyle:mBlock
            Row{
                width : bar.width
                height : bar.height
                spacing : 2
                layoutDirection :if((mRightToLeft == false) || (mRightToLeftLayout == false)){
                                     Qt.LeftToRight
                                 }else{
                                     Qt.RightToLeft
                                 }
                visible : (progressBar.mStyle == progressBarStyle.mBlock)
                Rectangle{id:block1;width:((bar.width-(2*9))/10);height: bar.height;color:mForcolor;visible:value>=((to-from)/10)*1+from}
                Rectangle{id:block2;width:((bar.width-(2*9))/10);height: bar.height;color:mForcolor;visible:value>=((to-from)/10)*2+from}
                Rectangle{id:block3;width:((bar.width-(2*9))/10);height: bar.height;color:mForcolor;visible:value>=((to-from)/10)*3+from}
                Rectangle{id:block4;width:((bar.width-(2*9))/10);height: bar.height;color:mForcolor;visible:value>=((to-from)/10)*4+from}
                Rectangle{id:block5;width:((bar.width-(2*9))/10);height: bar.height;color:mForcolor;visible:value>=((to-from)/10)*5+from}
                Rectangle{id:block6;width:((bar.width-(2*9))/10);height: bar.height;color:mForcolor;visible:value>=((to-from)/10)*6+from}
                Rectangle{id:block7;width:((bar.width-(2*9))/10);height: bar.height;color:mForcolor;visible:value>=((to-from)/10)*7+from}
                Rectangle{id:block8;width:((bar.width-(2*9))/10);height: bar.height;color:mForcolor;visible:value>=((to-from)/10)*8+from}
                Rectangle{id:block9;width:((bar.width-(2*9))/10);height: bar.height;color:mForcolor;visible:value>=((to-from)/10)*9+from}
                Rectangle{id:block10;width:((bar.width-(2*9))/10);height: bar.height;color:mForcolor;visible:value>=((to-from)/10)*10+from}
            }
            // progressBarStyle:mScroll
            Rectangle{
                id: scroll_block
                x: if((mRightToLeft == false) || (mRightToLeftLayout == false)){
                       frame.x
                   }else{
                       frame.x + frame.width - scroll_block.width
                   }
                width: parent.width/10
                height: parent.height
                color: mForcolor
                visible : (progressBar.mStyle == progressBarStyle.mScroll)

                Timer{
                    id : scrollTimer
                    interval : mMarqueeAnimationSpeed
                    running : true
                    repeat : true
                    onTriggered:{
                        if((mRightToLeft == false) || (mRightToLeftLayout == false)){
                            scroll_block.x = scroll_block.x + 2;
                            if(scroll_block.x > (frame.x + frame.width - scroll_block.width)){
                                scroll_block.x = frame.x;
                            }
                        }else{
                            parent.x = parent.x - 2;
                            if(scroll_block.x < frame.x){
                                scroll_block.x = frame.x + frame.width - scroll_block.width;
                            }
                        }
                    }
                }
            }
        }
    }
    MouseArea {
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }

    // Set Control Size
    Component.onCompleted: {
        progressBar.width = __controlWidth()
        progressBar.height = __controlHeight()
    }

    // Set Control Width
    function __controlWidth() {
        if (progressBar.width > mMaximumSize.width) return mMaximumSize.width
        if (progressBar.width < mMinimumSize.width) return mMinimumSize.width
        return progressBar.width
    }

    // Set Control Height
    function __controlHeight() {
        if (progressBar.height > mMaximumSize.height) return mMaximumSize.height
        if (progressBar.height < mMinimumSize.height) return mMinimumSize.height
        return progressBar.height
    }
}

