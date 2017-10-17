import QtQuick 2.0

Item {
    id: switchSignal
    property int widthButton: 80
    property int heightButton: 30
    property int distance: 10
    property int currentIndex: 1
    property string textSelection: "Photo(W1)"
    property string textColor: "#F4A460"

    signal textDisplayChanged()

    onCurrentIndexChanged: {
        switch(currentIndex){

        case 1: textSelection ="Photo(W1)";break;
        case 2: textSelection ="Photo(RJ3)";break;
        case 3: textSelection ="Photo(RJ1)";break;
        case 4: textSelection ="INA1";break;
        case 5: textSelection ="INA2";break;
        case 6: textSelection ="INM1";break;
        case 7: textSelection ="INM2";break;
        case 8: textSelection ="OUTA1";break;
        case 9: textSelection ="OUTA2";break;
        case 10: textSelection ="OUTM1";break;
        case 11: textSelection ="OUTN1";break;
        case 12: textSelection ="OUTN2";break;
        default : txtSelection.text="None"

        }
    }

    Rectangle{
        id: upBtn //previous selection
        width: widthButton
        height: heightButton
        color: "transparent"
        border.width: 2
        border.color: "#bfbfbf"
        radius: 8
        Image {
            anchors.fill: parent
            id: upImg
            source: "qrc:/Images/icon_up.png"
        }
        MouseArea{
            anchors.fill: parent
            onPressed: {
                if(currentIndex<12){
                    currentIndex++;
                }
                else if(currentIndex>=12){
                    currentIndex=1
                }
            }

        }
        Rectangle{
            id: displaySelection
            y: upBtn.y +upBtn.height + distance
            width: widthButton
            height: heightButton
            color: "transparent"
            border.color: "#bfbfbf"
            border.width: 2
            radius: 3
            Text {
                anchors.centerIn: parent
                id: txtSelection
                font.pixelSize: 15
                text: textSelection
                color: textColor
            }

        }
        Rectangle{
            id: btnDown
            y: displaySelection.y +displaySelection.height +distance
            width: widthButton
            height: heightButton
            color: "transparent"
            border.width: 2
            border.color: "#bfbfbf"
            radius: 8
            Image {
                anchors.fill: parent
                id: upDown
                source: "qrc:/Images/icon_down.png"
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    if(currentIndex>1){
                        currentIndex--
                    }
                    else if(currentIndex<=1)
                    {
                        currentIndex=12
                    }
                }

            }
        }

    }
}
