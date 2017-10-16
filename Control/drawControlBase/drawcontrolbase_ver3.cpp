#include "drawcontrolbase_ver3.h"
#include <QDebug>
#include <QDateTime>

DrawControlBase_Ver3::DrawControlBase_Ver3(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    isForLine = false;
    isR = true;
    isPass = false;
    currentLine = 1;
}
DrawControlBase_Ver3::~DrawControlBase_Ver3()
{
}
void DrawControlBase_Ver3::paint(QPainter *painter)
{
    painter->setRenderHint(QPainter::HighQualityAntialiasing);
    painter->fillRect(0, 0, 1024, 640, QColor(0, 0, 0));

    pen.setColor(QColor(166, 166, 166));
    painter->setPen(pen);
    painter->drawRoundedRect(QRect(5, 5, 270, 630), 0, 0);

    DrawCom1(painter);
    DrawCom2(painter);
    DrawCom3(painter);
}
void DrawControlBase_Ver3::updateDraw()
{
    this->update();
}

void DrawControlBase_Ver3::DrawCom1(QPainter *qp)
{
    pen.setColor(QColor(166, 166, 166));
    qp->setPen(pen);
    qp->fillRect(QRect(10, 10, 260, 80), "#29313c");
    qp->drawRoundedRect(QRect(10, 10, 260, 80), 0, 0);
    qp->fillRect(QRect(10, 100, 260, 40), "#29313c");
    qp->drawRoundedRect(QRect(10, 100, 260, 40), 0, 0);

    pen.setColor(Qt::white);
    qp->setPen(pen);
    font.setFamily(":/Images/MS Gothic.ttf");
    font.setPixelSize(23);
    qp->setFont(font);

    // draw text
    qp->drawText(15,35,"Prod");
    qp->drawText(15,130,"LotNo name.");


    font.setPixelSize(40);
    qp->setFont(font);
    pen.setColor(QColor(255,217,187));
    qp->setPen(pen);

    qp->drawText(195,65,"001");

    font.setPixelSize(23);
    qp->setFont(font);
    qp->drawText(15,70,"Sample");
    qp->drawText(195,130,"Anritsu");
}

void DrawControlBase_Ver3::DrawCom2(QPainter *qp)
{
    pen.setColor(QColor(166, 166, 166));
    qp->setPen(pen);
    qp->fillRect(QRect(10, 150, 260, 130), "#29313c");
    qp->drawRoundedRect(QRect(10, 150, 260, 130), 0, 0);

    pen.setColor(Qt::white);
    qp->setPen(pen);
    font.setFamily(":/Images/MS Gothic.ttf");
    font.setPixelSize(23);
    qp->setFont(font);

    // draw text
    qp->drawText(15,180,"基準値");
    qp->drawText(15,210,"下限値");
    qp->drawText(15,240,"上限値");
    qp->drawText(15,270,"号数");

    qp->drawText(245,180,"g");
    qp->drawText(245,210,"g");
    qp->drawText(245,240,"g");
    qp->drawText(245,270,"号");

    pen.setColor(QColor(255,217,187));
    qp->setPen(pen);

    qp->drawText(QRect(80, 180 - font.pixelSize(), 150, font.pixelSize()), Qt::AlignRight, QString::number(12, 'f', 6));
    qp->drawText(QRect(80, 210 - font.pixelSize(), 150, font.pixelSize()), Qt::AlignRight, QString::number(-5, 'f', 2));
    qp->drawText(QRect(80, 240 - font.pixelSize(), 150, font.pixelSize()), Qt::AlignRight, QString::number(5, 'f', 2));
    qp->drawText(QRect(80, 270 - font.pixelSize(), 150, font.pixelSize()), Qt::AlignRight, "0000");
}

void DrawControlBase_Ver3::DrawCom3(QPainter *qp)
{
    pen.setColor(QColor(166, 166, 166));
    qp->setPen(pen);
    qp->fillRect(QRect(10, 290, 260, 160), "#29313c");
    qp->drawRoundedRect(QRect(10, 290, 260, 160), 0, 0);


    pen.setColor(Qt::white);
    qp->setPen(pen);
    font.setFamily(":/Images/MS Gothic.ttf");
    font.setPixelSize(23);
    qp->setFont(font);

    // draw text com3_1
    qp->drawText(15,320, "総数");
    qp->drawText(15,350, "OK");
    qp->drawText(15,380, "NG");
    qp->drawText(15,410, "+NG");
    qp->drawText(15,440, "-NG");

    // draw text com3_2
    pen.setColor(QColor(255,217,187));
    qp->setPen(pen);

    int number = 12345678;
    qp->drawText(QRect(80, 320 - font.pixelSize(), 150, font.pixelSize()), Qt::AlignRight, QString::number(number));
    qp->drawText(QRect(80, 350 - font.pixelSize(), 150, font.pixelSize()), Qt::AlignRight, QString::number(number));
    qp->drawText(QRect(80, 380 - font.pixelSize(), 150, font.pixelSize()), Qt::AlignRight, QString::number(number));
    qp->drawText(QRect(80, 410 - font.pixelSize(), 150, font.pixelSize()), Qt::AlignRight, QString::number(number));
    qp->drawText(QRect(80, 440 - font.pixelSize(), 150, font.pixelSize()), Qt::AlignRight, QString::number(number));

}

void DrawControlBase_Ver3::getIsLeft(bool _isLeft, int _btnID, int _screenID)
{
    if (_screenID == 4) {
        switch (_btnID) {
        case 0:
           isForLine = _isLeft;
            break;
        case 1:
            isR = _isLeft;
            break;
        case 2:
            isPass = _isLeft;
        default:
            break;
        }
    }
    this->update();
}

void DrawControlBase_Ver3::getCurrentLine(int _currentLine)
{
    currentLine = _currentLine;
    this->update();
}
QList<int> DrawControlBase_Ver3::setValueToDraw()
{
    QList<int> listValue;
    for (int i = 0; i < 250; i++)
    {
        int j= 20+ qrand()% 200;
        listValue.append(j);
    }
    return listValue;
}
