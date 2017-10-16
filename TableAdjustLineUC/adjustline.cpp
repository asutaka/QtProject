#include "adjustline.h"
#include <QPainter>
#include <QDebug>
#include <QDateTime>

AdjustLine::AdjustLine()
{
    LoadImages();
    selectedSensCorr = true;
}
AdjustLine::~AdjustLine()
{
}
void AdjustLine::DrawControl(QPainter *qp, QPoint pos)
{
    QRect rec(pos.x(),pos.y(),cellWidth,cellHeight);
    for (int i = 0; i < stepCount; i++)
    {
        rec.setY(pos.y() + cellHeight*i + i);
        rec.setHeight(cellHeight);
        qp->fillRect(rec, QColor(0,0,0));
    }

    DrawValue(qp, pos);

    if (isSelected)
    {
        rec.setY(pos.y());
        rec.setHeight(cellHeight*stepCount + (stepCount - 1));
        qp->fillRect(rec,QBrush(QColor(0,0,255,100)));
    }
}
void AdjustLine::DrawValue(QPainter *qp, QPoint pos)
{
    //Draw Line No ball
    GetImageLineNo(LineNo);
    qp->drawPixmap(pos.x() + 5,pos.y()+ 7, pixmapLineNo);

    //Draw Value
    QPen NumberColor((QColor(255,217,187)),1);
    qp->setPen(NumberColor);

    if (isValid && selectedSensCorr)
    {
        value = "0.00";
        level = "0";
    }
    else
    {
        value = "--";
        level = "-";
    }
    qp->drawText(QRect(pos.x(),pos.y()+ cellHeight + 7, cellWidth - 5, cellHeight), Qt::AlignRight, value);

    //Draw Level
    if (stepCount == 3)
    {
        qp->drawText(QRect(pos.x(),pos.y()+ cellHeight*2 + 7, cellWidth - 5, cellHeight), Qt::AlignRight, level);
    }
    //Draw Image Result
    if (pixmapStep1Kind.width() != 0)
    {
        qp->drawPixmap(pos.x() + pixmapLineNo.width() + 30,pos.y()+ 7, pixmapStep1Kind);
    } else if (strStep1Kind != NULL)
    {
        qp->drawText(QRect(pos.x(),pos.y()+ 7, cellWidth - 5, cellHeight), Qt::AlignRight, strStep1Kind);
    }
}
void AdjustLine::GetImageLineNo(int line)
{
    if (isValid)
    {
        pixmapLineNo = arrayPixmapLineNo[line - 1];
    }
    else
    {
        pixmapLineNo = arrayPixmapLineNo_out[line - 1];
    }
}
void AdjustLine::LoadImages()
{
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

    bRes = arrayPixmapLineNo_out[0].load(":/Images/Number_w24h24_01_out.png");
    bRes = arrayPixmapLineNo_out[1].load(":/Images/Number_w24h24_02_out.png");
    bRes = arrayPixmapLineNo_out[2].load(":/Images/Number_w24h24_03_out.png");
    bRes = arrayPixmapLineNo_out[3].load(":/Images/Number_w24h24_04_out.png");
    bRes = arrayPixmapLineNo_out[4].load(":/Images/Number_w24h24_05_out.png");
    bRes = arrayPixmapLineNo_out[5].load(":/Images/Number_w24h24_06_out.png");
    bRes = arrayPixmapLineNo_out[6].load(":/Images/Number_w24h24_07_out.png");
    bRes = arrayPixmapLineNo_out[7].load(":/Images/Number_w24h24_08_out.png");
    bRes = arrayPixmapLineNo_out[8].load(":/Images/Number_w24h24_09_out.png");
    bRes = arrayPixmapLineNo_out[9].load(":/Images/Number_w24h24_10_out.png");
    bRes = arrayPixmapLineNo_out[10].load(":/Images/Number_w24h24_11_out.png");
    bRes = arrayPixmapLineNo_out[11].load(":/Images/Number_w24h24_12_out.png");

}
