import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Item{
    property int currentLineNo: 1
    property int lineNumber: 12
    id: switchLineUC
    signal getCurrentLineNo (int currentLineNo)

    Rectangle {
        id: previousBtn
        width: 60
        height: 60
        y: 10
        color: "transparent"
        border.color: "#B0B0B0"
        border.width: 2

        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle = "#009774"
                ctx.fillRect(3, 3, 54, 54)

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
                if(currentLineNo > 1){
                    currentLineNo--;
                }
                else if(currentLineNo == 1){
                    currentLineNo = 12;
                }
                switchLineUC.getCurrentLineNo(currentLineNo);
            }
        }
    }

    Rectangle {
        id: nextBtn
        width: 60
        height: 60
        x: 146
        y: 10
        color: "transparent"
        border.color: "#B0B0B0"
        border.width: 2

        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle = "#009774"
                ctx.fillRect(3, 3, 54, 54)

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
                if(currentLineNo < 12){
                    currentLineNo++;
                }
                else if(currentLineNo == 12){
                    currentLineNo = 1;
                }
                switchLineUC.getCurrentLineNo(currentLineNo);
            }
        }
    }

    Rectangle {
        id: dspLineNo
        width: 80
        height: 80
        x: 63
        color: "transparent"
        border.color: "#B0B0B0"
        border.width: 2

        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle = "#009774";
                ctx.fillRect(3, 3, 74, 74);
            }
        }

        Text {
            id: txtLineNo
            font.pixelSize: 60
            anchors.centerIn: parent
            text: currentLineNo.toString()
            color: "white"
        }
    }
}
