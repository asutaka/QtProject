import QtQuick 2.0
import QtQml 2.2

Item {
    id: root

    width: mSize
    height: mSize

    property int    mSize:              200                     // The size of the circle in pixel
    property real   mArcBegin:          0                       // start arc angle in degree
    property real   mArcEnd:            360                     // end arc angle in degree
    property real   mArcValue:          0                       // value arc angle in degree
    property real   mArcOffset:         0                       // rotation
    property bool   mPie:               false                   // paint a pie instead of an arc
    property bool   mShowBackground:    false                   // a full circle as a background of the arc
    property real   mLineWidth:         20                      // width of the line
    property string mColorCircle:       "#CC3333"               // color of circle
    property string mColorBackground:   "#779933"               // color of background
    property alias  mBeginAnimation:    animationArcBegin.enabled
    property alias  mEndAnimation:      animationArcEnd.enabled
    property int    mAnimationDuration: 200
    property int    mFontSize:          40                      // fontSize of Text
    property string mFontFamily:        "Noto Sans"                 // fontFamily of Text
    property string mText:              "0.00"                      // value of progress

    onMArcBeginChanged: {
        calPercent()
        canvas.requestPaint()
    }

    onMArcEndChanged: {
        calPercent()
        canvas.requestPaint()
    }

    onMArcValueChanged: {
        calPercent()
        canvas.requestPaint()
    }

    function calPercent(){
        var percent = mArcValue * 100 / (mArcEnd - mArcBegin)
        percent = (percent == 100) ? 100 : percent.toFixed(2)
        mText = percent.toString()
    }

    Behavior on mArcBegin {
       id: animationArcBegin
       enabled: true
       NumberAnimation {
           duration: root.mAnimationDuration
           easing.type: Easing.InOutCubic
       }
    }

    Behavior on mArcEnd {
       id: animationArcEnd
       enabled: true
       NumberAnimation {
           duration: root.mAnimationDuration
           easing.type: Easing.InOutCubic
       }
    }

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d")
            var x = width / 2
            var y = height / 2
            var start = Math.PI * (root.mArcBegin / 180) + Math.PI * root.mArcOffset / 180 - Math.PI / 2
            var end = Math.PI * (root.mArcEnd / 180) + Math.PI * root.mArcOffset / 180 - Math.PI / 2
            var value = Math.PI * (root.mArcValue / 180) + Math.PI * root.mArcOffset / 180 - Math.PI / 2
            ctx.reset()

            if (root.mPie) {
                if (root.mShowBackground) {
                    ctx.beginPath()
                    ctx.fillStyle = root.mColorBackground
                    ctx.moveTo(x, y)
                    ctx.arc(x, y, width / 2, start, end, false)
                    ctx.lineTo(x, y)
                    ctx.fill()
                }
                ctx.beginPath()
                ctx.fillStyle = root.mColorCircle
                ctx.moveTo(x, y)
                ctx.arc(x, y, width / 2, start, value, false)
                ctx.lineTo(x, y)
                ctx.fill()
            } else {
                var r = width / 2 - root.mLineWidth / 2
                if (root.mShowBackground) {
                    ctx.beginPath();
                    ctx.arc(x, y, r, start, end, false)
                    ctx.lineWidth = root.mLineWidth
                    ctx.strokeStyle = root.mColorBackground
                    ctx.stroke()
                }
                ctx.beginPath();
                ctx.arc(x, y, r, start, value, false)
                ctx.lineWidth = root.mLineWidth
                ctx.strokeStyle = root.mColorCircle
                ctx.stroke()

                ctx.font = mFontSize + "px " + "\"" + mFontFamily + "\""
                ctx.lineWidth = 2
                ctx.textAlign = "center"
                ctx.strokeText(mText + "%", x, y + mFontSize/2)
            }
        }
    }
}
