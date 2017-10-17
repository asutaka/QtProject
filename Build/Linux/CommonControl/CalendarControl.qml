import QtQuick 2.5
import QtQuick.Controls 2.0


CalendarBase {

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
    //    property  alias   mAllowDrop                      Not used        <=> CONTROL LIST: AllowDrop
    //    property  alias   mDock                           Not used        <=> CONTROL LIST: Dock


    property	size 	mMaximumSize:           Qt.size(1000, 1000)             // <=> CONTROL LIST: MaximumSize
    property	size 	mMinimumSize:           Qt.size(0, 0)                   // <=> CONTROL LIST: MinimumSize
    property    color   mBackColor:             "white"                         // <=> CONTROL LIST: BackColor
    property    string  mFont:                  "NotoSans-Regular"                      // <=> CONTROL LIST: Font
    property    color   mForeColor:             "black"
    property    bool    mRightToLeft:           false                           // <=> CONTROL LIST: RightToLeft
    property    alias   mMaxDate:               cal.maximumDate                 // <=> CONTROL LIST: maxDate
    property    alias   mMinDate:               cal.minimumDate                 // <=> CONTROL LIST: minDate
    property    date    mTodayDate                                              // <=> CONTROL LIST: TodayDate
    property    alias   mShowWeekNumber:        cal.weekNumbersVisible          // <=> CONTROL LIST: ShowWeekNumber
    property    bool    mShowToday:             true                            // <=> CONTROL LIST: ShowToday
    property    color   mTitleBackColor:        "white"                         // <=> CONTROL LIST: TitleBackColor
    property    color   mTitleForeColor:        "black"                         // <=> CONTROL LIST: TitleForeColor
    property    bool	mUseWaitCursor:         false                           // <=> CONTROL LIST: UseWaitCursor
    property    bool    mCausesValidation:      false                           // <=> CONTROL LIST: CausesValidation
    property    int     mScrollChange:          1                               // <=> CONTROL LIST: ScrollChange
    property    bool    mShowTodaysCircle:      true                            // <=> CONTROL LIST: ShowTodaysCircle
    property    int     mMaxSelectionCount:     7                               // <=> CONTROL LIST: MaxSelectionCount
    property    alias   mRightToLeftLayout:     cal.rightToLeftLayout
    property    int     mCursor:                Qt.ArrowCursor              // <=> CONTROL LIST: Cursor

    property    color   mTrailingForeColor:     "grey"                          // <=> CONTROL LIST: TrailingForeColor
    //Saturday: -1 Sunday: 0 Monday: 1
    property    int     mFirstDayOfWeek:        0                               // <=> CONTROL LIST: FirstDayOfWeek

    //new Date("2017-09-06")
    property    date    mSelectionRangeStartDate:   new Date()                  // <=> CONTROL LIST: SelectionRange
    property    date    mSelectionRangeEndDate:     new Date()                  // <=> CONTROL LIST: SelectionRange

    property    color   mSelectedColor:         "#deecef"                       // new
    property    color   mTodayColor:            "#00d1ff"                       // new
    property    bool    mDayClickedEnable:      true                           // new

    mShowWeekNumber: true
    property    bool    mShowLeftArrow:         true
    property    bool    mShowRightArrow:        true

    property    int     mCurrentMonth:          visibleMonth

    signal validating()
    signal arrowLeftClicked()
    signal arrowRightClicked()

    property var startSelectingDate
    property int reset: 0
    property var selectingDate: getSelectingDate(mSelectionRangeStartDate, mSelectionRangeEndDate, 999);


    LayoutMirroring.enabled: mRightToLeftLayout
    LayoutMirroring.childrenInherit: mRightToLeftLayout
    onPressed: {

        if(reset == 0) {
            startSelectingDate = date;
        }

        var lastSelectingDate = date;
        if(startSelectingDate <= lastSelectingDate)
            selectingDate = getSelectingDate(startSelectingDate, lastSelectingDate, mMaxSelectionCount);
        else {
            selectingDate = getSelectingDateBack(startSelectingDate, lastSelectingDate, mMaxSelectionCount);
        }

        reset = 1;

    }

    function isSelected(selectingDate, styleDataDate) {
        var tempArray = [];
        for(var i = 0; i < selectingDate.length; i++) {
            selectingDate[i].setHours(styleDataDate.getHours());
            tempArray.push(selectingDate[i].getTime());
        }
        if(tempArray.indexOf(styleDataDate.getTime()) != -1) return true;
        return false;
    }

    //use when startSelectingDate < lastSelectingDate
    function getSelectingDateBack(startSelectingDate, lastSelectingDate, limitDays) {
        var dates = [],
                  currentDate = startSelectingDate,
                  addDays = function(days) {
                    var date = new Date(this.valueOf());
                    date.setDate(date.getDate() + days);
                    return date;
                  };
              while (currentDate >= lastSelectingDate) {
                dates.push(currentDate);
                if(dates.length >= limitDays) break;
                currentDate = addDays.call(currentDate, -1);
              }
        return dates;
    }

    function getSelectingDate(startSelectingDate, lastSelectingDate, limitDays) {
        var dates = [],
                  currentDate = startSelectingDate,
                  addDays = function(days) {
                    var date = new Date(this.valueOf());
                    date.setDate(date.getDate() + days);
                    return date;
                  };
              while (currentDate <= lastSelectingDate) {
                dates.push(currentDate);
                if(dates.length >= limitDays) break;
                currentDate = addDays.call(currentDate, 1);
              }
        return dates;
    }


    onReleased: {
        reset = 0;
    }

    __locale: (mFirstDayOfWeek == 1) ? Qt.locale("fr") : (mFirstDayOfWeek == -1 ? Qt.locale("ar") : Qt.locale());

    style: CalendarBaseStyle {
        gridVisible: false

        navigationBar: Rectangle {
            height: cal.height / 6
            color: mTitleBackColor
            Rectangle {
                id: down
                visible: mShowLeftArrow
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
                        for(var i = 0; i < cal.mScrollChange; i++) {
                            if(mRightToLeftLayout) {
                                showNextMonth();
                            }else {
                                showPreviousMonth();
                            }
                            arrowLeftClicked();
                        }
                    }
                }
            }

            Label {

                text: Qt.locale().monthName(visibleMonth, Locale.LongFormat) + " " + cal.visibleYear
                //text: styleData.title

                color: mTitleForeColor
                font.family: mFont
                font.pixelSize: parent.height / 3
                anchors.centerIn: parent
            }


            Rectangle {
                id: up
                visible: mShowRightArrow
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
                        for(var i = 0; i < cal.mScrollChange; i++) {
                            if(mRightToLeftLayout) {
                                showPreviousMonth();
                            }else {
                                showNextMonth();
                            }

                        arrowRightClicked();

                        }
                    }
                }
            }


        }

        dayDelegate: Rectangle {
            id: dayRect
            color:  styleData.today ? mTodayColor
                                    : ((isSelected(selectingDate, styleData.date)) ? mSelectedColor
                                                                                                         : mBackColor)
                                     //:(styleData.visibleMonth && styleData.valid ? mBackColor : mBackColor)
            //visible: styleData.visibleMonth

            Label {
                id: lab
                text: styleData.date.getDate()
                font.family: mFont
                font.pixelSize: parent.width / 3
                anchors.centerIn: parent
                color: styleData.visibleMonth && styleData.valid ? mForeColor : mTrailingForeColor
                Component.onCompleted: {
                    if(styleData.today) {
                        mTodayDate = styleData.date;
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                enabled: !mDayClickedEnable
                onClicked: {
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
                    text = Qt.locale().dayName((styleData.dayOfWeek + 7 + mFirstDayOfWeek) % 7, Locale.ShortFormat);
                }
            }
        }
    }

    Rectangle {
        visible: mShowToday
        anchors.top: parent.bottom

        width: parent.width
        height: parent.height / 10
        Rectangle {
            id: todayCircle
            visible: mShowTodaysCircle
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: parent.height / 6
            anchors.leftMargin: parent.width / 4
            width: 20
            height: parent.height * 2 / 3
            border.width: 1
            border.color: "#bde4ec"

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                onClicked: {
                    cal.visibleMonth = cal.mTodayDate.getUTCMonth();
                    cal.visibleYear = cal.mTodayDate.getFullYear();
                }

            }
        }

        Label {
            anchors.left: todayCircle.right
            anchors.leftMargin: 5
            anchors.top: todayCircle.top
            anchors.topMargin: (todayCircle.height - height) / 2
            text: ""
            font.family: mFont
            font.pixelSize: parent.width / 20

            Component.onCompleted: {
                text = mTodayDate.toLocaleDateString(Qt.locale(), Locale.ShortFormat);
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                onClicked: {
                    cal.visibleMonth = cal.mTodayDate.getUTCMonth();
                    cal.visibleYear = cal.mTodayDate.getFullYear();
                }
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


    onClicked: {
        validating();
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: mouse.accepted = false;
        onPressed: mouse.accepted = false;
        onReleased: mouse.accepted = false;
        onDoubleClicked: mouse.accepted = false;
        onPositionChanged: mouse.accepted = false;
        onPressAndHold: mouse.accepted = false;
        cursorShape: {
            if(mUseWaitCursor) {
                if(containsMouse) Qt.WaitCursor;
                else    mCursor;
            }else {
                mCursor;
            }
        }    }
}



