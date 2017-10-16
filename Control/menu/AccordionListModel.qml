import QtQuick 2.5

ListModel {
    id: model

    ListElement {
        itemTitle: "Integration"
        attributes: [
            ListElement { subItemTitle: "Integration Version 3" },
            ListElement { subItemTitle: "Integration Version 2" },
            ListElement { subItemTitle: "Integration Version 1" }
        ]
    }
    ListElement {
        itemTitle: "Zoom for each line"
        attributes: [
            ListElement { subItemTitle: "Zoom Line Version 4" },
            ListElement { subItemTitle: "Zoom Line Version 3" },
            ListElement { subItemTitle: "Zoom Line Version 2" },
            ListElement { subItemTitle: "Zoom Line Version 1" }
        ]
    }
    ListElement {
        itemTitle: "Production"
        attributes: [
            ListElement { subItemTitle: "Production Version 1" }
        ]
    }
    ListElement {
        itemTitle: "X-Bar R/S"
        attributes: [
            ListElement { subItemTitle: "X-Bar R/S Version 4" },
            ListElement { subItemTitle: "X-Bar R/S Version 3" },
            ListElement { subItemTitle: "X-Bar R/S Version 2" },
            ListElement { subItemTitle: "X-Bar R/S Version 1" }
        ]
    }
    ListElement {
        itemTitle: "MenuList"
        attributes: [
            ListElement { subItemTitle: "MenuList Version 3" },
            ListElement { subItemTitle: "MenuList Version 2" },
            ListElement { subItemTitle: "MenuList Version 1" }
        ]
    }
    ListElement {
        itemTitle: "Screen for test control"
        attributes: [
            ListElement { subItemTitle: "Test accordion list" },
            ListElement { subItemTitle: "Test Slider control" },
            ListElement { subItemTitle: "Test Xray screen" }
        ]
    }

}
