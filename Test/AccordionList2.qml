import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQml.Models 2.2
import "qrc:/Control/menu"
import ControlApp 1.0

Rectangle {
    x:0
    y:0
    width: 1024
    height: 640
    color: "#4F4F4F"
    property alias objTestAccordionListV2VM: testAccordionListV2VM
    TestVM {
        id:testAccordionListV2VM
    }

    Rectangle{
        width: 300
        height: 640
        color: "#C1FFC1"
        opacity: 0.4
    }
    Item{
        id: container
        width: 300
        height: 640
        property int animationDuration: 200
        property int indent: 25
        property string bgImage: "qrc:/Images/list_item.png"
        property string bgImagePressed: "qrc:/Images/list_item_pressed.png"
        property string bgImageActive: "qrc:/Images/list_item_active.png"
        property string bgImageSubItem: "qrc:/Images/list_subitem.png"
        property string arrow: "qrc:/Images/arrow.png"
        property string headerItemFontName: "Helvetica"
        property int headerItemFontSize: 14
        property color headerItemFontColor: "#104E8B"
        property string subItemFontName: "Helvetica"
        property int subItemFontSize: headerItemFontSize-2
        property color subItemFontColor: "#104E8B"

        signal itemClicked(string itemTitle, string subItemTitle)

        AccordionListModel {
            id: mainModel
        }

        ListView {
            id: listView
            height: parent.height
            anchors {
                left: parent.left
                right: parent.right
            }
            model: mainModel
            delegate: listViewDelegate
            focus: true
            spacing: 1
        }

        Component {
            id: listViewDelegate
            Item {
                id: delegate
                property int itemHeight: 45
                property alias expandedItemCount: subItemRepeater.count
                property bool expanded: false
                width: container.width
                height: headerItemRect.height + subItemsRect.height

                ListItem {
                    id: headerItemRect
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.itemHeight
                    text: itemTitle
                    bgImage: container.bgImage
                    bgImagePressed: container.bgImagePressed
                    bgImageActive: container.bgImageActive
                    fontName: container.headerItemFontName
                    fontSize: container.headerItemFontSize
                    fontColor: container.headerItemFontColor
                    fontBold: true
                    onClicked: {
                        expanded = !expanded
                    }

                    Image {
                        id: arrow
                        fillMode: "PreserveAspectFit"
                        height: parent.height*0.3
                        source: container.arrow
                        rotation: expanded ? 90 : 0
                        smooth: true
                        anchors {
                            right: parent.right
                            verticalCenter: parent.verticalCenter
                            rightMargin: 10
                        }
                    }
                }

                Item {
                    id: subItemsRect
                    property int itemHeight: delegate.itemHeight

                    y: headerItemRect.height
                    width: parent.width
                    height: expanded ? expandedItemCount * itemHeight : 0
                    clip: true

                    opacity: 1
                    Behavior on height {
                        SequentialAnimation {
                            NumberAnimation {
                                duration: container.animationDuration; easing.type: Easing.InOutQuad
                            }
                        }
                    }

                    Column {
                        width: parent.width
                        Repeater {
                            id: subItemRepeater
                            model: attributes
                            width: subItemsRect.width

                            ListItem {
                                id: subListItem
                                width: delegate.width
                                height: subItemsRect.itemHeight
                                text: subItemTitle
                                bgImage: container.bgImageSubItem
                                fontName: container.subItemFontName
                                fontSize: container.subItemFontSize
                                fontColor: container.subItemFontColor
                                textIndent: container.indent
                                onClicked: {
                                    itemClicked(itemTitle, subItemTitle)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    Component.onCompleted: {
        objTestAccordionListV2VM.onLoad();
    }
}
