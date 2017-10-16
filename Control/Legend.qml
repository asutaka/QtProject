import QtQuick 2.0

Item {
    property string strColor: "white"
    property string strSource: ""
    Rectangle{
        id: rect
        width: 80
        height: 35
        color: "transparent"
        border.color: "white"
        border.width: 2
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
    }
}
