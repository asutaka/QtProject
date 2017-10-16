import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Item {
    property int currentLineNo: 1
    property int lineNumber: 12
    property url imgLeftOff: "image://MyProvider/capsulecw_Linechg_Left_OFF_79_48.png"
    property url imgLeftOn: "image://MyProvider/capsulecw_Linechg_Left_ON_79_48.png"
    property url imgRightOff: "image://MyProvider/capsulecw_Linechg_right_OFF_79_48.png"
    property url imgRightOn: "image://MyProvider/capsulecw_Linechg_right_ON_79_48.png"
    id: switchLineUC
    signal getCurrentLineNo(int currentLineNo)
    Image {
        id: imgPreLine
        source: imgLeftOff
        MouseArea {
            anchors.fill: parent
            onPressed: {
                imgPreLine.source = imgLeftOn
                if (currentLineNo > 1) {
                    currentLineNo--;
                }
                else if (currentLineNo === 1) {
                    currentLineNo = 12;
                }
                imgLineNo.source = "image://MyProvider/LineChange_No" + (currentLineNo) +  ".png"
                switchLineUC.getCurrentLineNo(currentLineNo);
            }
            onReleased: imgPreLine.source = imgLeftOff
            onCanceled: imgPreLine.source = imgLeftOff
        }
    }

    Image {
        id: imgLineNo
        x: imgPreLine.width
        source: "image://MyProvider/LineChange_No" + (currentLineNo) + ".png"
    }

    Image{
        id: imgNextLine
        x: imgLineNo.width + imgPreLine.width
        source: imgRightOff
        MouseArea {
            anchors.fill: parent
            onPressed: {
                imgNextLine.source = imgRightOn
                if (currentLineNo < lineNumber) {
                    currentLineNo++;
                }
                else if (currentLineNo === lineNumber) {
                    currentLineNo = 1;
                }
                imgLineNo.source = "image://MyProvider/LineChange_No" + (currentLineNo) +  ".png"
                switchLineUC.getCurrentLineNo(currentLineNo);
            }
            onReleased: imgNextLine.source = imgRightOff
            onCanceled: imgNextLine.source = imgRightOff
        }
    }
}
