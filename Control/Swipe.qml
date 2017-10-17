import QtQuick 2.0
import QtQuick.Window 2.2
import "VirtualKey.js" as Ops
Item {
    id: name
    width: parent.width
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    property bool isShowEnable: false

    function getHeight(width) {
        //laptop
        if(width === 1024) return 640;

        //mobile
        var tempWidth = Screen.desktopAvailableWidth;
        var tempHeight = Screen.desktopAvailableHeight;
        console.log(Screen.desktopAvailableHeight);
        console.log(Screen.desktopAvailableWidth);
        var ratio = 1024/768;
        var realHeight;
        if(tempWidth < tempHeight) {
            //tempWidth fixed
            var __height = tempWidth / ratio;
            realHeight = __height - __height * 128 / 768;
            return realHeight;
        }
        if(tempWidth > tempHeight) {
            //tempHeight fixed
            realHeight = tempHeight - tempHeight * 128 / 768
            return realHeight;
        }
    }

    function getDrag(width) {
        if(width === 1024) return 0;
        var ratio = 1024 / 768;
        if(Screen.desktopAvailableWidth < Screen.desktopAvailableHeight) return 0;
        else {
            var tempHeight = Screen.desktopAvailableHeight;
            var tempWidth = tempHeight * ratio;
            return (Screen.desktopAvailableWidth - tempWidth) / 2
        }
    }

    Component.onCompleted: {
        height = getHeight(width);
    }

    onWidthChanged: {
        height = getHeight(width);
    }

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
            drag.maximumX: getDrag(idParent.parent.width);
            onReleased: {
                if(isShowEnable){
                    if(drag.maximumX - idParent.x >= 100){
                        Ops.hideDisplayMenu()
                    } else {
                        idParent.x = getDrag(idParent.parent.width);
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
            State {
                name: "show";
                PropertyChanges {target: idParent; x: getDrag(idParent.parent.width)}

            }]

        transitions:
            Transition {
                NumberAnimation {target: idParent; property: "x"; easing.type: Easing.InOutQuad; duration: 500 }
            }
    }
}
