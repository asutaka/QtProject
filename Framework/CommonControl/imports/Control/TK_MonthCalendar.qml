import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Calendar {

    id: cal
    //    property	alias	id:                             Not customize   <=> CONTROL LIST: Name
    //    property	alias	enabled:                        Not customize   <=> CONTROL LIST: Enabled
    //    property	alias	visible:                        Not customize   <=> CONTROL LIST: Visibled
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

    //    property	bool	mGeneratemember                 Not used        <=> CONTROL LIST: Generatemember
    //    property	bool	mLocked                         Not used        <=> CONTROL LIST: Locked
    //    proprerty alias   mModifiers                      Not used        <=> CONTROL LIST: Modifiers
    //    property	int 	mCausesValidation               Not used        <=> CONTROL LIST: CausesValidation
    //    property  alias	mUseWaitCursor                  Not used        <=> CONTROL LIST: UseWaitCursor
    //    property  alias   mAllowDrop                      Not used        <=> CONTROL LIST: AllowDrop
    //    property  alias   mDock                           Not used        <=> CONTROL LIST: Dock
    //    proprerty alias   mCalendarDimensions             Not used        <=> CONTROL LIST: CalendarDimensions
    //    property  alias   mScrollChange                   Not used        <=> CONTROL LIST: ScrollChange

    //    property  alias   mFirstDayOfWeek                 Thinking        <=> CONTROL LIST: firstDayOfWeek
    //    property  alias   mMaxSelectionCount              Thinking        <=> CONTROL LIST: MaxSelectionCount
    //    property  alias   mSelectionRange                 Thinking        <=> CONTROL LIST: SelectionRange
    //    property  alias   mShowTodaysCircle               Thinking        <=> CONTROL LIST: ShowTodaysCircle
    //    property  alias   mRighToLeftLayout               Thinking        <=> CONTROL LIST: RighToLeftLayout
    //    property  alias   mTrailingForeColor              Thinking        <=> CONTROL LIST: TrailingForeColor



    property	size 	mMaximumSize:           Qt.size(1000, 1000)             // <=> CONTROL LIST: MaximumSize
    property	size 	mMinimumSize:           Qt.size(0, 0)                   // <=> CONTROL LIST: MinimumSize
    property    color   mBackColor:             "white"                         // <=> CONTROL LIST: BackColor
    property    string  mFont:                  "Consolas"                      // <=> CONTROL LIST: Font
    property    color   mForeColor:             "black"
    property    bool    mRightToLeft:           false                           // <=> CONTROL LIST: RightToLeft
    property    alias   mMaxDate:               cal.maximumDate                 // <=> CONTROL LIST: maxDate
    property    alias   mMinDate:               cal.minimumDate                 // <=> CONTROL LIST: minDate
    property    date    mTodayDate                                              // <=> CONTROL LIST: TodayDate
    property    alias   mShowWeekNumber:        cal.weekNumbersVisible          // <=> CONTROL LIST: ShowWeekNumber
    property    bool    mShowToday:             true                            // <=> CONTROL LIST: ShowToday
    property    color   mTitleBackColor:        "white"                         // <=> CONTROL LIST: TitleBackColor
    property    color   mTitleForeColor:        "black"                         // <=> CONTROL LIST: TitleForeColor


    property    color   mSelectedColor:         "#deecef"                       // new
    property    color   mTodayColor:            "#00d1ff"                       // new


    style: CalendarStyle {
        gridVisible: false

        navigationBar: Rectangle {
            height: cal.height / 6
            color: mTitleBackColor

            Rectangle {
                id: down
                height: parent.height * 2 / 3
                x: parent.width / 12
                y: parent.height / 6
                width: height
                color: mTitleBackColor
                border.width: 0.3
                border.color: "grey"

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.fillStyle = "grey"
                        ctx.beginPath();
                        ctx.moveTo(down.width/3, down.height*0.5);
                        ctx.lineTo(down.width*2/3, down.height*0.2);
                        ctx.lineTo(down.width*2/3, down.height*0.8);
                        ctx.closePath();
                        ctx.fill();
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        showPreviousMonth();
                    }
                }
            }

            Label {

                text: styleData.title
                color: mTitleForeColor
                font.pixelSize: parent.height / 3
                anchors.centerIn: parent
            }


            Rectangle {
                id: up
                height: parent.height * 2 / 3
                width: height
                y: parent.height / 6
                x: parent.width * 11 / 12 - width
                color: mTitleBackColor
                border.width: 0.3
                border.color: "grey"
                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.fillStyle = "grey"
                        ctx.beginPath();
                        ctx.moveTo(up.width/3, up.height* 0.2);
                        ctx.lineTo(up.width*2/3, up.height* 0.5);
                        ctx.lineTo(up.width/3, up.height*0.8);
                        ctx.closePath();
                        ctx.fill();
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        showNextMonth();
                    }
                }
            }
        }


        dayDelegate: Rectangle {
            id: dayRect
            color: styleData.today ? mTodayColor : (styleData.selected ? mSelectedColor : mBackColor)
                                     //:(styleData.visibleMonth && styleData.valid ? mBackColor : mBackColor)
            Label {
                id: lab
                text: styleData.date.getDate()
                font.family: mFont
                font.pixelSize: parent.width / 3
                anchors.centerIn: parent
                color: styleData.visibleMonth && styleData.valid ? mForeColor : "grey"
                Component.onCompleted: {
                    if(styleData.today) {
                        mTodayDate = styleData.date;
                    }
                }
            }


        }
        dayOfWeekDelegate: Rectangle {
            color: mBackColor
            height: 20
            Label {
                text: styleData.dayOfWeek;
                font.family: mFont
                font.pixelSize: parent.width * 2 / 5
                anchors.centerIn: parent

                Component.onCompleted: {
                    var temp = styleData.dayOfWeek + 1;
                    if(temp === 7) {
                        text = "Sun"
                    }else if(temp === Locale.Monday) {
                        text = "Mon"
                    }else if(temp === Locale.Tuesday) {
                        text = "Tue"
                    }else if(temp === Locale.Wednesday) {
                        text = "Wed"
                    }else if(temp === Locale.Thursday) {
                        text = "Thu"
                    }else if(temp === Locale.Friday) {
                        text = "Fri"
                    }else if(temp === Locale.Saturday) {
                        text = "Sat"
                    }else {

                    }
                }
            }
        }
    }

    Rectangle {
        visible: mShowToday
        anchors.top: parent.bottom

        width: parent.width
        height: parent.height / 10
        Label {
            anchors.centerIn: parent
            text: ""
            font.pixelSize: parent.width / 17

            Component.onCompleted: {
                text = mTodayDate.getDate() + "/" + (mTodayDate.getUTCMonth() + 1) + "/" + mTodayDate.getFullYear();
            }
        }
    }
    Component.onCompleted: {
        if(cal.width <= mMinimumSize.width) {
            cal.width = mMinimumSize.width

        }

        if(cal.width >= mMaximumSize.width) {
            cal.width = mMaximumSize.width
        }

        if(cal.height <= mMinimumSize.height) {
            cal.height = mMinimumSize.height
        }

        if(cal.height >= mMaximumSize.height) {
            cal.height = mMaximumSize.height
        }

    }
}
