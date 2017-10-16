import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import "qrc:/Control/menu"

Rectangle {
    id: testAccordionList
    width: 1024
    height: 640
    color: "lightgray"

    Rectangle {
        x: 200
        y: 50
        width: 300
        height: 520
        color: "lightblue"
        border.color: "darkgreen"

        ColumnLayout {
            id: accList
            anchors.fill: parent
            spacing: 1
            property var currentItem: null

            AccordionList {
                id: fillAmount
                title: "Fill Adjustment"

                Rectangle {
                    color: "lightblue"
                    anchors.fill: parent
                }
            }

            AccordionList {
                id: zoomline
                title: "Zoom Line"
                Rectangle {
                    color: "lightblue"
                    anchors.fill: parent

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 1
                        property var currentItem: null

                        AccordionList {
                            title: "Zoom Line version 4"
                            textSize: 18
                            _margin : 15
                            child: true
                        }

                        AccordionList {
                            title: "Zoom Line version 3"
                            textSize: 18
                            _margin : 15
                            child: true
                        }

                        AccordionList {
                            title: "Zoom Line version 2"
                            textSize: 18
                            _margin : 15
                            child: true
                        }

                        AccordionList {
                            title: "Zoom Line version 1"
                            textSize: 18
                            _margin : 15
                            child: true
                        }

                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                        }
                    }
                }
            }

            AccordionList {
                id: xBar
                title: "X-Bar R/S"

                Rectangle {
                    color: "lightblue"
                    anchors.fill: parent

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 1
                        property var currentItem: null

                        AccordionList {
                            title: "X-Bar R/S version 4"
                            textSize: 18
                            _margin : 15
                            child: true
                        }

                        AccordionList {
                            title: "X-Bar R/S version 3"
                            textSize: 18
                            _margin : 15
                            child: true
                        }

                        AccordionList {
                            title: "X-Bar R/S version 2"
                            textSize: 18
                            _margin : 15
                            child: true
                        }

                        AccordionList {
                            title: "X-Bar R/S version 1"
                            textSize: 18
                            _margin : 15
                            child: true
                        }

                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                        }
                    }
                }
            }

            AccordionList {
                id: integration
                title: "Integration"

                Rectangle {
                    color: "lightblue"
                    anchors.fill: parent
                }
            }

            AccordionList {
                id: production
                title: "Production"

                Rectangle {
                    color: "lightblue"
                    anchors.fill: parent
                }
            }

            AccordionList {
                id: statistic
                title: "Static"

                Rectangle {
                    color: "lightblue"
                    anchors.fill: parent
                }
            }

            AccordionList {
                id: menuList
                title: "Menu List"
            }

            AccordionList {
                id: test
                title: "Screen for test control"

                Rectangle {
                    color: "lightblue"
                    anchors.fill: parent
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
