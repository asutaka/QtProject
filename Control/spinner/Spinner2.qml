import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Rectangle {
    property int spinWidth: 60
    property int spinHeight: 170
    property int currIndex: 1
    property int mod:10
    property int startNumber: 1
    signal getCurrIndex (int _index)
    property color colorSpinner: "#2d343f"
    property int rotationState: 90
    property int fontSizeFocus: 40
    property int fontSizeEdge: 15
    property int  number1: 1
    property int durationTime: 100
    property Tumbler lineNoBtn: lineNo
    //property int name: value

    id: spinner
    width: spinWidth
    height: spinHeight
    color: colorSpinner
    border.color: "#A6A6A6"


    function formatText(count, modelData) {
        var data = (count === mod ? modelData + startNumber : modelData);
        return data;
    }

    Component {
        id: delegateComponent

        Label {
            id:labelSetUp
            rotation: rotationState
            color: "white"
            text: formatText(Tumbler.tumbler.count, modelData)
            opacity:0.4 + Math.max(1 - Math.abs(Tumbler.displacement), 0) * 0.6
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: (formatText(Tumbler.tumbler.count, modelData) - startNumber + 1) === currIndex ? fontSizeFocus : fontSizeEdge
            Behavior on opacity { PropertyAnimation { duration: durationTime }}
            Behavior on font.pixelSize { PropertyAnimation { duration: durationTime }}
        }
    }

    Tumbler {
        id: lineNo
        anchors.centerIn: parent
        width: parent.width
        height: 2*parent.height/3
        model: mod
        delegate: delegateComponent
        visibleItemCount: 3

        onCurrentIndexChanged: {
            currIndex = currentIndex + 1
            spinner.getCurrIndex(currIndex)
        }

        Behavior on currentIndex { PropertyAnimation { duration: durationTime }}
    }

    Rectangle {
        id: up
        width:  parent.width
        height: parent.height/6
        color: "transparent"
        border.color: "#A6A6A6"

        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle = "white"
                ctx.beginPath();
                ctx.moveTo(up.width/3, up.height* 0.8);
                ctx.lineTo(up.width*2/3, up.height* 0.8);
                ctx.lineTo(up.width/2, up.height*0.2);
                ctx.closePath();
                ctx.fill();
            }
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                lineNo.currentIndex = lineNo.currentIndex - 1
                spinner.getCurrIndex(currIndex)
            }
        }
    }

    Rectangle {
        id: down
        y: 5*parent.height/6
        width:  parent.width
        height: parent.height/6
        color: "transparent"
        border.color: "#A6A6A6"

        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle = "white"
                ctx.beginPath();
                ctx.moveTo(down.width/3, down.height*0.2);
                ctx.lineTo(down.width*2/3, down.height*0.2);
                ctx.lineTo(down.width/2, down.height*0.8);
                ctx.closePath();
                ctx.fill();
            }
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                lineNo.currentIndex = lineNo.currentIndex + 1
                spinner.getCurrIndex(currIndex)
            }
        }
    }
}
