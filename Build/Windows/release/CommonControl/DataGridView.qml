import QtQuick 2.7
import QtQuick.Controls 1.4

TableView {
    id: tblView

    property    var         mDataSource                                                             // <=>  CONTROL LIST: DataSource
    property    bool        mMultiSelect:           false                                           // <=>	CONTROL LIST:	MultiSelect
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

    width: 500
    height: 400
    model: mDataSource
    selectionMode : {
        if(mMultiSelect)
            return SelectionMode.ExtendedSelection
        return SelectionMode.SingleSelection
    }

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
            return getColor(true,styleData,-1,-1)
        }
    }
    itemDelegate: {
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
            property int iCol : -1
            property int iRow : -1
            color:{
//                return 'transparent'
                console.log("StyleData:"+styleData.row+','+styleData.column)
                return getColor(false,styleData,iRow,iCol)
            }
            MouseArea {
                Component.onCompleted: {
                    switch(mSelectionMode){
                        case objSelectionMode.mCellSelect:
                            anchors.fill = parent
                            break
                        case objSelectionMode.mFullRowSelect:
                        case objSelectionMode.mRowHeaderSelect:
                        default:
                            break
                    }
                }
                onPressed: {
                    iCol = styleData.column
                    iRow = styleData.row
                    tblView.selection.select(styleData.row)
                    console.log("WTF:"+styleData.row+','+styleData.column)
                }
            }

            Text {
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter
                color: 'black'
                elide: styleData.elideMode
                text: {
                    if(styleData.value !== undefined && !isSrcImg(styleData.value)){
                        return styleData.value
                    }
                    return ''
                }
                visible: {
                    switch(mSelectionMode){
                        case objSelectionMode.mCellSelect:
                            !styleData.selected ||
                            !(styleData.selected && styleData.column === iCol)
                            break
                        case objSelectionMode.mFullRowSelect:
                        case objSelectionMode.mRowHeaderSelect:
                        default:
                            !styleData.selected
                            break
                    }
                }
            }
            Image {
                anchors.centerIn: parent
                source: {
                    if(isSrcImg(styleData.value)){
                        return styleData.value
                    }
                    return ''
                }
            }
            Loader {
                id: loaderEditor
                anchors.fill: parent
                sourceComponent: {
                        if(!styleData.selected) return null
                        switch(mSelectionMode){
                            case objSelectionMode.mCellSelect:
                                if(styleData.column === iCol){
                                    editor
                                }
                                else {
                                    null
                                }
                                break
                            case objSelectionMode.mFullRowSelect:
                            case objSelectionMode.mRowHeaderSelect:
                            default:
                                editor
                                break
                        }
                }
                Component {
                    id: editor
                    TextInput {
                        id: textinput
                        color: 'red'
                        text: styleData.value
                        visible: !isSrcImg(styleData.value)

                        MouseArea {
                            id: mouseArea
                            anchors.fill : parent
                            hoverEnabled: true
                            onDoubleClicked: textinput.forceActiveFocus()
//                            onPressed: tblView.selection.deselect(styleData.row)
                        }
                        onEditingFinished: {
                            if (typeof styleData.value === 'number'){
                                mDataSource.setProperty(styleData.row, styleData.role, Number(parseFloat(textinput.text).toFixed(0)))
                            }
                            else
                                mDataSource.setProperty(styleData.row, styleData.role, textinput.text)
                        }
                    }
                }
            }
        }
    }
    /*
        sumary: function getColor set to item
        parameter:  opt: mode row or cell
                    + 0: row
                    + 1: cell
    */
    function getColor(isRow,iStyleData,iRow,iColum){

        //selectionMode, multiselect,selected
        console.log("GetColor:"+iStyleData.row+','+iStyleData.column)
        var result = 'transparent'
        if(iStyleData === null) return result

        //row
        if(isRow){
            console.log("ROW")
            //default is not select
            if(!iStyleData.selected){
                result = getNormalColor(iStyleData)
            }
            else {
                switch(mSelectionMode){
                    case objSelectionMode.mFullRowSelect:
                    case objSelectionMode.mRowHeaderSelect:
                        result = mRowSelectionColor
                        break
                    case objSelectionMode.mCellSelect:
                    default:
                        result = getNormalColor(iStyleData)
                        break
                }
            }
        }
        else {
            console.log("COLUMN:"+iStyleData.selected)
//            //default is not select
            if(!iStyleData.selected){
                result = getNormalColor(iStyleData)
            }
            else {
                switch(mSelectionMode){
                case objSelectionMode.mFullRowSelect: break
                case objSelectionMode.mRowHeaderSelect:break
//                    result = mRowSelectionColor
//                    break
                case objSelectionMode.mCellSelect:
                    if(iStyleData.column === iColum){
                        result = mRowSelectionColor
                    }
                    else {
                        result = getNormalColor(iStyleData)
                    }
                    break
                default:
                    result = getNormalColor(iStyleData)
                    break
                }
            }
        }
        return result
    }
    function getNormalColor(iStyleData){
        if(iStyleData.row % 2 === 0){
            return mRowBackColor[0]
        }
        else {
            return mRowBackColor[mRowBackColor.length - 1]
        }
    }

    function isSrcImg(obj){
        if(obj !== undefined){
            if(typeof obj === 'string'
                     && obj.indexOf('image://MyProvider/') !== -1){
                return true
            }
        }
        return false
    }
}
