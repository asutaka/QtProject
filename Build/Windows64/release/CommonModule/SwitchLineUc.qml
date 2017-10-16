import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import CommonControl 1.0

Item{
    property int currentLineNo: 1
    property int lineNumber: 12
    id: switchLineUC
    signal getCurrentLineNo (int currentLineNo)
    ImageButtonControl{
        id: imgPreLine
        width: 57
        height: 74
        imgSourceBg: "qrc:/Images/capsulecw_Linechg_Left_OFF_79_48.png"
        imgSourceActive: "qrc:/Images/capsulecw_Linechg_Left_ON_79_48.png"
        onClicked: {
            if(currentLineNo>1){
                currentLineNo--;
            }
            else if(currentLineNo == 1){
                currentLineNo = 12;
            }
            imgLineNo.source= "qrc:/Images/LineChange_No" +(currentLineNo)+  ".png"
            switchLineUC.getCurrentLineNo(currentLineNo);
        }
    }
    Image{
        id: imgLineNo
        x:imgPreLine.width
        source:"qrc:/Images/LineChange_No"+(currentLineNo)+".png"
    }
    ImageButtonControl{
        id: imgNextLine
        x: imgLineNo.width + imgPreLine.width
        width: 57
        height: 74
        imgSourceBg: "qrc:/Images/capsulecw_Linechg_right_OFF_79_48.png"
        imgSourceActive: "qrc:/Images/capsulecw_Linechg_right_ON_79_48.png"
        onClicked: {
            if(currentLineNo <lineNumber){
                currentLineNo++;
            }
            else if(currentLineNo ===lineNumber){
                currentLineNo = 1;
            }
            imgLineNo.source= "qrc:/Images/LineChange_No" +(currentLineNo)+  ".png"
            switchLineUC.getCurrentLineNo(currentLineNo);
        }
    }
}

