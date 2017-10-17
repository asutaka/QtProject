import QtQuick 2.0
import QtQuick.Controls 2.0
import ControlApp 1.0
import CommonControl 1.0
import CommonModule 1.0
import QtQml.Models 2.2
import QtQml 2.2

Rectangle {
    readonly property string mWeightUnit:   "g"
    readonly property string mTimeUnit:     "s"
    readonly property string mPercent:      "%"

    property real   runTime:        0
    property real   downTime:       0
    property real   totalTime:      0
    property int    targetNums:     0
    property int    totalNums:      0
    property int    okNums:         0
    property real   availability:   0.00
    property real   performance:    0.00
    property real   qualify:        0.00
    property real   oee:            0.00
    property int numID: 13
    id: oeeScreen
    x: 0
    y: 0
    width: 1024
    height: 640
    color: "black"
    OeeVM{
        id:oeeVM
    }

    Row {
        anchors.centerIn: parent
        spacing: 20

        Column {
            id: col_oee
            spacing: 10

            TK_Label {
                width: 240
                height: 40
                mText: "OEE"
                mTextAlignH: Text.AlignHCenter
                mBackColor: "transparent"
                mForeColor: "#00F778"
                mFont.pixelSize: 30
            }

            TK_ProgressCircle {
                mSize: 240
                mColorCircle: "#00F778"
                mColorBackground: "#34495E"
                mShowBackground: true
                mArcValue: oee * 360
                mLineWidth: 20
                mFontFamily: fontFactory.getFontFamily(FontFactory.FNT_XL3)
                mFontSize: fontFactory.getFontSize(FontFactory.FNT_XL3)
            }

            Row {
                spacing: 3

                TK_Label {
                    width: 120
                    height: 20
                    mText: "OEE"
                    mTextAlignH: Text.AlignLeft
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

                TK_Label {
                    id: lb_oee
                    width: 90
                    height: 20
                    mText: (oee == 1)? "100" : (oee * 100).toFixed(2).toString()
                    mTextAlignH: Text.AlignRight
                    mBackColor: "transparent"
                    mForeColor: "#ffd59f"
                    mFont.pixelSize: 20
                }

                TK_Label {
                    width: 20
                    height: 20
                    mText: mPercent
                    mTextAlignH: Text.AlignHCenter
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }
            }
        }

        Column {
            id: col_availability
            spacing: 10

            TK_Label {
                width: 220
                height: 40
                mText: "Availability"
                mTextAlignH: Text.AlignHCenter
                mBackColor: "transparent"
                mForeColor: "#F08080"
                mFont.pixelSize: 30
            }

            TK_ProgressCircle {
                mSize: 220
                mColorCircle: "#F08080"
                mColorBackground: "#34495E"
                mShowBackground: true
                mArcValue: availability*360
                mLineWidth: 20
                mFontFamily: fontFactory.getFontFamily(FontFactory.FNT_XL3)
                mFontSize: fontFactory.getFontSize(FontFactory.FNT_XL3)
            }

            Row {
                spacing: 3

                TK_Label {
                    width: 100
                    height: 20
                    mText: "Run time"
                    mTextAlignH: Text.AlignLeft
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

                TK_Label {
                    id: lb_runTime
                    width: 90
                    height: 20
                    mText: formatNumber(runTime.toFixed(0).toString())
                    mTextAlignH: Text.AlignRight
                    mBackColor: "transparent"
                    mForeColor: "#ffd59f"
                    mFont.pixelSize: 20
                }

                TK_Label {
                    width: 20
                    height: 20
                    mText: mTimeUnit
                    mTextAlignH: Text.AlignHCenter
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

            }

            Row {
                spacing: 3

                TK_Label {
                    width: 100
                    height: 20
                    mText: "Down time"
                    mTextAlignH: Text.AlignLeft
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

                TK_Label {
                    id: lb_downTime
                    width: 90
                    height: 20
                    mText: formatNumber(downTime.toFixed(0).toString())
                    mTextAlignH: Text.AlignRight
                    mBackColor: "transparent"
                    mForeColor: "#ffd59f"
                    mFont.pixelSize: 20
                }

                TK_Label {
                    width: 20
                    height: 20
                    mText: mTimeUnit
                    mTextAlignH: Text.AlignHCenter
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

            }

            Row {
                spacing: 3

                TK_Label {
                    width: 100
                    height: 20
                    mText: "Total time"
                    mTextAlignH: Text.AlignLeft
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

                TK_Label {
                    id: lb_totalTime
                    width: 90
                    height: 20
                    mText: formatNumber(totalTime.toFixed(0).toString())
                    mTextAlignH: Text.AlignRight
                    mBackColor: "transparent"
                    mForeColor: "#ffd59f"
                    mFont.pixelSize: 20
                }

                TK_Label {
                    width: 20
                    height: 20
                    mText: mTimeUnit
                    mTextAlignH: Text.AlignHCenter
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

            }

            Row {
                spacing: 3

                TK_Label {
                    width: 100
                    height: 20
                    mText: "Availability"
                    mTextAlignH: Text.AlignLeft
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

                TK_Label {
                    id: lb_availability
                    width: 90
                    height: 20
                    mText: (availability == 1)? "100" : (availability * 100).toFixed(2).toString()
                    mTextAlignH: Text.AlignRight
                    mBackColor: "transparent"
                    mForeColor: "#ffd59f"
                    mFont.pixelSize: 20
                }

                TK_Label {
                    width: 20
                    height: 20
                    mText: mPercent
                    mTextAlignH: Text.AlignHCenter
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

            }
        }

        Column {
            id: col_performance
            spacing: 10

            TK_Label {
                width: 220
                height: 40
                mText: "Performance"
                mTextAlignH: Text.AlignHCenter
                mBackColor: "transparent"
                mForeColor: "#FEF778"
                mFont.pixelSize: 30
            }

            TK_ProgressCircle {
                mSize: 220
                mColorCircle: "#FEF778"
                mColorBackground: "#34495E"
                mShowBackground: true
                mArcValue: performance*360
                mLineWidth: 20
                mFontFamily: fontFactory.getFontFamily(FontFactory.FNT_XL3)
                mFontSize: fontFactory.getFontSize(FontFactory.FNT_XL3)
            }

            Row {
                spacing: 3

                TK_Label {
                    width: 100
                    height: 20
                    mText: "Target Nums"
                    mTextAlignH: Text.AlignLeft
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

                TK_Label {
                    id: lb_targetNums
                    width: 90
                    height: 20
                    mText: formatNumber(targetNums.toString())
                    mTextAlignH: Text.AlignRight
                    mBackColor: "transparent"
                    mForeColor: "#ffd59f"
                    mFont.pixelSize: 20
                }

                TK_Label {
                    width: 20
                    height: 20
                    mText: ""
                    mTextAlignH: Text.AlignHCenter
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

            }

            Row {
                spacing: 3

                TK_Label {
                    width: 100
                    height: 20
                    mText: "Total Nums"
                    mTextAlignH: Text.AlignLeft
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

                TK_Label {
                    id: lb_totalNums
                    width: 90
                    height: 20
                    mText: formatNumber(totalNums.toString())
                    mTextAlignH: Text.AlignRight
                    mBackColor: "transparent"
                    mForeColor: "#ffd59f"
                    mFont.pixelSize: 20
                }

                TK_Label {
                    width: 20
                    height: 20
                    mText: ""
                    mTextAlignH: Text.AlignHCenter
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

            }

            Row {
                spacing: 3

                TK_Label {
                    width: 100
                    height: 20
                    mText: "Performance"
                    mTextAlignH: Text.AlignLeft
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

                TK_Label {
                    id: lb_performance
                    width: 90
                    height: 20
                    mText: (performance == 1)? "100" : (performance * 100).toFixed(2).toString()
                    mTextAlignH: Text.AlignRight
                    mBackColor: "transparent"
                    mForeColor: "#ffd59f"
                    mFont.pixelSize: 20
                }

                TK_Label {
                    width: 20
                    height: 20
                    mText: mPercent
                    mTextAlignH: Text.AlignHCenter
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }
            }
        }

        Column {
            id: col_quality
            spacing: 10

            TK_Label {
                width: 220
                height: 40
                mText: "Quality"
                mTextAlignH: Text.AlignHCenter
                mBackColor: "transparent"
                mForeColor: "#FE9507"
                mFont.pixelSize: 30
            }

            TK_ProgressCircle {
                mSize: 220
                mColorCircle: "#FE9507"
                mColorBackground: "#34495E"
                mShowBackground: true
                mArcValue: qualify*360
                mLineWidth: 20
                mFontFamily: fontFactory.getFontFamily(FontFactory.FNT_XL3)
                mFontSize: fontFactory.getFontSize(FontFactory.FNT_XL3)
            }

            Row {
                spacing: 3

                TK_Label {
                    width: 100
                    height: 20
                    mText: "Total Nums"
                    mTextAlignH: Text.AlignLeft
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

                TK_Label {
                    id: lb_totalNums2
                    width: 90
                    height: 20
                    mText: formatNumber(totalNums.toString())
                    mTextAlignH: Text.AlignRight
                    mBackColor: "transparent"
                    mForeColor: "#ffd59f"
                    mFont.pixelSize: 20
                }

                TK_Label {
                    width: 20
                    height: 20
                    mText: ""
                    mTextAlignH: Text.AlignHCenter
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

            }

            Row {
                spacing: 3

                TK_Label {
                    width: 100
                    height: 20
                    mText: "OK Nums"
                    mTextAlignH: Text.AlignLeft
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

                TK_Label {
                    id: lb_okNums
                    width: 90
                    height: 20
                    mText: formatNumber(okNums.toString())
                    mTextAlignH: Text.AlignRight
                    mBackColor: "transparent"
                    mForeColor: "#ffd59f"
                    mFont.pixelSize: 20
                }

                TK_Label {
                    width: 20
                    height: 20
                    mText: ""
                    mTextAlignH: Text.AlignHCenter
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

            }

            Row {
                spacing: 3

                TK_Label {
                    width: 100
                    height: 20
                    mText: "Quality"
                    mTextAlignH: Text.AlignLeft
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }

                TK_Label {
                    id: lb_quality
                    width: 90
                    height: 20
                    mText: (qualify == 1)? "100" : (qualify * 100).toFixed(2).toString()
                    mTextAlignH: Text.AlignRight
                    mBackColor: "transparent"
                    mForeColor: "#ffd59f"
                    mFont.pixelSize: 20
                }

                TK_Label {
                    width: 20
                    height: 20
                    mText: mPercent
                    mTextAlignH: Text.AlignHCenter
                    mBackColor: "transparent"
                    mForeColor: "lightgray"
                    mFont.pixelSize: 18
                }
            }
        }
    }

    //stub_data
    Timer {
        id: updateTimer
        interval: 1000
        repeat: true

        onTriggered: {
            totalTime += 1
            downTime += 0
            runTime = totalTime - downTime
            totalNums += 10
            okNums += 10 - Math.round(Math.random())

            availability = (totalTime == 0) ? 0 : runTime/totalTime
            performance = (targetNums == 0) ? 0 : totalNums/targetNums
            qualify = (totalNums == 0) ? 0 : okNums/totalNums
            oee = availability * performance * qualify
        }
    }

    Component.onCompleted: {
        oeeVM.onLoad();
        targetNums = 999999
        updateTimer.start()
    }

    Component.onDestruction: {
        updateTimer.destroy()
    }
    //end_stubdata

    function formatNumber(nStr){
        nStr += '';
        var x = nStr.split('.');
        var x1 = x[0];
        var x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    }
}
