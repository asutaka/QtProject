import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
Rectangle {
    id: spinner
    //    property	alias	id:                             Not customize   <=> CONTROL LIST: Name/
    //    property	alias	enabled:                        Not customize   <=> CONTROL LIST: Enabled/
    //    property	alias	visible:                        Not customize   <=> CONTROL LIST: Visibled/
    //    property	alias	anchors.top:                    Not customize   <=> CONTROL LIST: Anchors(Top)
    //    property	alias	anchors.bottom:                 Not customize   <=> CONTROL LIST: Anchors(Bottom)
    //    property	alias	anchors.right:                  Not customize   <=> CONTROL LIST: Anchors(Right)
    //    property	alias	anchors.left:                   Not customize   <=> CONTROL LIST: Anchors(Left)
    //    property	alias	x:                              Not customize   <=> CONTROL LIST: Location(x)
    //    property	alias	y:                              Not customize   <=> CONTROL LIST: Location(y)
    //    property	alias	width:                          Not customize   <=> CONTROL LIST: Size(Width)
    //    property	alias	height:                         Not customize   <=> CONTROL LIST: Size(Height)
    //    property	alias	anchors.margins:                Not customize   <=> CONTROL LIST: Margin(All)
    //    property	alias	anchors.leftMargin:             Not customize   <=> CONTROL LIST: Margin(Left)
    //    property	alias	anchors.rightMargin:            Not customize   <=> CONTROL LIST: Margin(Right)
    //    property	alias	anchors.topMargin:              Not customize   <=> CONTROL LIST: Margin(Top)
    //    property	alias	anchors.bottomMargin:           Not customize   <=> CONTROL LIST: Margin(Bottom)

    //    property	bool	mGeneratemember                 Not used        <=> CONTROL LIST: Generatemember/
    //    property	bool	mLocked                         Not used        <=> CONTROL LIST: Locked/
    //    property  alias   mModifiers                      Not used        <=> CONTROL LIST: Modifiers/
    //    property	bool	mImeMode                        Not used        <=> CONTROL LIST: ImeMode
    //    property	bool	mLocked                         Not used        <=> CONTROL LIST: Locked/
    //    property  alias   mAllowDrop                      Not used        <=> CONTROL LIST: AllowDrop/
    //    property  alias   mImeMode                        Not used        <=> CONTROL LIST: ImeMode/
    //    property  alias   mDock                           Not used        <=> CONTROL LIST: Dock/

    //    property  alias   mUpDownAlign:                   Not used        <=> CONTROL LIST: UpDownAlign

    property	size 	mMaximumSize:           Qt.size(1000, 1000)                 // <=> CONTROL LIST: MaximumSize
    property	size 	mMinimumSize:           Qt.size(0, 0)                       // <=> CONTROL LIST: MinimumSize
    property    alias   mBackgroundColor:       spinner.color                       // <=> CONTROL LIST: BackColor
    property    string  mFont:                  "Consolas"                          // <=> CONTROL LIST: Font
    property    color   mForeColor:             "#66a0e2"                           // <=> CONTROL LIST: ForeColor
    property    bool    mRightToLeft:           false                               // <=> CONTROL LIST: RightToLeft
    property    int     mTextAlignH:            Text.AlignHCenter                   // <=> CONTROL LIST: TextAlign
    property    int     mTextAlignV:            Text.AlignVCenter                   // <=> CONTROL LIST: TextAlign
    property    bool    readOnly:               false                               // <=> CONTROL LIST: ReadOnly
    property    bool    mCausesValidation:      true                                // <=> CONTROL LIST: CausesValidation
    property    double  mMaximum:               12                                  // <=> CONTROL LIST: Maximum
    property    double  mMinimum:               1                                   // <=> CONTROL LIST: Minimum
    property    int     mDecimalPlaces:         5                                   // <=> CONTROL LIST: ThousandSeparator
    property    bool    mThousandsSeparator:    false                               // <=> CONTROL LIST: DecimalPlaces
    property    bool    mHexadecimal:           false                               // <=> CONTROL LIST: Hexadecimal
    property    int     mIncrement:             1                                   // <=> CONTROL LIST: Increment
    property    bool    mUseWaitCursor:         false                               // <=> CONTROL LIST: UseWaitCursor
    property    double  mValue:                 mMinimum                            // <=> CONTROL LIST: Value
    property    bool    mAutoSize:              true                                // <=> CONTROL LIST: Autosize
    property    bool    mInterceptArrowKeys:    true                                // <=> CONTROL LIST: InterceptArrowKeys
    property    int     mBorderStyle:           borderStyle.mFixedSingle            // <=> CONTROL LIST: BorderStyle


    property    var     mMode:                  Math.round((mMaximum - mMinimum + 1) / mIncrement)              //create new. Set mod for tumbler
    property    color   mArrowColor:            "#bdc9d7"                           //create new
    property    int     mVisibleItemCount:      1                                   //create new

    // Border Style Option
    QtObject {
        id: borderStyle
        property int mNone: 1
        property int mFixedSingle: 2
        property int mFixed3D: 3
    }

    signal validating()

    //default value
    mBackgroundColor: "white"
    border.width: 1
    layer.effect: DropShadow {
        verticalOffset: 1
        horizontalOffset: 1
    }

    property int fontSizeFocus: height / 8
    property int fontSizeEdge: fontSizeFocus / 2
    property int durationTime: 30


    function formatText(count, modelData) {
        var temp = Math.round((modelData * mIncrement + mMinimum) * Math.pow(10, mDecimalPlaces)) / Math.pow(10, mDecimalPlaces);
        var x = temp.toLocaleString();
        if(mThousandsSeparator) {
            return x;
        }
        if(mHexadecimal) {
            return temp.toString(16).toUpperCase();
        }
        return temp;
    }

    function formatNumber(count, modelData) {
        return Math.round((modelData * mIncrement + mMinimum) * Math.pow(10, mDecimalPlaces)) / Math.pow(10, mDecimalPlaces);
    }

    Component {
        id: delegateComponent
        Label {
            id: labelSetUp
            color: mForeColor
            font.family: mFont
            text: formatText(Tumbler.tumbler.count, modelData)
            opacity:0.4 + Math.max(1 - Math.abs(Tumbler.displacement), 0) * 0.6
            horizontalAlignment: mTextAlignH
            verticalAlignment: mTextAlignV
            font.pixelSize: (modelData === lineNo.currentIndex ? fontSizeFocus : fontSizeEdge)
            Behavior on opacity { PropertyAnimation { duration: durationTime }}
            Behavior on font.pixelSize { PropertyAnimation { duration: durationTime }}


            Text {
                id: temp
                visible: false
                font.pixelSize: spinner.fontSizeFocus
                text: labelSetUp.text
                Component.onCompleted: {
                    if(mAutoSize) {
                        if(temp.width > spinner.width) {
                            spinner.width = temp.width;
                        }
                    }
                }
            }

        }


    }



    Tumbler {
        id: lineNo
        anchors.centerIn: parent
        width: parent.width
        height: 2 * parent.height / 3
        model: mMode
        delegate: delegateComponent
        visibleItemCount: mVisibleItemCount

        Behavior on currentIndex { PropertyAnimation { duration: durationTime }}

        Component.onCompleted:  {
            currentIndex = (mValue - mMinimum) / mIncrement;
        }

        onCurrentIndexChanged: {
            if (mCausesValidation) { validating() }
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: mouse.accepted = false;
            onPressed: mouse.accepted = false;
            onReleased: mouse.accepted = false;
            onDoubleClicked: mouse.accepted = false;
            onPositionChanged: mouse.accepted = false;
            onPressAndHold: mouse.accepted = false;
            cursorShape: mUseWaitCursor ? (containsMouse ? Qt.WaitCursor : Qt.ArrowCursor) : Qt.ArrowCursor
        }
    }

    Rectangle {
        id: up
        y: spinner.border.width
        x: spinner.border.width
        width:  parent.width - 2 * x
        height: parent.height/6 - y
        color: mBackgroundColor

        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle = mArrowColor
                ctx.beginPath();
                ctx.moveTo(up.width/3, up.height* 0.8);
                ctx.lineTo(up.width*2/3, up.height* 0.8);
                ctx.lineTo(up.width/2, up.height*0.2);
                ctx.closePath();
                ctx.fill();
            }
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onPressed: {
                if(!readOnly)
                    lineNo.currentIndex = lineNo.currentIndex - 1
            }
            cursorShape: mUseWaitCursor ? (containsMouse ? Qt.WaitCursor : Qt.ArrowCursor) : Qt.ArrowCursor
        }
    }

    Rectangle {
        id: down
        color: mBackgroundColor
        y: 5*parent.height/6
        x: spinner.border.width
        width:  parent.width - 2 * x
        height: parent.height/6 - spinner.border.width

        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle = mArrowColor
                ctx.beginPath();
                ctx.moveTo(down.width/3, down.height*0.2);
                ctx.lineTo(down.width*2/3, down.height*0.2);
                ctx.lineTo(down.width/2, down.height*0.8);
                ctx.closePath();
                ctx.fill();
            }
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onPressed: {
                if(!readOnly)
                    lineNo.currentIndex = lineNo.currentIndex + 1
            }
            cursorShape: mUseWaitCursor ? (containsMouse ? Qt.WaitCursor : Qt.ArrowCursor) : Qt.ArrowCursor
        }
    }

    Component.onCompleted: {
        if(spinner.width <= mMinimumSize.width) {
            spinner.width = mMinimumSize.width

        }

        if(spinner.width >= mMaximumSize.width) {
            spinner.width = mMaximumSize.width
        }

        if(spinner.height <= mMinimumSize.height) {
            spinner.height = mMinimumSize.height
        }

        if(spinner.height >= mMaximumSize.height) {
            spinner.height = mMaximumSize.height
        }
        if(mInterceptArrowKeys) {
            spinner.focus = true
        }

        switch (mBorderStyle) {
            case borderStyle.mNone:
                spinner.border.width = 0
                spinner.layer.enabled = false
                break
            case borderStyle.mFixedSingle:
                spinner.layer.enabled = false
                spinner.border.width = spinner.border.width
                break
            case borderStyle.mFixed3D:
                spinner.border.width = 0
                spinner.layer.enabled = true
                break
            default:
                break
        }
    }


    Keys.onPressed: {
        if(!readOnly && mInterceptArrowKeys){
            if(event.key === Qt.Key_Up) {
                lineNo.currentIndex = lineNo.currentIndex - 1
            }
            if(event.key === Qt.Key_Down)
                lineNo.currentIndex = lineNo.currentIndex + 1

            event.accepted = true;
        }
    }
}
