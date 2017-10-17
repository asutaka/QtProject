import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    id: trackBar

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
    //    property	bool	mCausesValidation       Not used        <=> CONTROL LIST: CausesValidation
    //    property	bool	mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property	bool	mAutoSize               Not used        <=> CONTROL LIST: AutoSize
    //    property	int 	mDock                   Not used        <=> CONTROL LIST: Dock
    //    property	alias	mRightToLeft            Not used        <=> CONTROL LIST: RightToLeft

    property	size        mMaximumSize:           Qt.size(999, 999)                   // <=> CONTROL LIST: MaximumSize
    property	size        mMinimumSize:           Qt.size(0, 0)                       // <=> CONTROL LIST: MinimumSize
    property	color       mBackColor:             "gray"                              // <=> CONTROL LIST: BackColor
    property	real        mMaximum:               slider.maximumValue                 // <=> CONTROL LIST: Maximum
    property	real        mMinimum:               slider.minimumValue                 // <=> CONTROL LIST: Minimum
    property	real        mSmallChange:           slider.stepSize                     // <=> CONTROL LIST: SmallChange
    property	real        mValue:                 slider.value                        // <=> CONTROL LIST: Value
    property	int         mOrientation:           slider.orientation                  // <=> CONTROL LIST: Orientation
    property    int         mTickFrequency:         1                                   // <=> CONTROL LIST: TickFrequency
    property    int         mTickStyle:             tickStyle.mBottomRight              // <=> CONTROL LIST: TickStyle
    property    bool        mRightToLeft:           false                                // <=> CONTROL LIST: RightToLeft
    property    bool        mCausesValidation:      true                                // <=> CONTROL LIST: CausesValidation
    property    bool        mAutoSize:              false                               // <=> AutoSize
    property    bool        mUseWaitCursor:         false                                   // <=> CONTROL LIST: UseWaitCursor
    property    int         mCursor:                Qt.SplitHCursor                      // <=> CONTROL LIST: Cursor
    signal validating()

    QtObject {
        id: tickStyle
        property int mBottomRight: 0
        property int mTopLeft: 1
        property int mBoth: 2
    }

    Rectangle {
        id: backRect
        anchors.fill: parent
        color:mBackColor

        // mOrientation:Horizpntal mTickStyle:mBottomRight,BOTH
        Canvas{
            anchors.fill: parent
            visible: ((mOrientation == Qt.Horizontal) && ((mTickStyle == tickStyle.mBottomRight) || (mTickStyle == tickStyle.mBoth)))
            onPaint: {
                var ctx =getContext("2d")
                ctx.strokeStyle  ="black"
                ctx.lineWidth=2

                for(var i=0;i<((mMaximum-mMinimum)/mTickFrequency)+1;i++){
                    ctx.moveTo(backRect.x+2+(backRect.width-4)/mTickFrequency*i,backRect.y+backRect.height/2)
                    ctx.lineTo(backRect.x+2+(backRect.width-4)/mTickFrequency*i,backRect.y+backRect.height/4*3)
                    ctx.stroke()
                }
            }
        }

        // mOrientation:Horizpntal mTickStyle:TOPLEFT,BOTH
        Canvas{
            anchors.fill: parent
            visible: ((mOrientation == Qt.Horizontal) && ((mTickStyle == tickStyle.mTopLeft) || (mTickStyle == tickStyle.mBoth)))
            onPaint: {
                var ctx =getContext("2d")
                ctx.strokeStyle  ="black"
                ctx.lineWidth=2

                for(var i=0;i<((mMaximum-mMinimum)/mTickFrequency)+1;i++){
                    ctx.moveTo(backRect.x+2+(backRect.width-4)/mTickFrequency*i,backRect.y+backRect.height/2)
                    ctx.lineTo(backRect.x+2+(backRect.width-4)/mTickFrequency*i,backRect.y+backRect.height/4)
                    ctx.stroke()
                }
            }
        }

        // mOrientation:Vertical mTickStyle:mBottomRight,BOTH
        Canvas{
            anchors.fill: parent
            visible: ((mOrientation == Qt.Vertical) && ((mTickStyle == tickStyle.mBottomRight) || (mTickStyle == tickStyle.mBoth)))
            onPaint: {
                var ctx =getContext("2d")
                ctx.strokeStyle  ="black"
                ctx.lineWidth=2

                for(var i=0;i<((mMaximum-mMinimum)/mTickFrequency)+1;i++){
                    ctx.moveTo(backRect.x+backRect.width/2,backRect.y+2+(backRect.height-4)/mTickFrequency*i)
                    ctx.lineTo(backRect.x+backRect.width/4*3,backRect.y+2+(backRect.height-4)/mTickFrequency*i)
                    ctx.stroke()
                }
            }
        }

        // mOrientation:Vertical mTickStyle:TOPLEFT,BOTH
        Canvas{
            anchors.fill: parent
            visible: ((mOrientation == Qt.Vertical) && ((mTickStyle == tickStyle.mTopLeft) || (mTickStyle == tickStyle.mBoth)))
            onPaint: {
                var ctx =getContext("2d")
                ctx.strokeStyle  ="black"
                ctx.lineWidth=2

                for(var i=0;i<((mMaximum-mMinimum)/mTickFrequency)+1;i++){
                    ctx.moveTo(backRect.x+backRect.width/2,backRect.y+2+(backRect.height-4)/mTickFrequency*i)
                    ctx.lineTo(backRect.x+backRect.width/4,backRect.y+2+(backRect.height-4)/mTickFrequency*i)
                    ctx.stroke()
                }
            }
        }

        Slider{
            id:slider
            anchors.fill: parent
            orientation: mOrientation
            rotation:if(mRightToLeft == false){
                         0
                     }else{
                         180
                     }
            onValueChanged:{
                if (mCausesValidation) validating()
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
        if (mAutoSize){
            trackBar.width = backRect.width
            trackBar.height = backRect.height
        }else{
            trackBar.width = __controlWidth()
            trackBar.height = __controlHeight()
        }
    }

    // Set Control Width If No AutoSize
    function __controlWidth() {
        if (trackBar.width > mMaximumSize.width) return mMaximumSize.width
        if (trackBar.width < mMinimumSize.width) return mMinimumSize.width
        return trackBar.width
    }

    // Set Control Height If No AutoSize
    function __controlHeight() {
        if (trackBar.height > mMaximumSize.height) return mMaximumSize.height
        if (trackBar.height < mMinimumSize.height) return mMinimumSize.height
        return trackBar.height
    }
}

