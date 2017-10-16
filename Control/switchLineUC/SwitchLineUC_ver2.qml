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
        width: 55
        height: 55
        y: 15
        radius: 5
        color: "#009774"

        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle = "white"

                ctx.beginPath();
                ctx.moveTo(39, 8);
                ctx.lineTo(17, 27);
                ctx.lineTo(39, 47);
                ctx.closePath()
                ctx.fill();

                ctx.fillRect(10, 17, 5, 20)
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
        width: 55
        height: 55
        x: 145
        y: 15
        radius: 5
        color: "#009774"

        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle = "white"

                ctx.beginPath();
                ctx.moveTo(16, 8);
                ctx.lineTo(38, 27);
                ctx.lineTo(16, 47);
                ctx.closePath();
                ctx.fill();

                ctx.fillRect(40, 17, 5, 20)
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
        x: 60
//        radius: 10
        color: "transparent"

        Canvas {
            id: unselected
            visible: true
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                var centerY = height/2;
                var centerX = width/2;
                ctx.beginPath();
                ctx.fillStyle = "#009774";
                ctx.arc(centerX, centerY, width/2, 0, Math.PI * 2);
                ctx.fill();
            }
        }

//        Rectangle {
//            color: "transparent"
//            width: 68
//            height: 68
//            x: 6
//            y: 6
//            radius: 5
//            border.color: "white"
//            border.width: 2
//        }

        Text {
            id: txtLineNo
            font.pixelSize: 60
            anchors.centerIn: parent
            text: currentLineNo.toString()
            color: "white"
        }
    }
}
