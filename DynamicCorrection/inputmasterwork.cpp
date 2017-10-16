#include "inputmasterwork.h"
#include <QPainter>
#include <QDebug>
#include <QDateTime>

InputMasterWork::InputMasterWork(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    maxline = 12;
    x_begin = 510;
    y_begin = 161;
    refVal = "6.00";

    LoadImages();
    for (int i = 0; i < maxline; i++)
    {
        arrayValue[i] = refVal;
        arrayUnit[i] = "g";
    }
}
InputMasterWork::~InputMasterWork()
{
}
void InputMasterWork::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 640, QColor(0, 0, 0));
    DrawControl(painter);
}
void InputMasterWork::DrawControl(QPainter *qp)
{
    for (int i = 0; i < maxline; i++)
    {
        QPen pen(Qt::white, 1, Qt::SolidLine);
        qp->setPen(pen);
        QFont font(":/Images/MS Gothic.ttf", 22, QFont::Normal);
        font.setPixelSize(28);
        qp->setFont(font);

        GetImageLineNo(i+1);

        int x = x_begin;
        int y = y_begin;
        if (i<6)
        {
            y = y_begin + 74*i;
        }
        else
        {
            x = x_begin + 236;
            y = y_begin + 74*(i-6);
        }
        qp->drawPixmap(x, y, pixmapLineNo);
        qp->drawText(QRect(x + 190, y + 7, 20, 74), Qt::AlignRight, arrayUnit[i]);
        qp->drawText(QRect(x + 55, y + 7, 130, 74), Qt::AlignRight, arrayValue[i]);
    }
}
void InputMasterWork::GetImageLineNo(int line)
{
    if (isValid)
    {
        pixmapLineNo = arrayPixmapLineNo[line-1];
    }
    else
    {
        pixmapLineNo = arrayPixmapLineNo_out[line-1];
    }
}
void InputMasterWork::CheckIsValid(int line)
{
    isValid[line - 1] = true;
}
void InputMasterWork::getValue(QString txtInput)
{
    if (!isForLine)
    {
        for (int i = 0; i < maxline; i++)
        {
            arrayValue[i] = txtInput;
        }
    }
    else
    {
        arrayValue[currentLine - 1] = txtInput;
    }
    updateDraw();
}
void InputMasterWork::getIsForLine(bool _isForLine)
{
    isForLine = _isForLine;
}
int InputMasterWork::getCurrentLine(int line)
{
    if (isForLine)
    {
         currentLine = line;
    }
   return currentLine;
}
QList<QString> InputMasterWork::sendValueToDynamic()
{
    QList<QString> listValue;
    for (int i = 0; i < maxline; i++)
    {
            listValue.append(arrayValue[i]);
    }
    return listValue;
}
void InputMasterWork::getListValue(QList<QString> list)
{
    for (int i = 0; i < list.count(); i++)
    {
       arrayValue[i] = list[i];
    }
    this->update();
}
void InputMasterWork::LoadImages()
{
    bool bRes = false;

    bRes = arrayPixmapLineNo[0].load(":/Images/Number_w48h48_01.png");
    bRes = arrayPixmapLineNo[1].load(":/Images/Number_w48h48_02.png");
    bRes = arrayPixmapLineNo[2].load(":/Images/Number_w48h48_03.png");
    bRes = arrayPixmapLineNo[3].load(":/Images/Number_w48h48_04.png");
    bRes = arrayPixmapLineNo[4].load(":/Images/Number_w48h48_05.png");
    bRes = arrayPixmapLineNo[5].load(":/Images/Number_w48h48_06.png");
    bRes = arrayPixmapLineNo[6].load(":/Images/Number_w48h48_07.png");
    bRes = arrayPixmapLineNo[7].load(":/Images/Number_w48h48_08.png");
    bRes = arrayPixmapLineNo[8].load(":/Images/Number_w48h48_09.png");
    bRes = arrayPixmapLineNo[9].load(":/Images/Number_w48h48_10.png");
    bRes = arrayPixmapLineNo[10].load(":/Images/Number_w48h48_11.png");
    bRes = arrayPixmapLineNo[11].load(":/Images/Number_w48h48_12.png");

    bRes = arrayPixmapLineNo_out[0].load(":/Images/Number_w48h48_01_out.png");
    bRes = arrayPixmapLineNo_out[1].load(":/Images/Number_w48h48_02_out.png");
    bRes = arrayPixmapLineNo_out[2].load(":/Images/Number_w48h48_03_out.png");
    bRes = arrayPixmapLineNo_out[3].load(":/Images/Number_w48h48_04_out.png");
    bRes = arrayPixmapLineNo_out[4].load(":/Images/Number_w48h48_05_out.png");
    bRes = arrayPixmapLineNo_out[5].load(":/Images/Number_w48h48_06_out.png");
    bRes = arrayPixmapLineNo_out[6].load(":/Images/Number_w48h48_07_out.png");
    bRes = arrayPixmapLineNo_out[7].load(":/Images/Number_w48h48_08_out.png");
    bRes = arrayPixmapLineNo_out[8].load(":/Images/Number_w48h48_09_out.png");
    bRes = arrayPixmapLineNo_out[9].load(":/Images/Number_w48h48_10_out.png");
    bRes = arrayPixmapLineNo_out[10].load(":/Images/Number_w48h48_11_out.png");
    bRes = arrayPixmapLineNo_out[11].load(":/Images/Number_w48h48_12_out.png");
}
void InputMasterWork::updateDraw()
{
        this->update();
}

