import MyQMLEnums 1.0
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

    property	var         mMaximumSize:           Qt.size(0, 0)                       // <=> CONTROL LIST: MaximumSize
    property	var         mMinimumSize:           Qt.size(0, 0)                       // <=> CONTROL LIST: MinimumSize
    property	color       mBackColor:             "yellow"                            // <=> CONTROL LIST: BackColor
    property    color       mForcolor:              "blue"                              // <=> CONTROL LIST: FrontColor
    property    int         mStyle:                 Style.SCROLL                        // <=> CONTROL LIST: Style
    property    int         mMarqueeAnimationSpeed: 1                                   // <=> CONTROL LIST: MarqueeAnimationSpeed
    property    int         mStep:                  0                                   // <=> CONTROL LIST: Step

    Rectangle{
        id: frame
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color: mBackColor
        visible : !indeterminate
        Rectangle{
            // Style:BAR
            id: bar
            width: parent.width - 4
            height: parent.height - 4
            anchors.fill: parent
            anchors.margins: 2
            Rectangle{
                id: dynamic_bar
                //width:((value-from)/mStep)*mStep*(parent.width/(to-from))
                width: progressBar.value*(parent.width/(to-from))
                height: parent.height
                color: mForcolor
                visible : (progressBar.mStyle == Style.BAR)
            }

            // Style:BLOCK
            Row{
                width : parent.width
                height : parent.height
                spacing : 2
                visible : (progressBar.mStyle == Style.BLOCK)
                Rectangle{id:block1;width:((parent.width-(2*9))/10);height: parent.height;color:mForcolor;visible:value>=((to-from)/10)*1+from}
                Rectangle{id:block2;width:((parent.width-(2*9))/10);height: parent.height;color:mForcolor;visible:value>=((to-from)/10)*2+from}
                Rectangle{id:block3;width:((parent.width-(2*9))/10);height: parent.height;color:mForcolor;visible:value>=((to-from)/10)*3+from}
                Rectangle{id:block4;width:((parent.width-(2*9))/10);height: parent.height;color:mForcolor;visible:value>=((to-from)/10)*4+from}
                Rectangle{id:block5;width:((parent.width-(2*9))/10);height: parent.height;color:mForcolor;visible:value>=((to-from)/10)*5+from}
                Rectangle{id:block6;width:((parent.width-(2*9))/10);height: parent.height;color:mForcolor;visible:value>=((to-from)/10)*6+from}
                Rectangle{id:block7;width:((parent.width-(2*9))/10);height: parent.height;color:mForcolor;visible:value>=((to-from)/10)*7+from}
                Rectangle{id:block8;width:((parent.width-(2*9))/10);height: parent.height;color:mForcolor;visible:value>=((to-from)/10)*8+from}
                Rectangle{id:block9;width:((parent.width-(2*9))/10);height: parent.height;color:mForcolor;visible:value>=((to-from)/10)*9+from}
                Rectangle{id:block10;width:((parent.width-(2*9))/10);height: parent.height;color:mForcolor;visible:value>=((to-from)/10)*10+from}
            }
            // Style:Scroll
            Rectangle{
                id: scroll_block
                width: parent.width/10
                height: parent.height
                color: mForcolor
                visible : (progressBar.mStyle == Style.SCROLL)

                Timer{
                    id : scrollTimer
                    interval : mMarqueeAnimationSpeed
                    running : true
                    repeat : true
                    onTriggered:{
                        parent.x = parent.x + 2;
                        if(parent.x > (frame.x + frame.width - parent.width)){
                            parent.x = frame.x;
                        }
                    }
                }
            }
        }
    }    
}

