import QtQuick 2.0
import CommonModule 1.0

ImageButtonControl {
    id: quickMenuBtn

    property alias objQuickMenu: quickMenu
    property int mMenuDirection: direction.mBottom
    property int mMenuAlignment: align.mLeft
    property rect mPosibleArea: Qt.rect(0,0,0,0)

    signal selectedItem()

    QtObject {
        id: direction
        property int mTop: 0
        property int mRight: 1
        property int mBottom: 2
        property int mLeft: 3

    }
    QtObject {
        id: align
        property int mTop: 0
        property int mRight: 1
        property int mBottom: 2
        property int mLeft: 3

    }
    TK_QuickMenu{
        id: quickMenu
        visible: false
    }

    onClicked: {
        if (!objQuickMenu.visible) {

            if (objQuickMenu.listItem.length > 0) {
                //calculate size quick menu
                objQuickMenu.height = objQuickMenu.listItem.length * objQuickMenu.sizeOfItem.height
                objQuickMenu.width = objQuickMenu.sizeOfItem.width

                //get design position of QuickMenu on root button graph
                var sizeQuickMenu = Qt.size(objQuickMenu.width, objQuickMenu.height)
                var position = getPosition()
                var posQuickMenu = calculatePositionOfQuickMenu(mMenuDirection, mMenuAlignment, position, sizeQuickMenu)

                //get posibleArea
                var root = getRootButton()
                var posibleArea = root.mPosibleArea

                //check position is posible to show Quick menu
                var checkValue = checkPosibleArea(posQuickMenu, sizeQuickMenu, posibleArea)
                if(checkValue === true){
                    update_XY_QuickMenu(posQuickMenu, position)
                } else {
                    //move quick menu to show
                    var backupMenuDirection = mMenuDirection
                    var backupMenuAlignment = mMenuAlignment
                    console.log ("checkValue = " + checkValue )
                    switch (checkValue) {
                        case align.mTop:
                            if (mMenuDirection == direction.mTop) {
                                mMenuDirection = direction.mBottom
                            } else if (mMenuAlignment == align.mBottom) {
                                mMenuAlignment = align.mTop
                            }
                            break;
                        case align.mLeft:
                            if (mMenuDirection == direction.mLeft) {
                                mMenuDirection = direction.mRight
                            } else if (mMenuAlignment == align.mRight) {
                                mMenuAlignment = align.mLeft
                            }
                            break;
                        case align.mBottom:
                            if (mMenuDirection == direction.mBottom) {
                                mMenuDirection = direction.mTop
                            } else if (mMenuAlignment == align.mTop) {
                                mMenuAlignment = align.mBottom
                            }
                            break;
                        case align.mRight:
                            if (mMenuDirection == direction.mRight) {
                                mMenuDirection = direction.mLeft
                            } else if (mMenuAlignment == align.mLeft) {
                                mMenuAlignment = align.mRight
                            }
                            break;
                        default:
                            break;
                    }

                    //update position of quickmenu
                    posQuickMenu = calculatePositionOfQuickMenu(mMenuDirection, mMenuAlignment, position, sizeQuickMenu)
                    update_XY_QuickMenu(posQuickMenu, position)
                }

                objQuickMenu.visible = true

            } else {
                selectedItem()
            }
        } else {
            objQuickMenu.visible = false;
        }
    }

    function update_XY_QuickMenu(quickMenuPos, parentButtonPos) {
        objQuickMenu.x = quickMenuPos.x - parentButtonPos.x
        objQuickMenu.y = quickMenuPos.y - parentButtonPos.y
    }

    function calculatePositionOfQuickMenu(dr, al, position, sizeQuickMenu) {
        var pos = Qt.point(0,0)
        console.log ("direction = " + dr )
        console.log ("align = " + al )
        if (dr == direction.mTop && al == align.mLeft){
            pos.x = position.x
            pos.y = position.y - sizeQuickMenu.height

        } else if (dr == direction.mTop && al == align.mRight){
            pos.x = position.x + (width - sizeQuickMenu.width)
            pos.y = position.y - sizeQuickMenu.height

        } else if (dr == direction.mRight && al == align.mTop){
            pos.x = position.x + width
            pos.y = position.y

        } else if (dr == direction.mRight && al == align.mBottom){
            pos.x = position.x + width
            pos.y = position.y + height - sizeQuickMenu.height

        } else if (dr == direction.mBottom && al == align.mLeft){
            pos.x = position.x
            pos.y = position.y + height

        } else if (dr == direction.mBottom && al == align.mRight){
            pos.x = position.x + (width - sizeQuickMenu.width)
            pos.y = position.y + height

        } else if (dr == direction.mLeft && al == align.mTop){
            pos.x = position.x - sizeQuickMenu.width
            pos.y = position.y

        } else if (dr == direction.mLeft && al == align.mBottom){
            pos.x = position.x - sizeQuickMenu.width
            pos.y = position.y + height - sizeQuickMenu.height

        } else {
            //direct: right ; align: top
            pos.x = position.x + width
            pos.y = position.y
        }
        return pos
    }

    function checkPosibleArea(posQuickMenu, sizeQuickMenu, posibleArea){
        if (posQuickMenu.x < posibleArea.x) {
            return align.mLeft
        } else if ((posQuickMenu.x + sizeQuickMenu.width) > (posibleArea.x + posibleArea.width)) {
            return align.mRight
        } else if (posQuickMenu.y < posibleArea.y) {
            return align.mTop
        } else if ((posQuickMenu.y + sizeQuickMenu.height) > (posibleArea.y + posibleArea.height)) {
            return align.mBottom
        } else {
            return true;
        }

    }

    function getRootButton() {
        if (parent.listItem !== undefined) {
            return objQuickMenu.parent.getRootButton()
        } else {
            return this;
        }
    }

    function getPosition() {
        if (parent.listItem !== undefined) {
            var posParent = parent.getPosition()
            var pos_x = posParent.x + x
            var pos_y = posParent.y + y
            return point(pos_x, pos_y)
        } else {
            return Qt.point(0,0);
        }
    }

    Component.onCompleted: {

    }
}
