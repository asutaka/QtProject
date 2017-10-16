#include "resultimportline.h"
#include <QPainter>

ResultImportLine::ResultImportLine()
{
    LoadImages();
}


ResultImportLine::~ResultImportLine()
{
}
void ResultImportLine :: DrawControl(QPainter *qp, QPoint pos){
    QPen Color((QColor(255,255,255)),1);
    qp->setPen(Color);
    if(!isSelect){
        QRect rectangle(pos, QSize(80, 30));
        qp->drawRect(rectangle);
    }
    else{
        QPen Color((QColor(255,255,255)),3);
        qp->setPen(Color);
        QRect rectangle(pos, QSize(80, 30));
        qp->drawRect(rectangle);
    }
    if (lineNo != 0)
    {
        // Line ball image drawing
        qp->drawPixmap(pos.x() + 45,pos.y()+3, arrayPixmapLineNo[lineNo - 1]);

        // Graph line color sample drawing
        QPen* pen =  obj.GetDrawLinePen(importNumber);
        qp->setPen(pen->color());
        qp->drawLine(pos.x() + 8,pos.y()+15,pos.x() + 35,pos.y()+15);

    }
}
void ResultImportLine :: LoadImages(){
    bool bRes = false;
    bRes = arrayPixmapLineNo[0].load(":/Images/Number_w24h24_01.png");
    bRes = arrayPixmapLineNo[1].load(":/Images/Number_w24h24_02.png");
    bRes = arrayPixmapLineNo[2].load(":/Images/Number_w24h24_03.png");
    bRes = arrayPixmapLineNo[3].load(":/Images/Number_w24h24_04.png");
    bRes = arrayPixmapLineNo[4].load(":/Images/Number_w24h24_05.png");
    bRes = arrayPixmapLineNo[5].load(":/Images/Number_w24h24_06.png");
    bRes = arrayPixmapLineNo[6].load(":/Images/Number_w24h24_07.png");
    bRes = arrayPixmapLineNo[7].load(":/Images/Number_w24h24_08.png");
    bRes = arrayPixmapLineNo[8].load(":/Images/Number_w24h24_09.png");
    bRes = arrayPixmapLineNo[9].load(":/Images/Number_w24h24_10.png");
    bRes = arrayPixmapLineNo[10].load(":/Images/Number_w24h24_11.png");
    bRes = arrayPixmapLineNo[11].load(":/Images/Number_w24h24_12.png");
}
