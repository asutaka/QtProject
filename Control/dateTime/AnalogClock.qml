import QtQuick 2.0
import "qrc:/Control/dateTime" as Content

Item {
    Rectangle {
        id: root
        width: 450; height: 350
        color: "transparent"
        ListView {
                id: clockview
                anchors.fill: parent
                orientation: ListView.Horizontal
                snapMode: ListView.SnapOneItem
                highlightRangeMode: ListView.ApplyRange

                delegate: Content.ContentClock { city: cityName; shift: timeShift }
                model: ListModel {
//                    ListElement { cityName: "Ha Noi"; timeShift: 7 }
                    ListElement { cityName: "Tokyo"; timeShift: 9 }
                }
            }
}

}
