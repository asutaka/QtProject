import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "qrc:/Control/spinner"
import "qrc:/Control/dateTime"
import "qrc:/StatusBar"
import ControlApp 1.0

Rectangle {
    x:0
    y:0
    width: 1024
    height: 640
    color: "#EEE8CD"

    signal setCurrentIndex(int _setCurIndex)
    property alias objDateTimeVM: dateTimeVM
    property int day
    property int month
    property int year
    DateTimeVM {
        id:dateTimeVM
    }

    Rectangle{
        width: 350
        height: 50
        color: "#232732"
        border.color: "#F4A460"
        border.width: 1
        radius: 2
        Text {
            anchors.centerIn: parent
            id: lblDateTime
            font.pixelSize: 30
            color: "#FFE4B5"
            text: qsTr("Date Time Setting")
        }
    }
    Rectangle{
        y:50
        width: 350
        height: 50
        color: "#232732"
        border.color: "#CD853F"
        border.width: 1
        radius: 2

        Rectangle{
            id:btnDateSetting
            x:50
            y:10
            width: 120
            height: 30
            color: "green"
            border.color: "#F4A460"
            border.width: 1
            radius: 5
            Text {
                anchors.centerIn: parent
                id: lblDate
                font.pixelSize: 20
                color: "#FFE4B5"
                text: qsTr("Date")
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    btnDateSetting.color ="#90EE90"
                    tabSettingDate.visible=true
                    tabSettingTime.visible=false
                }
                onReleased: {
                    btnDateSetting.color ="green"
                }
            }
        }
        Rectangle{
            id:btnTimeSetting
            x:180
            y:10
            width: 120
            height: 30
            color: "green"
            border.color: "#F4A460"
            border.width: 1
            radius: 5
            Text {
                anchors.centerIn: parent
                id: lblTime
                font.pixelSize: 20
                color: "#FFE4B5"
                text: qsTr("Time")
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    btnTimeSetting.color ="#90EE90"
                    tabSettingDate.visible=false
                    tabSettingTime.visible=true

                }
                onReleased: {
                    btnTimeSetting.color ="green"
                }
            }
        }

    }
    Rectangle{
        x: 350
        y:0
        width: 674
        height: 100
        color: "transparent"
        border.color: "#F4A460"
        border.width: 1
        Image {
            anchors.fill: parent
            id: date_time_scr
            source: "qrc:/Images/date_time_scr.png"
        }
    }

    Rectangle{
        id:tabSettingDate
        x:0
        y:100
        width: 1024
        height: 460
        color: "#788287"
        visible: true

        Spinner2
        {
            id: spinnerYear
            x: 50
            y: 100
            spinWidth:80
            rotationState: 0
            mod: 12
            startNumber: 2015
            fontSizeFocus: 28
            fontSizeEdge: 15
            onCurrIndexChanged:  {
                var setYear1=new Date()
                setYear1.setFullYear(currIndex+startNumber-1)
                myCalendar.selectedDate=setYear1
                console.log("currIndex123: " + spinnerYear.currIndex)
                console.log("date1: "+setYear1)
            }
        }
        Rectangle{
            x:50
            y: 100+180
            width: spinnerMonth.width
            height: 20
            color: "transparent"

            Text {
                anchors.centerIn: parent
                id: txtYear
                text: qsTr("Year")
                font.pixelSize: 20
                color: "#FFCC66"

            }
        }
        Spinner2
        {
            id:spinnerMonth
            x: 170
            y: 100
            spinWidth:80
            rotationState: 0
            mod: 12
            startNumber: 1
            fontSizeFocus: 31
            fontSizeEdge: 15
            onCurrIndexChanged: {
                var setMonth1= new Date()
                setMonth1.setMonth(currIndex-1)
                myCalendar.selectedDate=setMonth1
            }
        }
        Rectangle{
            x:170
            y: 100+180
            width: spinnerMonth.width
            height: 20
            color: "transparent"

            Text {
                anchors.centerIn: parent
                id: txtMonth
                text: qsTr("Month")
                font.pixelSize: 20
                color: "#FFCC66"

            }
        }
        Rectangle {
            x: 350
            y:5
            width: 670
            height: 450
            Calendar {
                id:myCalendar
                anchors.fill: parent
                weekNumbersVisible: true
                style: CalendarStyle {
                    gridVisible: false

                    dayDelegate: Rectangle {
                        gradient: Gradient {
                            GradientStop {
                                position: 0.00
                                color: styleData.selected ? "white" : (styleData.visibleMonth && styleData.valid ? "#444" : "#666");
                            }
                            GradientStop {
                                position: 1.00
                                color: styleData.selected ? "#1874CD" : (styleData.visibleMonth && styleData.valid ? "#111" : "#666");
                            }
                        }

                        Label {
                            text: styleData.date.getDate()
                            font.pixelSize: 13
                            anchors.centerIn: parent
                            color: styleData.valid ? "white" : "grey"
                        }

                        Rectangle {
                            width: parent.width
                            height: 1
                            color: "white"
                            anchors.bottom: parent.bottom
                        }

                        Rectangle {
                            width: 1
                            height: parent.height
                            color: "white"
                            anchors.right: parent.right
                        }
                    }

                    navigationBar: Rectangle {
                        height: myCalendar.height / 6
                        color: "white"

                        Rectangle {
                            id: down
                            height: parent.height * 2 / 3
                            x: parent.width / 12
                            y: parent.height / 6
                            width: height
                            color: "white"
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
                                    myCalendar.showPreviousMonth()
                                }
                            }
                        }

                        Label {
                            text: styleData.title
                            color: "black"
                            font.pixelSize: parent.height / 3
                            anchors.centerIn: parent
                        }

                        Rectangle {
                            id: up
                            height: parent.height * 2 / 3
                            width: height
                            y: parent.height / 6
                            x: parent.width * 11 / 12 - width
                            color: "white"
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
                                    myCalendar.showNextMonth()
                                }
                            }
                        }
                    }

                    dayOfWeekDelegate: Rectangle {
                        color: "white"
                        height: 20
                        Label {
                            text: styleData.dayOfWeek;
                            font.pixelSize: 13
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

                    weekNumberDelegate: Rectangle {
                        color: "white"
                        width: 40
                        Label {
                            text: styleData.weekNumber
                            font.pixelSize: 13
                            anchors.centerIn: parent
                        }
                    }
                }

                onPressed: {
                    day = selectedDate.getDate();
                    month = selectedDate.getMonth() + 1;
                    year = selectedDate.getFullYear();
                    console.log("dd/mm/yyyy: "+day +"/"+month+"/"+year)
                    spinnerYear.lineNoBtn.currentIndex=year - spinnerYear.startNumber;
                    spinnerMonth.lineNoBtn.currentIndex=month -spinnerMonth.startNumber;

                }
                onSelectedDateChanged: {

                }
            }

        }

    }

    Rectangle{
        id:tabSettingTime
        x:0
        y:100
        width: 1024
        height: 460
        color: "#788287"
        visible: false


        Spinner2
        {
            id: spinnerHours
            x: 68
            y: 150
            spinWidth:80
            rotationState: 0
            mod: 12
            startNumber: 1
            fontSizeFocus: 28
            fontSizeEdge: 15
            onCurrIndexChanged:  {
                analogClock.hours=currIndex
            }
        }
        Rectangle{
            x:68
            y: 150+180
            width: spinnerHours.width
            height: 20
            color: "transparent"

            Text {
                anchors.centerIn: parent
                id: txtHours
                text: qsTr("Hours")
                font.pixelSize: 20
                color: "#FFCC66"

            }
        }

        Spinner2
        {
            id: spinnerMin
            x: 216
            y: 150
            spinWidth:80
            rotationState: 0
            mod: 60
            startNumber: 0
            fontSizeFocus: 28
            fontSizeEdge: 15
            onCurrIndexChanged:  {
                analogClock.minutes=currIndex
            }
        }
        Rectangle{
            x:216
            y: 150+180
            width: spinnerHours.width
            height: 20
            color: "transparent"

            Text {
                anchors.centerIn: parent
                id: txtMinutes
                text: qsTr("Min")
                font.pixelSize: 20
                color: "#FFCC66"

            }
        }

        Spinner2
        {
            id: spinnerSec
            x: 364
            y: 150
            spinWidth:80
            rotationState: 0
            mod: 60
            startNumber: 0
            fontSizeFocus: 28
            fontSizeEdge: 15
            onCurrIndexChanged:  {
                analogClock.seconds=currIndex
            }
        }
        Rectangle{
            x:364
            y: 150+180
            width: spinnerHours.width
            height: 20
            color: "transparent"

            Text {
                anchors.centerIn: parent
                id: txtSeconds
                text: qsTr("Sec")
                font.pixelSize: 20
                color: "#FFCC66"

            }
        }

        Rectangle{
            x: 500
            y:100
            width: 500
            height: 300
            color: "transparent"

            ContentClock{
                x: 150
                id: analogClock
                visible: true
                city: "Tokyo"
                shift: 9
                //                onHoursChanged:  {
                //                    spinnerHours.lineNoBtn.currentIndex=hours;
                //                }
                //                onSecondsChanged: {
                //                    spinnerSec.lineNoBtn.currentIndex=seconds;
                //                }
                //                onMinutesChanged: {
                //                    spinnerMin.lineNoBtn.currentIndex=minutes;
                //                }
            }
        }


    }
    Rectangle{
        x: 0
        y:560
        width: 1024
        height: 80
        color: "#5a6469"

        Rectangle{
            id:btnOK
            x:208
            y:15
            width: 200
            height: 50
            color: "green"
            border.color: "black"
            border.width: 1
            radius: 5
            Text {
                anchors.centerIn: parent
                id: lblOk
                font.pixelSize: 20
                text: qsTr("OK")
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    btnOK.color ="#90EE90"
                    StatusBar.strDate = day+"-"+month+"-"+year
                }
                onReleased: {
                    mainModel.InnerChangeScreen(ScreenMng.Production)
                    btnOK.color ="green"
                }
            }
        }
        Rectangle{
            id:btnCancel
            x:616
            y:15
            width: 200
            height: 50
            color: "green"
            border.color: "black"
            border.width: 1
            radius: 5
            Text {
                anchors.centerIn: parent
                id: lblCancel
                font.pixelSize: 20
                text: qsTr("Cancel")
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    btnCancel.color ="#90EE90"

                }
                onReleased: {
                    mainModel.InnerChangeScreen(ScreenMng.Production)
                    btnCancel.color ="green"
                }
            }
        }
    }
    Component.onCompleted: {
       objDateTimeVM.onLoad();
    }
}
