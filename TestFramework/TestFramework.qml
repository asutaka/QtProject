import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import ControlApp 1.0
import CommonControl 1.0
import CommonModule 1.0
import Frame 1.0
import QtQml.Models 2.2

Item {
    anchors.fill: parent
    TK_MenuList{
        id: menuList
        height: 400
        width: 500
        x: 300
        mDataSource: sourceModel
        mImageError: "image://MyProvider/error_16x16.png"
        mImageEdit:  "image://MyProvider/editing.png"
        mHeaderImageSrc: "image://MyProvider/TabMenu.png"
    }

    ListModel {
        id: sourceModel
        ListElement {
            title: "Moby-Dick"
            author: "Herman Melville"
            str0: 'string0'
            str1: '0'
            result: 'total0'
        }
        ListElement {
            title: "The Adventures of Tom Sawyer"
            author: "Mark Twain"
            str0: 'string1'
            str1: '1'
            result: 'total1'
        }
        ListElement {
            title: "Cat’s Cradle"
            author: "Kurt Vonnegut"
            str0: 'string2'
            str1: '2'
            result: 'total2'
        }
        ListElement {
            title: "Farenheit 451"
            author: "Ray Bradbury"
            str0: 'string3'
            str1: '3'
            result: 'total3'
        }
        ListElement {
            title: "It"
            author: "Stephen King"
            str0: 'string4'
            str1: '4'
            result: 'total4'
        }
        ListElement {
            title: "On the Road"
            author: "Jack Kerouac"
            str0: 'string5'
            str1: '5'
            result: 'total5'
        }
        ListElement {
            title: "Of Mice and Men"
            author: "John Steinbeck"
            str0: 'string6'
            str1: '6'
            result: 'total6'
        }
        ListElement {
            title: "Do Androids Dream of Electric Sheep?"
            author: "Philip K. Dick"
            str0: 'string7'
            str1: '7'
            result: 'total7'
        }
        ListElement {
            title: "Uncle Tom’s Cabin"
            author: "Harriet Beecher Stowe"
            str0: 'string8'
            str1: '8'
            result: 'total8'
        }
        ListElement {
            title: "The Call of the Wild"
            author: "Jack London"
            str0: 'string9'
            str1: '9'
            result: 'total9'
        }
        ListElement {
            title: "The Old Man and the Sea"
            author: "Ernest Hemingway"
            str0: 'string10'
            str1: '10'
            result: 'total10'
        }
        ListElement {
            title: "A Streetcar Named Desire"
            author: "Tennessee Williams"
            str0: 'string11'
            str1: '11'
            result: 'total11'
        }
        ListElement {
            title: "Catch-22"
            author: "Joseph Heller"
            str0: 'string12'
            str1: '12'
            result: 'total12'
        }
        ListElement {
            title: "One Flew Over the Cuckoo’s Nest"
            author: "Ken Kesey"
            str0: 'string13'
            str1: '13'
            result: 'total13'
        }
        ListElement {
            title: "The Murders in the Rue Morgue"
            author: "Edgar Allan Poe"
            str0: 'string14'
            str1: '14'
            result: 'total14'
        }
        ListElement {
            title: "Breakfast at Tiffany’s"
            author: "Truman Capote"
            str0: 'string15'
            str1: '15'
            result: 'total15'
        }
        ListElement {
            title: "Death of a Salesman"
            author: "Arthur Miller"
            str0: 'string16'
            str1: '16'
            result: 'total16'
        }
        ListElement {
            title: "Post Office"
            author: "Charles Bukowski"
            str0: 'string17'
            str1: '17'
            result: 'total17'
        }
        ListElement {
            title: "Herbert West—Reanimator"
            author: "H. P. Lovecraft"
            str0: 'string18'
            str1: '18'
            result: 'total18'
        }
    }
}



/*

    Interface listmodel

    NextScreen


*/
