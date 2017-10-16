import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    property int currentLineNo: 1
    property int lineNumber: 12
    id: switchLineUC
    Image{
        id: imageBg
        source: "qrc:/Images/Switch.png"
        Text{
            id: txtNumberLine
            text: currentLineNo.toString()
            anchors.centerIn: parent
            color: "#0000FF"
            font.pixelSize: 50
            font.bold: true
        }
        Image{
            id: imgBack
            x: 14
            y: 51
            source: "qrc:/Images/backLine.png"
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    imgBack.source = "qrc:/Images/backLine_01.png";
                }
                onReleased: {
                    imgBack.source = "qrc:/Images/backLine.png";
                    if(currentLineNo>1){
                        currentLineNo--;
                    }
                    else if(currentLineNo == 1){
                        currentLineNo = 12;
                    }
                }
            }
        }
        Image{
            id: imgNext
            x: 158
            y: 51
            source: "qrc:/Images/nextLine.png"
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    imgNext.source = "qrc:/Images/nextLine_01.png"
                }
                onReleased: {
                    imgNext.source = "qrc:/Images/nextLine.png"
                    if(currentLineNo <lineNumber){
                        currentLineNo++;
                    }
                    else if(currentLineNo ===lineNumber){
                        currentLineNo = 1;
                    }
                }
            }
        }
    }
}
