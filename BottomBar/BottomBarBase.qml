import QtQuick 2.0

Item {
    property string backgroundColor: "black"
    property string backgroundImage: "image://MyProvider/ControlBar_bg.png"

    Rectangle {
        id: bottomBarBase
        width: 1024
        height: 64
        color: backgroundColor
        Image {
            id: imgBackground
            source: backgroundImage
        }
    }
}
