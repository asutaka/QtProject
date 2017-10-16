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
    id: switchLine2v
    signal activated(real countSelected)
    onCountChanged:
        switch(count)
        {
        case 0: imgButtonLineNo.source="qrc:/Images/Line_No1.png"; break;
        case 1: imgButtonLineNo.source="qrc:/Images/Line_No2.png"; break;
        case 2: imgButtonLineNo.source="qrc:/Images/Line_No3.png";break;
        case 3: imgButtonLineNo.source="qrc:/Images/Line_No4.png"; break;
        case 4: imgButtonLineNo.source="qrc:/Images/Line_No5.png"; break;
        case 5: imgButtonLineNo.source="qrc:/Images/Line_No6.png";break;
        case 6: imgButtonLineNo.source="qrc:/Images/Line_No7.png";break;
        case 7: imgButtonLineNo.source="qrc:/Images/Line_No8.png";break;
        case 8: imgButtonLineNo.source="qrc:/Images/Line_No9.png";break;
        case 9: imgButtonLineNo.source="qrc:/Images/Line_No10.png";break;
        case 10:imgButtonLineNo.source="qrc:/Images/Line_No11.png"; break;
        case 11:imgButtonLineNo.source="qrc:/Images/Line_No12.png"; break;
        default:imgButtonLineNo.source="qrc:/Images/Line_No1.png";
        }

    Image{
        id: imgBack
        source: "qrc:/Images/arawback.png"
        MouseArea {
            anchors.fill: parent
            onPressed: {
                imgBack.source= "qrc:/Images/arawback_on.png"
                count--;
                if(count == -1)
                {
                    count=lineno-1;
                }
                switchLine2v.activated(count)
            }
            onReleased:{
                imgBack.source= "qrc:/Images/arawback.png"
            }
            onCanceled: {
                imgBack.source= "qrc:/Images/arawback.png"
            }
        }
    }
    Image{

        id: imgButtonLineNo
        x: imgBack.width+5
        source: "qrc:/Images/Line_No1.png"
    }
    Image{

        id: imgNext
        x: imgBack.width+5 +imgButtonLineNo.width +5
        source: "qrc:/Images/arawNext.png"
        MouseArea {
            anchors.fill: parent
            onPressed: {
                imgNext.source= "qrc:/Images/arawNext_on.png"
                count++;
                if(count == lineno)
                {
                    count=0;
                }
                switchLine2v.activated(count)
            }
            onReleased:{
                imgNext.source= "qrc:/Images/arawNext.png"
            }
            onCanceled: {
                imgNext.source= "qrc:/Images/arawNext.png"
            }
        }
    }
}


