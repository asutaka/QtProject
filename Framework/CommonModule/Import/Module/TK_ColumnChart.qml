import QtQuick 2.0
import CommonControl 1.0
import CommonModule 1.0

DrawableControl {
    id: _lowerLayer     // lowerlayer
    width: 800
    height: 200

    // UpperLayer or Lowerlayer
    property        alias       lowerLayer:             _lowerLayer
    property        alias       upperLayer:             _upperLayer

    property        int     mNumberColumn:              12
    property        bool    mTypeChart:                  true //true: vertical , false: horizontal
    property        int     mColumnWidth:               41
    property        int     mColumnHeight:              173
    property        var     padding:                    [20,0,0,0]
    property        var     margin:                     [0,0,0,0]

    property        alias   mListColumnType:            dataModel.listColumnType
    property        alias   mListSourceImage:           dataModel.listSourceImage
    property        alias   mListSourceBackgroundImage: dataModel.listSourceBackgroundImage

    property var listColumn: []

    signal updateChart()

    Item {
        id: _columnChart
        anchors.fill: parent
    }

    DataColumnChart {
        id:dataModel
    }

    function creatQmlObj(){

        for(var i = 0; i < mNumberColumn; i ++) {
            var x
            var y
            if(mTypeChart){
                x = (padding[0] + mColumnWidth + padding[2]) * i + padding[0]
                y = 0
            } else {
                x = 0
                y = (padding[1] + mColumnHeight + padding[3]) * i + padding[1]
            }
            listColumn[i] = Qt.createQmlObject('import QtQuick 2.0; import CommonControl 1.0; TK_Column{
                                                        id: column_' + i + '
                                                        x: '+x+'
                                                        y: '+y+'
                                                        width: mColumnWidth
                                                        height: mColumnHeight
                                                        columnType: dataModel.getItemListColumnType('+i+')
                                                        sourceImage: dataModel.getItemListSourceImage('+i+')
                                                        sourceBackgroundImage: dataModel.getItemListSourceBackgroudImage('+i+')
                                                        }', _columnChart)
        }
    }

    function updateColumn(column, index) {
        console.log("index = " + index)
        column.columnType = dataModel.getItemListColumnType(index)
        column.sourceImage = dataModel.getItemListSourceImage(index)
        column.sourceBackgroundImage = dataModel.getItemListSourceBackgroudImage(index)
        column.update()
    }

    function updateColumnChart() {
        for (var i = 0; i < mNumberColumn; i++) {
            updateColumn(listColumn[i],i)
        }
    }

    Component.onCompleted: {
    }

    // UpperLayer
    DrawableControl {
        id: _upperLayer
        anchors.fill: parent
    }
}
