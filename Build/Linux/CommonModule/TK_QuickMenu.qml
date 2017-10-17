import QtQuick 2.7

Flow {
    id: quickMenu
    flow: Flow.TopToBottom

    property var listItem: []
    property size sizeOfItem: Qt.size(200,50)

    function addQuickMenuButton(quickMenuButton) {
        //normalize item
        quickMenuButton.width = sizeOfItem.width
        quickMenuButton.height = sizeOfItem.height

        // add item for Qick menu
        quickMenuButton.parent = quickMenu
        listItem.push(quickMenuButton) // recheck
    }

    function getPosition() {
        var posParent = parent.getPosition()
        var pos_x = posParent.x + x
        var pos_y = posParent.y + y
        return Qt.point(pos_x, pos_y)
    }
}
