import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Item {
    id: boss

    width: 200
    height: 200
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
    property    date    mTodayDate:             cal.mTodayDate                                              // <=> CONTROL LIST: TodayDate
    property    alias   mMaxDate:               cal.maximumDate                 // <=> CONTROL LIST: maxDate
    property    alias   mMinDate:               cal.minimumDate                 // <=> CONTROL LIST: minDate
    property    bool    mShowToday:             true                            // <=> CONTROL LIST: ShowToday
    property    color   mTitleBackColor:        "white"                         // <=> CONTROL LIST: TitleBackColor
    property    color   mTitleForeColor:        "black"                         // <=> CONTROL LIST: TitleForeColor
    property    bool	mUseWaitCursor:         false                           // <=> CONTROL LIST: UseWaitCursor
    property    bool    mCausesValidation:      false                           // <=> CONTROL LIST: CausesValidation
    property    int     mScrollChange:          1                               // <=> CONTROL LIST: ScrollChange
    property    bool    mShowTodaysCircle:      true                            // <=> CONTROL LIST: ShowTodaysCircle
    property    int     mMaxSelectionCount:     7                               // <=> CONTROL LIST: MaxSelectionCount
    property    bool    mShowWeekNumber:        true
    property    int     mCursor:                Qt.ArrowCursor              // <=> CONTROL LIST: Cursor

    property    color   mTrailingForeColor:     "grey"                          // <=> CONTROL LIST: TrailingForeColor
    //Saturday: -1 Sunday: 0 Monday: 1
    property    int     mFirstDayOfWeek:        0                               // <=> CONTROL LIST: FirstDayOfWeek

    //new Date("2017-09-06")
    property    date    mSelectionRangeStartDate:   new Date()                  // <=> CONTROL LIST: SelectionRange
    property    date    mSelectionRangeEndDate:     new Date()                  // <=> CONTROL LIST: SelectionRange
    property    alias   mRightToLeftLayout:     cal.rightToLeftLayout           // <=> CONTROL LIST: RightToLeftLayout
    property    int     xDimension: 1                                           // <=> CONTROL LIST: CalendarDimension
    property    int     yDimension: 1                                           // <=> CONTROL LIST: CalendarDimension
    Component.onCompleted: {
        if(xDimension * yDimension == 1) cal.visible = true;
        else {
            col.visible = true;
        }
    }

    CalendarControl {
       id: cal
       visible: false
       height:         boss.height
       width:          boss.width
       mMaximumSize:           boss.mMaximumSize
       mMinimumSize:           boss.mMinimumSize
       mBackColor:          boss.mBackColor
       mFont:               boss.mFont
       mForeColor:          boss.mForeColor
       mRightToLeft:        boss.mRightToLeft
       mShowWeekNumber:     boss.mShowWeekNumber
       mShowToday:          boss.mShowToday
       mTitleBackColor:     boss.mTitleBackColor
       mTitleForeColor:     boss.mTitleForeColor
       mUseWaitCursor:      boss.mUseWaitCursor
       mCursor:             boss.mCursor
       mCausesValidation:   boss.mCausesValidation
       mScrollChange:       boss.mScrollChange
       mShowTodaysCircle:   boss.mShowTodaysCircle
       mMaxSelectionCount:  boss.mMaxSelectionCount
       mTrailingForeColor:  boss.mTrailingForeColor
       //Saturday: -1 Sunday: 0 Monday: 1
       mFirstDayOfWeek:     boss.mFirstDayOfWeek

       //new Date("2017-09-06")
       mSelectionRangeStartDate:   boss.mSelectionRangeStartDate
       mSelectionRangeEndDate:     boss.mSelectionRangeEndDate

    }

    Column {
        id: col
        visible: false
        Repeater {
            id: rep
            model: yDimension
            Row {
                id: row
                property int mIndex: index

                Repeater {
                    id: cell
                    model: xDimension

                    CalendarControl {
                        width:              boss.width
                        height:             boss.height
                        mBackColor:         boss.mBackColor
                        mFont:              boss.mFont
                        mForeColor:         boss.mForeColor
                        mRightToLeft:       boss.mRightToLeft
                        mTitleBackColor:    boss.mTitleBackColor
                        mTitleForeColor:    boss.mTitleForeColor
                        mUseWaitCursor:     boss.mUseWaitCursor
                        mCursor:            boss.mCursor
                        mCausesValidation:  boss.mCausesValidation
                        mScrollChange: 1
                        mShowTodaysCircle:  false
                        mMaxSelectionCount: 0

                        mShowWeekNumber: false
                        mShowLeftArrow: false
                        mShowRightArrow: false
                        mShowToday: false
                        mTrailingForeColor: "white"
                        mSelectedColor: "white"
                        mDayClickedEnable: false
                        onArrowLeftClicked: {
                            showNextMonth();
                            col.previousMonth();
                        }
                        onArrowRightClicked: {
                            showPreviousMonth();
                            col.nextMonth();
                        }


                    }
                }

                function nextMonth() {
                    for(var i = 0; i < cell.model; i++) {
                        cell.itemAt(i).showNextMonth();
                    }
                }

                function previousMonth() {
                    for(var i = 0; i < cell.model; i++) {
                        cell.itemAt(i).showPreviousMonth();
                    }
                }

                function init(){
                    for(var i = 0; i < cell.model; i++) {
                        var plus = row.mIndex * cell.model + i
                        if(plus == 0) {
                            cell.itemAt(i).mShowLeftArrow = true;

                        }
                        if(plus == cell.model - 1) {
                            cell.itemAt(i).mShowRightArrow = true;

                        }
                        if(plus != 0 && plus != xDimension * yDimension - 1) {

                        }

                        for(var j = 0; j < plus; j++) {
                            cell.itemAt(i).showNextMonth();
                        }
                    }
                }

                Component.onCompleted: {
                    mIndex = index
                    init();
                }
            }

        }

        function nextMonth() {
            for(var i = 0; i < rep.model; i++) {
                rep.itemAt(i).nextMonth();
            }
        }


        function previousMonth() {
            for(var i = 0; i < rep.model; i++) {
                rep.itemAt(i).previousMonth();
            }
        }
    }
}
