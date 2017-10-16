#include "cw.h"

CW::CW(QQuickItem *parent)
    : DrawControlBase_ver6(parent)
{
    LoadImages();
}

CW::~CW()
{
}

void CW::paint(QPainter *painter)
{
    DrawControlBase_ver6::paint(painter);
    DrawContent(painter);
}

void CW::DrawContent(QPainter *painter)
{
    QSize sBorder(560, 150);
    QRect rect(0, 0, _arrMassbarBargraph[0].width(), _arrMassbarBargraph[0].height());
    QPoint pMassBar((_WIDTH_SCREEN - rect.width()) / 2, _y_COM + _HEIGHT_COM + 50);
    QPoint pBorder(pMassBar.x() - 10, pMassBar.y() + rect.height() + 15);

    //Draw background MassBarGraph
    painter->drawPixmap(pMassBar.x(), pMassBar.y(), _arrMassbarBargraph[0].copy(rect));

    //Draw MassBarGraph
#ifdef STUP_DISPLAY_DATA
    int index = rand() % 4;
    QRect resultMassBar(0, 0, rand() % _arrMassbarBargraph[index].width(), rect.height());
    QPixmap massBargraph = _arrMassbarBargraph[index].copy(resultMassBar);
#endif
    painter->drawPixmap(pMassBar.x(), pMassBar.y(), massBargraph);

    //Draw BarLimit
    int distance = 100;
    int yBarLimit = pMassBar.y() - _arrAverageBarLimit[0].height() - 5;
    painter->drawPixmap(pMassBar.x() + distance, yBarLimit, _arrAverageBarLimit[0]);
    painter->drawPixmap(pMassBar.x() + rect.width() - distance, yBarLimit, _arrAverageBarLimit[0]);

    //Draw Average
    painter->drawPixmap(pMassBar.x() - (_arrAverageBarLimit[1].width() / 2),
                        pMassBar.y() + rect.height(),
                        _arrAverageBarLimit[1]);

    //Draw measure unit
    QPen pen;
    pen.setColor(Qt::white);
    pen.setWidth(1);
    pen.setStyle(Qt::SolidLine);
    painter->setPen(pen);
    QFont font;
    font.setFamily("MS Gothic");
    font.setPixelSize(80);
    font.setBold(false);
    painter->setFont(font);

#ifdef STUP_DISPLAY_DATA
    QString unitMeasure = "g";
#endif
    painter->drawText(pBorder.x() - 120, pBorder.y() + 50,
                      sBorder.width() - 10, sBorder.height() + 50,
                      Qt::AlignRight, unitMeasure);

    //Draw measure value
    pen.setColor(QColor(255, 217, 187));
    painter->setPen(pen);
#ifdef STUP_DISPLAY_DATA
    QString valueMeasure = "1234567.8";
#endif
    painter->drawText(pBorder.x() - 170, pBorder.y() + 50,
                      sBorder.width() - 10, sBorder.height() + 50,
                      Qt::AlignRight, valueMeasure);

    //Draw Result
    painter->drawPixmap(pBorder.x() + 10, pBorder.y() + 185, _arrLine[0]);
    int xResult = pBorder.x() + _arrLine[0].width();
    for (int i = 0; i < _lineNo; i++)
    {
        if ((i % 4) == 0 && i != 0)
        {
            xResult += 20;
        }
        xResult += _arrLine[1].width();
        painter->drawPixmap(xResult, pBorder.y() + 195, _arrLine[1]);

#ifdef STUP_DISPLAY_DATA
        index = (rand() % 3) + 1;
        QPixmap bmpLineResult = _arrLine[index];
#endif
        painter->drawPixmap(xResult, pBorder.y() + 195, bmpLineResult);
    }

#ifdef STUP_DISPLAY_DATA
    index = rand() % 3;
    QPixmap bmpResult = _arrResult[index];
#endif
    painter->drawPixmap(pBorder.x() + sBorder.width(), pBorder.y() + 140, bmpResult);

    //Draw border
    painter->drawRoundedRect(QRect(pBorder.x(), pBorder.y() + 15, sBorder.width(), sBorder.height()), 5, 5);
    painter->drawRoundedRect(QRect(pBorder.x(), pBorder.y() + 170, sBorder.width(), sBorder.height() - 70), 5, 5);
}

void CW::LoadImages()
{
    _arrMassbarBargraph[0].load(":/Images/MassBar.png");
    _arrMassbarBargraph[1].load(":/Images/MassBar_OK.png");
    _arrMassbarBargraph[2].load(":/Images/MassBar_PNG.png");
    _arrMassbarBargraph[3].load(":/Images/MassBar_MNG.png");

    _arrAverageBarLimit[0].load(":/Images/Integration_CW_Bar_Limit.png");
    _arrAverageBarLimit[1].load(":/Images/Integration_Average_01.png");

    _arrLine[0].load(":/Images/vduw.png");
    _arrLine[1].load(":/Images/rectangle_gray.png");
    _arrLine[2].load(":/Images/rectangle_green.png");
    _arrLine[3].load(":/Images/rectangle_red.png");

    _arrResult[0].load(":/Images/cw_eval_minus.png");
    _arrResult[1].load(":/Images/cw_eval_pass.png");
    _arrResult[2].load(":/Images/cw_eval_plusng.png");
}
