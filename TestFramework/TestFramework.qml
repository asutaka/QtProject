import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import ControlApp 1.0
import CommonControl 1.0
import CommonModule 1.0
import QtQml.Models 2.2

Item {
    anchors.fill: parent
//    Text {
//           y: 30
//           width: 25
//           text: "FRENCH"
//           elide: Text.ElideRight
//       }
    DataGridView {
        id: grid
        width: 800
        mDataSource: sourceModel
        mRowBackColor:          ["green","pink"]
        mSelectionMode: 0
        mMultiSelect: false
    }

    ListModel {
        id: sourceModel
        ListElement {
            title: "Moby-Dick"
            author: "Herman Melville"
            str0: 'string0'
            str1: 0
            result: 'total0'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "The Adventures of Tom Sawyer"
            author: "Mark Twain"
            str0: 'string1'
            str1: 1
            result: 'total1'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "Cat’s Cradle"
            author: "Kurt Vonnegut"
            str0: 'string2'
            str1: 2
            result: 'total2'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "Farenheit 451"
            author: "Ray Bradbury"
            str0: 'string3'
            str1: 3
            result: 'total3'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "It"
            author: "Stephen King"
            str0: 'string4'
            str1: 4
            result: 'total4'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "On the Road"
            author: "Jack Kerouac"
            str0: 'string5'
            str1:5
            result: 'total5'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "Of Mice and Men"
            author: "John Steinbeck"
            str0: 'string6'
            str1: 6
            result: 'total6'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "Do Androids Dream of Electric Sheep?"
            author: "Philip K. Dick"
            str0: 'string7'
            str1: 7
            result: 'total7'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "Uncle Tom’s Cabin"
            author: "Harriet Beecher Stowe"
            str0: 'string8'
            str1: 8
            result: 'total8'
            imgSrc: ""
        }
        ListElement {
            title: "The Call of the Wild"
            author: "Jack London"
            str0: 'string9'
            str1: 9
            result: 'total9'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "The Old Man and the Sea"
            author: "Ernest Hemingway"
            str0: 'string10'
            str1: 10
            result: 'total10'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "A Streetcar Named Desire"
            author: "Tennessee Williams"
            str0: 'string11'
            str1: 11
            result: 'total11'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "Catch-22"
            author: "Joseph Heller"
            str0: 'string12'
            str1: 12
            result: 'total12'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "One Flew Over the Cuckoo’s Nest"
            author: "Ken Kesey"
            str0: 'string13'
            str1: 13
            result: 'total13'
            imgSrc: ""
        }
        ListElement {
            title: "The Murders in the Rue Morgue"
            author: "Edgar Allan Poe"
            str0: 'string14'
            str1: 14
            result: 'total14'
            imgSrc: ""
        }
        ListElement {
            title: "Breakfast at Tiffany’s"
            author: "Truman Capote"
            str0: 'string15'
            str1: 15
            result: 'total15'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "Death of a Salesman"
            author: "Arthur Miller"
            str0: 'string16'
            str1: 16
            result: 'total16'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "Post Office"
            author: "Charles Bukowski"
            str0: 'string17'
            str1: 17
            result: 'total17'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
        ListElement {
            title: "Herbert West—Reanimator"
            author: "H. P. Lovecraft"
            str0: 'string18'
            str1: 18
            result: 'total18'
            imgSrc: "image://MyProvider/zeroset_discrmark.png"
        }
    }


    ListModel {
        id: largeModel
        Component.onCompleted: {
            for (var i=0 ; i< 50 ; ++i)
                largeModel.append({"name":"Person "+i , "age": Math.round(Math.random()*100), "gender": Math.random()>0.5 ? "image://MyProvider/zeroset_discrmark.png" : "Female"})
        }
    }

    Item {
        anchors.fill: parent

        Component {
            id: editableDelegate
            Rectangle {

                Text {
                    width: parent.width
                    anchors.margins: 4
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    elide: styleData.elideMode
                    text: {
                        if(styleData.value !== undefined){
                            if(typeof styleData.value === 'string'
                                     && styleData.value.indexOf('image://MyProvider/') !== -1){
                                return ''
                            }
                            return styleData.value
                        }
                        return ''
                    }
                    color: styleData.textColor
                    visible: !styleData.selected
                }
//                Image {
//                    id: name
//                    anchors.centerIn: parent
//                    source: {
//                        if(typeof styleData.value === 'string'
//                                && styleData.value !== undefined
//                                && styleData.value.indexOf('image://MyProvider/') !== -1){
//                            return styleData.value
//                        }
//                        return ''
//                    }
//                }
                Loader {
                    id: loaderEditor
                    anchors.fill: parent
                    anchors.margins: 4
                    sourceComponent: styleData.selected ? editor : null
                    Component {
                        id: editor
                        TextInput {
                            id: textinput
                            color: 'red'//styleData.textColor
                            text: styleData.value

                            MouseArea {
                                id: mouseArea
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: textinput.forceActiveFocus()
                            }
                            onEditingFinished: {
                                if (typeof styleData.value === 'number'){
                                    largeModel.setProperty(styleData.row, styleData.role, Number(parseFloat(textinput.text).toFixed(0)))
                                }
                                else
                                    largeModel.setProperty(styleData.row, styleData.role, textinput.text)
                            }
                        }
                    }
                }
            }
        }

//        TableView {
//            model: largeModel
//            anchors.margins: 12
//            anchors.fill:parent

//            TableViewColumn {
//                role: "name"
//                title: "Name"
//                width: 120
//            }
//            TableViewColumn {
//                role: "age"
//                title: "Age"
//                width: 120
//            }
//            TableViewColumn {
//                role: "gender"
//                title: "Gender"
//                width: 120
//            }


//            itemDelegate: {
//                return editableDelegate;
//            }
//        }
        }
}
