import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: spinner
    width: 80
    height: 210
    color: "#2d343f"
    border.color: "#A6A6A6"

    property int currIndex: 1
    property int mod
    signal getCurrIndex (int _index)

    function formatText(count, modelData) {
        var data = (count === 12 ? modelData + 1 : modelData);
        return data;
    }

    Component {
        id: delegateComponent

        Label {
            rotation: 90
            color: "white"
            text: formatText(Tumbler.tumbler.count, modelData)
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: formatText(Tumbler.tumbler.count, modelData) === currIndex ? 60 : 20
        }
    }

    Tumbler {
        id: lineNo
        anchors.centerIn: parent
        width: parent.width
        height: 2*parent.height/3
        model: mod
        delegate: delegateComponent

        onCurrentIndexChanged: {
            currIndex = currentIndex + 1
            spinner.getCurrIndex(currIndex)
        }
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
                ctx.moveTo(40, 5);
                ctx.lineTo(25, 30);
                ctx.lineTo(55, 30);
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
                ctx.moveTo(40, 30);
                ctx.lineTo(25, 5);
                ctx.lineTo(55, 5);
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
