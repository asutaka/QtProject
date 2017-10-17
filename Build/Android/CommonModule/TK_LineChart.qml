import QtQuick 2.0
import CommonControl 1.0
import CommonModule 1.0


DrawableControl {
    id: _lowerLayer

    property int mDefaultPointWidth: 1
    property string mDefaultPointColor: "#000000"
    property var mListLine: []
    property var mFocusLine: undefined

    property alias mLowerLayer: _lowerLayer
    property alias mUpperLayer: _upperLayer

    signal updateChart()

    Flickable {
        id: flick
        x: 0
        y: 0
        width: _lowerLayer.width
        height: _lowerLayer.height
        contentWidth: lineContainer.width
        clip: true

        Rectangle {
            id: lineContainer
            x: 0
            y: 0
            clip: false
            color: "transparent"
            width: _lowerLayer.width
            height: _lowerLayer.height
        }
    }

    DrawableControl {
        id: _upperLayer
    }

    function focusLine(lineName) {
        var lineObj = mListLine[lineName];

        if (lineObj === undefined || lineObj.lineName === lineName)
            return;

        if (mFocusLine !== undefined)
            mFocusLine.addPoint.disconnect(setFlickContentPosition);

        mFocusLine = lineObj
        mFocusLine.addPoint.connect(setFlickContentPosition);
    }

    function getLine(lineName) {
        return mListLine[lineName];
    }

    function lineProperty() {
        var lineProperty = []
        lineProperty.lineName = "line_" + mListLine.length
        lineProperty.lineWidth = mDefaultPointWidth
        lineProperty.lineColor = mDefaultPointColor
        lineProperty.directionType = TK_Line.LEFTTORIGHT

        return lineProperty;
    }

    function createLine(lineProperty) {

        var directionTypeStr = ""
        if (lineProperty.directionType === TK_Line.LEFTTORIGHT) {
            directionTypeStr = "TK_Line.LEFTTORIGHT"
        }
        else if (lineProperty.directionType === TK_Line.RIGHTTOLEFT) {
            directionTypeStr = "TK_Line.RIGHTTOLEFT"
        }
        else if (lineProperty.directionType === TK_Line.BOTTOMTOTOP) {
            directionTypeStr = "TK_Line.BOTTOMTOTOP"
        }
        else if (lineProperty.directionType === TK_Line.TOPTOBOTTOM) {
            directionTypeStr = "TK_Line.TOPTOBOTTOM"
        }

        var lineObj = Qt.createQmlObject('import QtQuick 2.0;
                           import CommonControl 1.0;
                           TK_Line {
                               id:' + lineProperty.lineName + '
                               x: 0
                               y: 0
                               width:'    + lineContainer.width + '
                               height:'   +  lineContainer.height+ '
                               directionType:' + directionTypeStr + '
                               lineWidth:' + lineProperty.lineWidth + '
                               lineColor:"' + lineProperty.lineColor + '"
                               property string lineName:"' + lineProperty.lineName + '"
                               property int mCurrentIndex: -1
                               signal addPoint(var id)
                           }', lineContainer)

        mListLine[lineProperty.lineName] = lineObj;
        return lineObj;
    }

    function setFlickContentPosition(line) {
        if (line === undefined)
            return;

        if (line.plotArea.width > flick.width)
        {
            flick.contentX += line.distancePointX
            flick.contentWidth = line.plotArea.width
        }
    }

    function clearAllLine() {
        for (var i in mListLine) {
            mListLine[i].destroy();
        }

        mListLine = []
    }

    function addPointToLine(lineName, x, y) {
        var lineObj = getLine(lineName);

        if (lineObj === undefined)
            return;

        lineObj.append(x,y);
    }

    function removePointOfLine (lineName) {
        var lineObj = getLine(lineName);

        if (lineObj === undefined)
            return;

        lineObj.removeBack();
    }

    function getPointNumOfLine(lineName) {
        var lineObj = getLine(lineName);

        if (lineObj === undefined)
            return 0;

        return lineObj.pointNum();
    }

    function updateLine(lineName) {
        var lineObj = getLine(lineName);

        if (lineObj === undefined)
            return;

        return lineObj.update();
    }
}
