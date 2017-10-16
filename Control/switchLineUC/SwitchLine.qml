import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
Item
{
    property int lineno: 12
    property int  count: 0
    width:165
    height:72
    id: swLine
    signal activated(real countSelected)
    onCountChanged:
        switch(count)
        {
        case 0: imgButtonLineNo.source="qrc:/Images/LineChange_No1.png"; break;
        case 1: imgButtonLineNo.source="qrc:/Images/LineChange_No2.png"; break;
        case 2: imgButtonLineNo.source="qrc:/Images/LineChange_No3.png";break;
        case 3: imgButtonLineNo.source="qrc:/Images/LineChange_No4.png"; break;
        case 4: imgButtonLineNo.source="qrc:/Images/LineChange_No5.png"; break;
        case 5: imgButtonLineNo.source="qrc:/Images/LineChange_No6.png";break;
        case 6: imgButtonLineNo.source="qrc:/Images/LineChange_No7.png";break;
        case 7: imgButtonLineNo.source="qrc:/Images/LineChange_No8.png";break;
        case 8: imgButtonLineNo.source="qrc:/Images/LineChange_No9.png";break;
        case 9: imgButtonLineNo.source="qrc:/Images/LineChange_No10.png";break;
        case 10:imgButtonLineNo.source="qrc:/Images/LineChange_No11.png"; break;
        case 11:imgButtonLineNo.source="qrc:/Images/LineChange_No12.png"; break;
        default:imgButtonLineNo.source="qrc:/Images/LineChange_No1.png";
        }
    Image
    {
        id: toolButton_Next
        x: 144
        y: 0
        width: 77
        height: 99
        Image{
            id: imgNext
            anchors.fill: parent
            source: "qrc:/Images/capsulecw_Linechg_right_OFF_79_48.png"
            Text {
                anchors.verticalCenterOffset: 16
                anchors.horizontalCenterOffset: 0
                anchors.bottomMargin: -16
                font.family: "MS Gothic"
                font.pixelSize:27
                color: "#ffffff"
                anchors.bottom: parent.bottom
                anchors.centerIn: parent
            }
        }
        MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        imgNext.source= "qrc:/Images/capsulecw_Linechg_right_ON_79_48.png"
                        count++;
                        if(count == lineno)
                        {
                            count=0;
                        }
                        swLine.activated(count)
                    }
                    onReleased:{
                        imgNext.source= "qrc:/Images/capsulecw_Linechg_right_OFF_79_48.png"
                    }
                    onCanceled: {
                        imgNext.source= "qrc:/Images/capsulecw_Linechg_right_OFF_79_48.png"
                    }
                }
    }
    Image {
            id: toolButton_LineNo
            x: 77
            y: 0
            width: 67
            height: 99
            Image{
                id: imgButtonLineNo
                anchors.fill: parent
                source: "qrc:/Images/LineChange_No1.png"
                Text {
                    anchors.verticalCenterOffset: 16
                    anchors.horizontalCenterOffset: 0
                    anchors.bottomMargin: -16
                    font.family: "MS Gothic"
                    font.pixelSize:27
                    color: "#ffffff"
                    anchors.bottom: parent.bottom
                    anchors.centerIn: parent
                }
            }
        }
    Image {
            id: toolButton_Back
            x: 0
            y: 0
            width: 77
            height: 99
            Image{
                id: imgBack
                anchors.fill: parent
                source: "qrc:/Images/capsulecw_Linechg_Left_OFF_79_48.png"
                Text {
                    anchors.verticalCenterOffset: 16
                    anchors.horizontalCenterOffset: 0
                    anchors.bottomMargin: -16
                    font.family: "MS Gothic"
                    font.pixelSize:27
                    color: "#ffffff"
                    anchors.bottom: parent.bottom
                    anchors.centerIn: parent
                }
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgBack.source= "qrc:/Images/capsulecw_Linechg_Left_ON_79_48.png"
                    count--;
                    if(count == -1)
                    {
                        count=lineno-1;
                    }
                    swLine.activated(count)
                }
                onReleased:{
                    imgBack.source= "qrc:/Images/capsulecw_Linechg_Left_OFF_79_48.png"
                }
                onCanceled: {
                    imgBack.source= "qrc:/Images/capsulecw_Linechg_Left_OFF_79_48.png"
                }
            }
    }
}


