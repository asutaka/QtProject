import QtQuick 2.0

Item {
    property string strColor: "white"
    property string strSource: ""
    property bool clickState: false

    Rectangle{
        id: rect
        width: 80
        height: 35
        color: "transparent"
        border.color: "white"
        border.width: 0.8
        Rectangle{
            x: 5
            y: 14
            width: 20
            height: 3
            color: strColor
        }
        Image{
            x: 35
            y: 5
            source: strSource
        }
        MouseArea{
            anchors.fill: parent
            onPressed: {
                clickState = !clickState
                rect.border.width = 2
            }
        }
    }
    function setWidth(value){
        rect.border.width = value
    }
}
