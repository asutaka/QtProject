import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
Item
{
    id: switchLine3v
    property int lineno: 12
    property int  count: 0
    signal activated(real countSelected)
    onCountChanged:
        switch(count)
        {
        case 0: txtCurrentLineNo.text="1"; break;
        case 1: txtCurrentLineNo.text="2"; break;
        case 2: txtCurrentLineNo.text="3"; break;
        case 3: txtCurrentLineNo.text="4"; break;
        case 4: txtCurrentLineNo.text="5"; break;
        case 5: txtCurrentLineNo.text="6"; break;
        case 6: txtCurrentLineNo.text="7"; break;
        case 7: txtCurrentLineNo.text="8"; break;
        case 8: txtCurrentLineNo.text="9"; break;
        case 9: txtCurrentLineNo.text="10"; break;
        case 10:txtCurrentLineNo.text="11"; break;
        case 11:txtCurrentLineNo.text="12"; break;

        default:txtCurrentLineNo.text="1";
        }

    Rectangle{
        id: goPreviousLine
        width: 60
        height: 60
        y:20
        radius: 7
        color: "#788287"
        border.color: "#788287"
        border.width: 2

        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle = "#009774"
                ctx.moveTo(10, 3)
                ctx.lineTo(50, 3);
                ctx.quadraticCurveTo(57, 3, 57, 10);
                ctx.lineTo(57, 50);
                ctx.quadraticCurveTo(57, 57, 47, 57);
                ctx.lineTo(10, 57);
                ctx.quadraticCurveTo(3, 57, 3, 47);
                ctx.lineTo(3,10);
                ctx.quadraticCurveTo(3,3,10,3);
                ctx.closePath();
                ctx.fill();

                ctx.fillStyle = "white"
                ctx.beginPath();
                ctx.moveTo(10, 31);
                ctx.lineTo(30, 8);
                ctx.lineTo(30, 18);
                ctx.lineTo(50, 18);
                ctx.lineTo(50, 43);
                ctx.lineTo(30, 43);
                ctx.lineTo(30, 53);
                ctx.closePath();
                ctx.fill();
            }
        }
        MouseArea {
            anchors.fill: parent
            onPressed: {
                count--;
                if(count == -1)
                {
                    count=lineno-1;
                }
                switchLine3v.activated(count)
            }
        }
    }
    Rectangle{

        id: btnCurrentLineNo
        width: 100
        height: 100
        color: "#FAF0E6"
        border.color: "#788287"
        border.width: 10
        x: goPreviousLine.width
        radius: 50

        Text {
            id: txtCurrentLineNo
            anchors.centerIn: parent
            font.pixelSize: 55
            font.bold: true
            color: "#0066CC"
            text: "1"
        }
    }
    Rectangle{

        id: goNextLine
        width: 60
        height: 60
        color: "#788287"
        border.color: "#788287"
        border.width: 2
        x: goPreviousLine.width +btnCurrentLineNo.width
        y: 20
        radius: 7
        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle = "#009774"
                ctx.moveTo(10, 3)
                ctx.lineTo(50, 3);
                ctx.quadraticCurveTo(57, 3, 57, 10);
                ctx.lineTo(57, 50);
                ctx.quadraticCurveTo(57, 57, 47, 57);
                ctx.lineTo(10, 57);
                ctx.quadraticCurveTo(3, 57, 3, 47);
                ctx.lineTo(3,10);
                ctx.quadraticCurveTo(3,3,10,3);
                ctx.closePath();
                ctx.fill();

                ctx.fillStyle = "white"
                ctx.beginPath();
                ctx.moveTo(10, 18);
                ctx.lineTo(30, 18);
                ctx.lineTo(30, 8);
                ctx.lineTo(50, 31);
                ctx.lineTo(30, 53);
                ctx.lineTo(30, 43);
                ctx.lineTo(10, 43);
                ctx.closePath();
                ctx.fill();
            }
        }
        MouseArea {
            anchors.fill: parent
            onPressed: {
                count++;
                if(count == lineno)
                {
                    count=0;
                }
                switchLine3v.activated(count)
            }

        }
    }
}


