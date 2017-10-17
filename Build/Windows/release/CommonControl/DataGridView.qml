import QtQuick 2.0
import QtQuick.Controls 1.4

TableView {
    id: tblView

    property    var         mDataSource                                                             // <=>  CONTROL LIST: DataSource
    property    int         mSelectionMode:         objSelectionMode.mCellSelect                    // <=>	CONTROL LIST:	SelectionMode



    //Row Style
    property    var         mRowBackColor:          ["whitesmoke","white"]                          //  <=>	CONTROL LIST:   RowTemplate
    property    int         mRowBorderWidth                                                         //  <=>	CONTROL LIST:   RowTemplate
    property    color       mRowBorderColor                                                         //  <=>	CONTROL LIST:   RowTemplate
    property	int         mRowHeight:             40                                              //  <=>	CONTROL LIST:	RowTemplate
    property    color       mRowSelectionColor:     "steelblue"                                     //  <=>	CONTROL LIST:   RowTemplate

    //Add New
    property    var         mArrColWidth:           []                                              // Create newly: array width of column
    property    var         mArrColName:            []                                              // Create newly: array name of column header
    property    var         mArrAlignV:             []                                              // Create newly: array Align vertical of column
    property    var         mArrAlignH:             []                                              // Create newly: array Align horizontal of column
    property    int         mColHeaderWidth:        50                                              // Create newly: default width of column header0
    property    var         mInputType:             []                                              // Create newly: choose what to dislay in table view

    //////////////////////////////////////////////////////////////////////
    /*property add new*/
    property    var         mCurrent:               [-1,-1]//The coordinates of the selected cell
    //////////////////////////////////////////////////////////////////////

    width: 500
    height: 400
    model: mDataSource
    selectionMode : SelectionMode.SingleSelection

    resources: {
        var i
        /////////////////////////////////////////////////////////////////////////
        /*Column Key from Model*/
        var arrColumnKey = []
        for(var prop in mDataSource.get(0)) {
            if (prop === "objectNameChanged") break
            arrColumnKey.push(prop.toString())
        }
        arrColumnKey = arrColumnKey.filter( function( item, index, inputArray ) {
            return inputArray.indexOf(item) === index;
        });
        /////////////////////////////////////////////////////////////////////////
        /*Set width of Column*/
        var subWidth = arrColumnKey.length - mArrColWidth.length
        if(subWidth > 0){
            for(i = 0; i < subWidth; i++) {
                mArrColWidth.push(objPrivateProperty.mColWidthDefault)
            }
        }
        /////////////////////////////////////////////////////////////////////////
        /*Set Horizontal Text*/
        var subHorizontal = arrColumnKey.length - mArrAlignH.length
        if(subHorizontal > 0){
            for(i = 0; i < subHorizontal; i++) {
                mArrAlignH.push(Text.AlignHCenter)
            }
        }
        /////////////////////////////////////////////////////////////////////////
        /*Set Vertical Text*/
        var subVertical = arrColumnKey.length - mArrAlignV.length
        if(subVertical > 0){
            for(i = 0; i < subVertical; i++) {
                mArrAlignV.push(Text.AlignVCenter)
            }
        }
        /////////////////////////////////////////////////////////////////////////
        /*Set Column Name*/
        var subName = arrColumnKey.length - mArrColName.length
        if(subName > 0){
            for(i = 0; i < subName; i++) {
                mArrColName.push(objPrivateProperty.mName+(mArrColName.length + 1))
            }
        }
        /////////////////////////////////////////////////////////////////////////
        /*Create TableViewColumn*/
        var obj = []
        var count = 0
        //create TableViewColumn0 default
        obj.push(columnComponent.createObject(tblView, {  width: mColHeaderWidth, resizable: false,movable: false}))
        //create TableViewColumn from Model
        if(mInputType.length > 0){
            for(var j=0;j<mInputType.length;j++){
                for (i = arrColumnKey.length -1 ; i >=0; i--){
                    if(arrColumnKey[i] === mInputType[j]){
                        obj.push(columnComponent.createObject(tblView,
                                                              { role: arrColumnKey[i], title: mArrColName[j], width: mArrColWidth[j]}))
                        break
                    }
                }
            }
            objPrivateProperty.mNumHeader = mInputType.length
        } else {
            var col = arrColumnKey.length -1
            for (i =  col; i >=0; i--) {
                obj.push(columnComponent.createObject(tblView,
                                                      { role: arrColumnKey[i], title: mArrColName[col-i] , width: mArrColWidth[col-i]}))
            }
            objPrivateProperty.mNumHeader = arrColumnKey.length
        }
        return obj
        /////////////////////////////////////////////////////////////////////////
    }

    rowDelegate: Rectangle {
        id: rectRow
        height: mRowHeight
        border.color: mRowBorderColor
        border.width: mRowBorderWidth
        color: {
            if(styleData === null) return "transparent"
            if(styleData.row % 2 === 0)
                return mRowBackColor[0]
            return mRowBackColor[mRowBackColor.length - 1]
        }
//        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                console.log("Click Me:"+styleData.row+","+styleData.column+","+styleData.selected )
//            }
//        }
    }
    itemDelegate: {
        if(mSelectionMode == objSelectionMode.mFullRowSelect)
            return comItemSelectRow
        return comItemSelectCell
    }

    QtObject {
        id: objSelectionMode
        property int mCellSelect :                      0
        property int mFullRowSelect :                   1
        property int mRowHeaderSelect :                 2
        property int mFullColumnSelect :                3
        property int mColumnHeaderSelect :              4
    }

    QtObject {
        id: objPrivateProperty
        property    int         mColWidthDefault:          100             //set default column width
        property    string      mName:              "Column"        //set default column name
//        property    var         mArrX:              []              //multiselect: array value X of position
//        property    var         mArrY:              []              // multiselect: array value y of position
//        property    var         mArrVal:            []              //multiselect: array value of position
        property    int         mNumHeader:         -1              //total number of header
//        property    int         mCurrentColumn:     0
//        property    var         mListItemFirst:     []              //list object item0
//        property    int         mPreviousSelected:  -1              //the previous row selected
//        property    var         mItemSelected:      []              //  Create newly: Item Output
//        property    var         mArrItem:           []              // Create newly: array Item selected previous
    }

    Component{
        id: columnComponent
        TableViewColumn{width: 100 }
    }

    Component{
        id: comItemSelectRow
        Item {
            Text {
                anchors.verticalCenter: parent.verticalCenter
                color: styleData.textColor
                width: parent.width
                elide: Text.ElideRight
                text: styleData.value
            }
        }
    }

    Component{
        id: comItemSelectCell
        Rectangle {
            color:'transparent'
            Text {
                anchors.verticalCenter: parent.verticalCenter
                color: styleData.textColor
                width: parent.width
                elide: Text.ElideRight
                text: txtEdit.text
            }
            TextEdit{
                id:txtEdit
                text: styleData.value
                visible: false
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {

                    console.log("Click Me:"+styleData.row+","+styleData.column+","+styleData.selected )
                }
            }
        }
    }

    function getColorItemDelegate(isEditable){
        switch(mSelectionMode){
            case objSelectionMode.mFullRowSelect:
                if(isEditable){

                }
                else {

                }
                break
            case objSelectionMode.mCellSelect:break
            case objSelectionMode.mRowHeaderSelect:break
            default: break
        }
    }
}
