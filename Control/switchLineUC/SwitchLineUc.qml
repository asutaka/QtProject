import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Item{
    property int currentLineNo: 1
    property int lineNumber: 12
    id: switchLineUC
    signal getCurrentLineNo (int currentLineNo)
    Image{
        id: imgPreLine
        source:"qrc:/Images/capsulecw_Linechg_Left_OFF_79_48.png"
        MouseArea {
            anchors.fill: parent
            onPressed: {
                imgPreLine.source= "qrc:/Images/capsulecw_Linechg_Left_ON_79_48.png"
                if(currentLineNo>1){
                    currentLineNo--;
                }
                else if(currentLineNo == 1){
                    currentLineNo = 12;
                }
                imgLineNo.source= "qrc:/Images/LineChange_No" +(currentLineNo)+  ".png"
                switchLineUC.getCurrentLineNo(currentLineNo);
            }
            onReleased:{
                imgPreLine.source= "qrc:/Images/capsulecw_Linechg_Left_OFF_79_48.png"
            }
            onCanceled: {
                imgPreLine.source= "qrc:/Images/capsulecw_Linechg_Left_OFF_79_48.png"
            }
        }
    }
    Image{
        id: imgLineNo
        x:imgPreLine.width
        source:"qrc:/Images/LineChange_No"+(currentLineNo)+".png"
    }
    Image{
        id: imgNextLine
        x: imgLineNo.width + imgPreLine.width
        source:"qrc:/Images/capsulecw_Linechg_right_OFF_79_48.png"
        MouseArea {
            anchors.fill: parent
            onPressed: {
                imgNextLine.source= "qrc:/Images/capsulecw_Linechg_right_ON_79_48.png"
                if(currentLineNo <lineNumber){
                    currentLineNo++;
                }
                else if(currentLineNo ===lineNumber){
                    currentLineNo = 1;
                }
                imgLineNo.source= "qrc:/Images/LineChange_No" +(currentLineNo)+  ".png"
                switchLineUC.getCurrentLineNo(currentLineNo);
            }
            onReleased:{
                imgNextLine.source= "qrc:/Images/capsulecw_Linechg_right_OFF_79_48.png"
            }
            onCanceled: {
                imgNextLine.source= "qrc:/Images/capsulecw_Linechg_right_OFF_79_48.png"
            }
        }
    }
}
