import QtQuick 2.0
import "VirtualKey.js" as Ops
Item {
    id: name
    anchors.top: parent.top
    anchors.topMargin: 64

    width: parent.width
    height: parent.height - 128

    property bool isShowEnable: false

    onIsShowEnableChanged: {
        if(isShowEnable){
            idBackground.visible=true;
            idParent.state = "show"
        } else {
            idBackground.visible=false;
            idParent.state = "hide"
        }
    }

    Rectangle {
        id: idBackground
        anchors.fill: parent
        visible: false
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            onPressed: {
                Ops.hideDisplayMenu();
            }
        }
    }

    Rectangle {
        id: idParent
        x: -idParent.width + 20
        width: 320
        height: parent.height
        color: "transparent"

        Rectangle {
            id: idChild
            width: idParent.width - 20
            height: parent.height
            color: "transparent"
            Loader {
                sourceComponent: Ops.loadSwipe();
                anchors.fill: parent
            }
        }

        MouseArea {
            anchors.fill: parent
            propagateComposedEvents: true
            drag.target: idParent
            drag.filterChildren: true
            drag.axis: Drag.XAxis
            drag.minimumX: -idParent.width + 20
            drag.maximumX: 0

            onReleased: {
                if(isShowEnable){
                    if(drag.maximumX - idParent.x >= 100){
                        Ops.hideDisplayMenu()
                    } else {
                        idParent.x = 0
                    }
                } else {
                    if(idParent.x - drag.minimumX >= 100){
                        Ops.showDisplayMenu()
                    } else {
                        idParent.x = -idParent.width + 20
                    }
                }
            }
        }

        states: [
            State { name: "hide"; PropertyChanges {target: idParent; x: - idParent.width + 20}
            },
            State { name: "show"; PropertyChanges {target: idParent; x: 0}
            } ]

        transitions:
            Transition {
                NumberAnimation {target: idParent; property: "x"; easing.type: Easing.InOutQuad; duration: 500 }
            }
    }
}
