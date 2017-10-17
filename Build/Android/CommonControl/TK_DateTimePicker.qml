import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQml 2.2
import QtQuick.Controls.Styles 1.4

ColumnLayout {
    id: item
    z: 2

    //    property	alias	id:                     Not customize   <=> CONTROL LIST: Name
    //    property	alias	mVisible                Not customize   <=> CONTROL LIST: Visible
    //    property	alias	x:                      Not customize   <=> CONTROL LIST: Location(x)
    //    property	alias	y:                      Not customize   <=> CONTROL LIST: Location(y)
    //    property	alias	anchors.margins:        Not customize   <=> CONTROL LIST: Margin(All)
    //    property	alias	anchors.leftMargin:     Not customize   <=> CONTROL LIST: Margin(Left)
    //    property	alias	anchors.rightMargin:    Not customize   <=> CONTROL LIST: Margin(Right)
    //    property	alias	anchors.topMargin:      Not customize   <=> CONTROL LIST: Margin(Top)
    //    property	alias	anchors.bottomMargin:   Not customize   <=> CONTROL LIST: Margin(Bottom)
    //    property	alias	anchors.top:            Not customize   <=> CONTROL LIST: Anchors(Top)
    //    property	alias	anchors.bottom:         Not customize   <=> CONTROL LIST: Anchors(Bottom)
    //    property	alias	anchors.right:          Not customize   <=> CONTROL LIST: Anchors(Right)
    //    property	alias	anchors.left:           Not customize   <=> CONTROL LIST: Anchors(Left)

    //    property	bool	mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property	bool 	mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property  alias   mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property  var     mImeMode                Not used        <=> CONTROL LIST: ImeMode
    //    property  var     mRightToLeftLayout      Not used        <=> CONTROL LIST: RightToLeftLayout

    property    bool            mChecked:                       false                   //  <=> CONTROL LIST: Checked
    property    string          mCustomFormat:                  "dddd, dd, MMMM, yyyy"  //  <=> CONTROL LIST: CustomFormat
    property    bool            mEnable:                        true                    //  <=> CONTROL LIST: Enabled
    property    alias           mMaxDate:                       calendar.maximumDate    //  <=> CONTROL LIST: MaxDate
    property    alias           mMinDate:                       calendar.minimumDate    //  <=> CONTROL LIST: MinDate
    property    string          mValue:                         ""                      //  <=> CONTROL LIST: Value
    property    size            mMaximumSize:                   Qt.size(600, 600)       //  <=> CONTROL LIST: MaximumSize
    property    size            mMinimumSize:                   Qt.size(0, 0)           //  <=> CONTROL LIST: MinimumSize
    property    color           mBackColor:                     "white"                 //  <=> CONTROL LIST: BackColor
    property    font            mCalendarFont                                           //  <=> CONTROL LIST: CalendarFont
    property    color           mCalendarForeColor:             "black"                 //  <=> CONTROL LIST: CalendarForeColor
    property    color           mCalendarMonthBackground:       "white"                 //  <=> CONTROL LIST: CalendarMonthBackground
    property    color           mCalendarTitleBackColor:        "white"                 //  <=> CONTROL LIST: CalendarTitleBackColor
    property    color           mCalendarTitleForeColor:        "black"                 //  <=> CONTROL LIST: CalendarTitleForeColor
    property    color           mCalendarTrailingForeColor:     "orange"                //  <=> CONTROL LIST: CalendarTrailingForeColor
    property    bool            mDropDownAlignRight:            false                   //  <=> CONTROL LIST: DropDownAlign
    property    font            mFont                                                   //  <=> CONTROL LIST: Font
    property    int             mFormat:                        1                       //  <=> CONTROL LIST: Format
    property    bool            mRightToLeft:                   false                   //  <=> CONTROL LIST: RightToLeft
    property    bool            mShowCheckBox:                  false                   //  <=> CONTROL LIST: ShowCheckBox
    property    bool            mShowUpDown:                    false                   //  <=> CONTROL LIST: ShowUpDown
    property    real            mWidth:                         400                     //  <=> CONTROL LIST: Size(Width)
    property    real            mHeight:                        40                      //  <=> CONTROL LIST: Size(Height)
    property    var             mCausesValidation:              RegExpValidator { regExp: /[0-9A-Fa-f.-]+/ }    //  <=> CONTROL LIST: CausesValidation
    property    int             mCursor:                        Qt.ArrowCursor          //  <=> CONTROL LIST: Cursor
    property    bool            mUseWaitCursor:                 false                   //  <=> CONTROL LIST: UseWaitCursor

    readonly    property    alias       selectedDate:                   calendar.selectedDate       //  CREATE NEW
    property                int         mBorderWidth:                   1                           //  CREATE NEW
    property                color       mBorderColor:                   "#000"                      //  CREATE NEW
    property                color       mDisableColor:                  "#6D6D6D"                   //  CREATE NEW
    property                color       mEnableColor:                   "#000"                      //  CREATE NEW
    property                url         icDown:                         ""                          //  CREATE NEW
    property                url         icUp:                           ""                          //  CREATE NEW
    property                real        mLeftPadding:                   8                           //  CREATE NEW
    property                date        mTodayDate                                                  //  CREATE NEW
    property                color       mSelectedColor:                 "#deecef"                   //  CREATE NEW
    property                color       mTodayColor:                    "#00d1ff"                   //  CREATE NEW

    // Step Option
    QtObject {
        id: step
        property int addOneDay:         1
        property int addOneWeek:        7
        property int minusOneDay:      -1
        property int minusOneWeek:     -7
    }

    // Format option
    QtObject {
        id: _format
        property int mLongFormat:       1
        property int mShortFormat:      2
        property int mTime:             3
        property int mCustom:           4
    }

    signal dateChanged()

    implicitHeight: mHeight
    implicitWidth: mWidth

    // DateTimePicker Content
    Rectangle {
        id: dateTimePicker
        width: mWidth
        height: mHeight
        border.width: mBorderWidth
        border.color: mBorderColor
        color: mBackColor

        Row {
            id: rowLayout
            anchors.fill: parent
            leftPadding: mShowCheckBox ? 0 : 8
            layoutDirection: mRightToLeft ? Qt.RightToLeft : Qt.LeftToRight

            // Show CheckBox When ShowCheckBox True
            CheckBox {
                id: checkBox
                visible: mShowCheckBox
                checked: mChecked
                width: parent.width / 10
                height: parent.height

                onCheckedChanged: {
                    textField.enabled = checkBox.checked
                }

                Component.onCompleted: {
                    textField.enabled = mShowCheckBox ? checkBox.checked : true
                }
            }

            // Date Time Info
            TextInput {
                id: textField
                height: parent.height
                validator: mCausesValidation
                width: mShowCheckBox ? (parent.width * 8 / 10 - mLeftPadding) : (parent.width * 9 / 10 - mLeftPadding)
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: mRightToLeft ? TextInput.AlignRight : TextInput.AlignLeft
                color: enabled ? mEnableColor : mDisableColor
                font: mFont

                Keys.onPressed: {
                    if (!mShowUpDown) {
                        if (event.key === Qt.Key_Up || event.key === Qt.Key_Down || event.key === Qt.Key_Left || event.key === Qt.Key_Right)
                            calendar.visible = true
                            calendar.focus = true
                    }
                }
            }

            // Button Show Calendar
            ToolButton {
                id: btn
                width: parent.width / 10
                height: parent.height
                visible: !mShowUpDown
                Image {
                    id: imgShow
                    source: icDown
                    anchors.fill: parent
                }

                onFocusChanged: {
                    if (!focus)
                        calendar.visible = false
                }

                onClicked: {
                    calendar.visible = !calendar.visible
                    if (checkBox.visible) {
                        textField.enabled = true
                        checkBox.checked = true
                    }
                }
            }

            // Button Show UpDown
            Column {
                id: btnUpDown
                width: parent.width / 10
                height: parent.height
                visible: mShowUpDown

                // Button Up
                ToolButton {
                    id: btnUp
                    width: parent.width
                    height: parent.height / 2

                    Image {
                        anchors.fill: parent
                        source: icUp
                    }

                    onClicked: {
                        calendar.setDate(step.addOneDay)
                    }
                }

                // Button Down
                ToolButton {
                    id: btnDown
                    width: parent.width
                    height: parent.height / 2

                    Image {
                        anchors.fill: parent
                        source: icDown
                    }

                    onClicked: {
                        calendar.setDate(step.minusOneDay)
                    }
                }
            }
        }
    }

    // Calendar Component
    Calendar {
        id: calendar
        enabled: mEnable
        visible: false
        focus: true
        Layout.alignment: mDropDownAlignRight ? Qt.AlignRight : Qt.AlignLeft

        // Calendar Custom Style
        style: CalendarStyle {
            gridVisible: false

            // Calendar Navigator Style
            navigationBar: Rectangle {
                height: calendar.height / 6
                color: mCalendarTitleBackColor

                Rectangle {
                    id: down
                    height: parent.height * 2 / 3
                    x: parent.width / 12
                    y: parent.height / 6
                    width: height
                    color: mCalendarTitleBackColor
                    border.width: 0.3
                    border.color: "grey"

                    Canvas {
                        anchors.fill: parent
                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.fillStyle = "grey"
                            ctx.beginPath();
                            ctx.moveTo(down.width / 3, down.height * 0.5);
                            ctx.lineTo(down.width * 2 / 3, down.height * 0.2);
                            ctx.lineTo(down.width * 2 / 3, down.height * 0.8);
                            ctx.closePath();
                            ctx.fill();
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            calendar.showPreviousMonth()
                        }
                    }
                }

                Label {
                    text: styleData.title
                    color: mCalendarTitleForeColor
                    font.pixelSize: parent.height / 3
                    anchors.centerIn: parent
                }

                Rectangle {
                    id: up
                    height: parent.height * 2 / 3
                    width: height
                    y: parent.height / 6
                    x: parent.width * 11 / 12 - width
                    color: mCalendarTitleBackColor
                    border.width: 0.3
                    border.color: "grey"
                    Canvas {
                        anchors.fill: parent
                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.fillStyle = "grey"
                            ctx.beginPath();
                            ctx.moveTo(up.width / 3, up.height * 0.2);
                            ctx.lineTo(up.width * 2 / 3, up.height * 0.5);
                            ctx.lineTo(up.width / 3, up.height * 0.8);
                            ctx.closePath();
                            ctx.fill();
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            calendar.showNextMonth()
                        }
                    }
                }
            }

            // Calendar Day Style
            dayDelegate: Rectangle {
                id: dayRect
                color: styleData.today ? mTodayColor : (styleData.selected ? mSelectedColor : mCalendarMonthBackground)
                Label {
                    id: lab
                    text: styleData.date.getDate()
                    font: mCalendarFont
                    anchors.centerIn: parent
                    color: styleData.visibleMonth && styleData.valid ? mCalendarForeColor : mCalendarTrailingForeColor
                    Component.onCompleted: {
                        if (styleData.today) {
                            mTodayDate = styleData.date;
                        }
                    }
                }
            }

            // Calendar Day of Week Style
            dayOfWeekDelegate: Rectangle {
                color: mCalendarMonthBackground
                height: 20
                Label {
                    text: styleData.dayOfWeek;
                    font: mCalendarFont
                    anchors.centerIn: parent

                    Component.onCompleted: {
                        var temp = styleData.dayOfWeek + 1
                        showDayName(temp)
                    }

                    function showDayName(dayOfWeek) {
                        switch(dayOfWeek) {
                            case Locale.Monday:
                                text = "Mon"
                                break
                            case Locale.Tuesday:
                                text = "Tue"
                                break
                            case Locale.Wednesday:
                                text = "Wed"
                                break
                            case Locale.Thursday:
                                text = "Thu"
                                break
                            case Locale.Friday:
                                text = "Fri"
                                break
                            case Locale.Saturday:
                                text = "Sat"
                                break
                            case Locale.Sunday:
                                text = "Sun"
                                break
                            default:
                                break
                        }
                    }
                }
            }
        }

        onClicked: calendar.visible = false

        onSelectedDateChanged: {
            textField.text = formatDate(__dateFormat())
            dateChanged()
        }

        // Set Date by Custom Format
        function formatDate(_format) {
            return Qt.formatDateTime(selectedDate, _format)
        }

        // Set Date
        function setDate(num) {
            var _dTmp = selectedDate
            _dTmp.setDate(_dTmp.getDate() + num)
            selectedDate = _dTmp
        }
    }

    Keys.onPressed: {
        __pressKeyNavigator(event.key)
        __getWidth()
        __getHeight()
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }

    Component.onCompleted: {
        textField.text = calendar.formatDate(__dateFormat())
        mValue = calendar.formatDate(__dateFormat())
    }

    // Datetime Format
    function __dateFormat() {
        switch(mFormat) {
            case _format.mLongFormat:
                return "dddd, dd, MMMM, yyyy"
            case _format.mShortFormat:
                return "dd/MM/yyyy"
            case _format.mTime:
                return "hh:mm:ss"
            case _format.mCustom:
                return mCustomFormat
            default:
                break
        }
    }

    // Press Navigator Key Handler
    function __pressKeyNavigator(_key) {
        switch (_key) {
            case Qt.Key_Up:
                if (!mShowUpDown)
                    calendar.setDate(step.minusOneWeek)
                else
                    calendar.setDate(step.addOneDay)
                break
            case Qt.Key_Down:
                if (!mShowUpDown)
                    calendar.setDate(step.addOneWeek)
                else
                    calendar.setDate(step.minusOneDay)
                break
            case Qt.Key_Left:
                if (!mShowUpDown)
                    calendar.setDate(step.minusOneDay)
                break
            case Qt.Key_Right:
                if (!mShowUpDown)
                    calendar.setDate(step.addOneDay)
                break
            default:
                break
        }
    }

    // Get Control Width
    function __getWidth() {
        if (dateTimePicker.width > mMaximumSize.width) return mMaximumSize.width
        if (dateTimePicker.width < mMinimumSize.width) return mMinimumSize.width
        return mWidth
    }

    // Get Control Height
    function __getHeight() {
        if (dateTimePicker.height > mMaximumSize.height) return mMaximumSize.height
        if (dateTimePicker.height < mMinimumSize.height) return mMinimumSize.height
        return mHeight
    }
}
