#include "resultimportlinecolor.h"

ResultImportLineColor::ResultImportLineColor()
{
    _listPens.append(new QPen((QColor(255,0,0)),1));
    _listPens.append(new QPen((QColor(255,255,0)),1));
    _listPens.append(new QPen((QColor(0,139,69)),1));
    _listPens.append(new QPen((QColor(0,0,255)),1));
    _listPens.append(new QPen((QColor(0,191,255)),1));
    _listPens.append(new QPen((QColor(255,106,106)),1));
    _listPens.append(new QPen((QColor(255,127,36)),1));
    _listPens.append(new QPen((QColor(205,16,118)),1));
    _listPens.append(new QPen((QColor(255,255,255)),1));
    _listPens.append(new QPen((QColor(139,71,38)),1));
    _listPens.append(new QPen((QColor(0,255,0)),1));
    _listPens.append(new QPen((QColor(132,131,133)),1));
    _listBoldPens.append(new QPen((QColor(255,0,0)),3));
    _listBoldPens.append(new QPen((QColor(255,255,0)),3));
    _listBoldPens.append(new QPen((QColor(0,139,69)),3));
    _listBoldPens.append(new QPen((QColor(0,0,255)),3));
    _listBoldPens.append(new QPen((QColor(0,191,255)),3));
    _listBoldPens.append(new QPen((QColor(255,106,106)),3));
    _listBoldPens.append(new QPen((QColor(255,127,36)),3));
    _listBoldPens.append(new QPen((QColor(205,16,118)),3));
    _listBoldPens.append(new QPen((QColor(255,255,255)),3));
    _listBoldPens.append(new QPen((QColor(139,71,38)),3));
    _listBoldPens.append(new QPen((QColor(0,255,0)),3));
    _listBoldPens.append(new QPen((QColor(132,131,133)),3));
}
QPen* ResultImportLineColor:: GetDrawLinePen(int colorIndex, PenWidth wight){

    if (wight == PenWidth::Normal)
    {
        return _listPens[colorIndex];
    }
    else
    {
        return _listBoldPens[colorIndex];
    }
}
