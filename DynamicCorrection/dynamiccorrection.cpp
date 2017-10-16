#include "dynamiccorrection.h"
#include <QPainter>
#include <QDebug>
#include <QDateTime>
#include <QString>
#include <QtMath>

DynamicCorrection::DynamicCorrection(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    LoadImages();
    titleStr1 = "Performing Fine Adjustment.";
    titleStr2 = "Press [Start] to feed the Product.";
    prodMod = true;
    isValid = true;
    maxLine = 12;
    leftTableHeight = 480;

    orangePen.setColor(QColor(255,217,187));
    orangePen.setWidth(0.5);
    whitePen.setColor(QColor(255,255,255));
    whitePen.setWidth(0.5);
    grayPen.setColor(QColor(132, 131, 133));
    grayPen.setWidth(0.5);
    bluePen.setColor(QColor(149, 179, 215));
    bluePen.setWidth(0.5);

    for (uint i = 0; i < sizeof(isStatus)/sizeof(isStatus[0]); i++)
    {
        isStatus[i] = (int)(qrand()%4 + 0);
    }
    for (uint i = 0; i < sizeof(sampleCount)/sizeof(sampleCount[0]); i++)
    {
        sampleCount[i] = (int)(qrand()%10 + 1);
    }
}
DynamicCorrection::~DynamicCorrection()
{
}
void DynamicCorrection::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 640, QColor(0, 0, 0));
    DrawTitle(painter);   
    DrawContent(painter);
}
void DynamicCorrection::DrawTitle(QPainter *qp)
{
    QPen pen(Qt::white, 1, Qt::SolidLine);
    qp->setPen(pen);
    QFont font(":/Images/MS Gothic.ttf", 26, QFont::Normal);
    font.setPixelSize(35);
    qp->setFont(font);

    qp->drawText(10, 40, titleStr1);
    qp->drawText(10, 80, titleStr2);
}
void DynamicCorrection::DrawContent(QPainter *qp)
{
    int maxHeight = leftTableHeight/maxLine;
    int _sampleCount;

    if (isStatus[currentLine - 1] == status::Wait)
    {
        _sampleCount = 0;
    }
    else
    {
        _sampleCount = sampleCount[currentLine - 1];
    }

    for (int i = 0; i < maxLine; i++)
    {
        QPoint posBegin(20, 135);
        int line = i + 1;
        posBegin.setY(posBegin.y() + maxHeight*i);
        DrawOneRow(line, posBegin, qp , maxHeight);
    }

    QFont font(":/Images/MS Gothic.ttf", 16, QFont::Normal);
    font.setPixelSize(20);
    qp->setFont(font);

    qp->setPen(grayPen);
    qp->drawLine(650, 187, 950, 187);
    qp->drawLine(650, 277, 950, 277);
    if (_sampleCount < sampleMax)
    {
        qp->setPen(bluePen);
        qp->drawText(QRect(650,252,295,40),Qt::AlignRight, "--");
    }
    else
    {
        QString dynCoeffic = QString::number(getCoeffic(currentLine));
        qp->setPen(bluePen);
        qp->drawText(QRect(650,252,295,40),Qt::AlignRight, dynCoeffic);
    }

    qp->setPen(whitePen);
    qp->drawText(QRect(650,188,295,40),Qt::AlignLeft, "Dynamic adjust coeffic.");
    qp->drawText(QRect(650,275,310,40),Qt::AlignCenter, "Meas.");
    qp->drawText(QRect(650,275,400,40),Qt::AlignCenter, "g");

    int x1No = 660;
    int x2No = 830;
    int x1Value = 700;
    int y1Value = 330;
    int x2Value = 870;
    int y2Value = 330;
    int step = 40;
    int widthValue = 108;
    int heightValue = 34;

    for (int i = 1; i <= sampleMax; i++)
    {
        QString strValue = "";
        if(i <= _sampleCount)
        {
            strValue = QString::number(getWeightBuff(i));
        }
        if (i < 6)
        {
            qp->setPen(whitePen);
            qp->drawText(x1No, y1Value + font.pixelSize() + 5, QString::number(i));

            qp->setPen(grayPen);
            qp->drawRoundedRect(QRect(x1Value, y1Value - 5, widthValue, heightValue), 2, 2);

            qp->setPen(orangePen);
            qp->drawText(QRect(x1Value, y1Value, widthValue - 5, heightValue), Qt::AlignRight, strValue);

            y1Value += step;
        }
        else
        {
            qp->setPen(whitePen);
            qp->drawText(x2No, y2Value + font.pixelSize() + 5, QString::number(i));

            qp->setPen(grayPen);
            qp->drawRoundedRect(QRect(x2Value, y2Value - 5, widthValue, heightValue), 2, 2);

            qp->setPen(orangePen);
            qp->drawText(QRect(x2Value, y2Value, widthValue - 5, heightValue), Qt::AlignRight, strValue);

            y2Value += step;
        }
    }
}
void DynamicCorrection::DrawOneRow(int line, QPoint pos, QPainter *qp, int _maxHeight)
{
    QString strProdType;
    QString strMasterWeight;
    QString strMeasWeight;
    QString strTotalCount;
    QString strSampleCount;
    int y = 0;

    QFont font(":/Images/MS Gothic.ttf", 16, QFont::Normal);
    font.setPixelSize(20);
    qp->setFont(font);

    //Draw Line No
    GetImageLineNo(line);
    y = (_maxHeight - pixmapLineNo.height())/2;
    qp->drawPixmap(pos.x() + 55, pos.y() + y, pixmapLineNo);

    //Draw ProdNo
    if (!prodMod)
    {

        strProdType = "";
    }
    else
    {
        strProdType = "050";
    }
    y = (_maxHeight + font.pixelSize())/2;
    qp->setPen(orangePen);
    qp->drawText(QRect(pos.x(), pos.y() + y/2, 36, _maxHeight),Qt::AlignRight , strProdType);

    //Draw Line
    qp->setPen(grayPen);
    qp->drawLine(pos.x() + 50, pos.y() + _maxHeight - 1, pos.x() + 608, pos.y() + _maxHeight - 1);

    //Draw Master value
    strMasterWeight = listValue[line - 1];
    qp->setPen(whitePen);
    qp->drawText(QRect(110, pos.y() + y/2, 125, _maxHeight),Qt::AlignRight , strMasterWeight);

    if(!isValid)
    {
        strMeasWeight = "--";
        qp->setPen(orangePen);
        qp->drawText(QRect(290, pos.y() + y/2, 80, _maxHeight),Qt::AlignRight , strMeasWeight);

        strTotalCount = "--/--";
        qp->setPen(whitePen);
        qp->drawText(QRect(400, pos.y() + y/2, 218, _maxHeight),Qt::AlignRight , strTotalCount);
    }
    else
    {
        strMeasWeight = QString::number(getCurrentWeight(line));
        qp->setPen(orangePen);
        qp->drawText(QRect(290, pos.y() + y/2, 80, _maxHeight),Qt::AlignRight , strMeasWeight);

        if(isStatus[line - 1] == status::NotEnd)
        {
            if (sampleCount[line - 1] != 0)
            {
                strSampleCount = QString::number(sampleCount[line - 1]);
                qp->setPen(orangePen);
                qp->drawText(QRect(400, pos.y() + y/2, 188, _maxHeight),Qt::AlignRight , strSampleCount);

                strTotalCount = "/" + QString::number(sampleMax);
                qp->setPen(whitePen);
                qp->drawText(QRect(400, pos.y() + y/2, 218, _maxHeight),Qt::AlignRight , strTotalCount);
            }
        }
        else
        {
            switch (isStatus[line - 1]) {
            case status::Wait:
                strTotalCount = "Wait...";
                break;
            case status::End:
                strTotalCount = "Completed";
                break;
            case status::ErrorFinish:
                strTotalCount = "Err. completed";
                break;
            case status::Initialize:
                strTotalCount = "";
                break;
            }
            qp->setPen(whitePen);
            qp->drawText(QRect(400, pos.y() + y/2, 218, _maxHeight),Qt::AlignRight , strTotalCount);
        }
    }
}
int DynamicCorrection::onClickScreen(float x, float y)
{
    float _maxheight = leftTableHeight/maxLine;
    float _y = (_maxheight - pixmapLineNo.height())/2;
    for (int i = 0; i < maxLine; i++)
    {
        if(x > 75 && x < 75 + pixmapLineNo.width() && y > 135 + _y + _maxheight*i && y < 135 + _y + _maxheight*i + pixmapLineNo.height())
        {
            currentLine = i + 1;
            updateDraw();
            return currentLine;
        }
    }
    return currentLine;
 }
void DynamicCorrection::getCurrentLine(int _currentLine)
{
    currentLine = _currentLine;
    updateDraw();
}
int DynamicCorrection::getWeightBuff(int line)
{
    return (int)(qrand()%100 + 1);
}
int DynamicCorrection::getCurrentWeight(int line)
{
    if (isStatus[line - 1] == status::Wait ||isStatus[line - 1] == status::Initialize) {
        return 0;
    } else
    {
        return (int)(qrand()%100 + 1);
    }
}
float DynamicCorrection::getCoeffic(int line)
{
    return (int)(qrand()%10 + 1);
}
bool DynamicCorrection::enablebtnBack()
{
    for (uint i = 0; i < sizeof(sampleCount)/sizeof(sampleCount[0]); i++)
    {
        if (sampleCount[i] != 0)
        {
            return false;
        }
    }
    return true;
}
bool DynamicCorrection::enablebtnFinish()
{
    int isStatus = 1;
    if (isStatus == status::End)
    {
        return true;
    }
    else
    {
        return false;
    }
}
bool DynamicCorrection::enablebtnRedo(int _currentLine)
{
    int _status = isStatus[_currentLine - 1];
    if (_status == status::ErrorFinish)
    {
        return true;
    }
    else
    {
        return false;
    }
}
void DynamicCorrection::getValue(QList<QString> list)
{
    for (int i = 0; i < list.count(); i++)
    {
       listValue[i] = list[i];
    }
}
void DynamicCorrection::clearData(int _currentLine)
{
    isStatus[_currentLine - 1] = status::Initialize;
    sampleCount[_currentLine - 1] = 0;
    updateDraw();
}
bool DynamicCorrection::changeProdMode()
{
    return prodMod;
}
void DynamicCorrection::LoadImages()
{
    bool bRes = false;

    bRes = arrayPixmapLineNo[0].load(":/Images/Number_w21h27_01.png");
    bRes = arrayPixmapLineNo[1].load(":/Images/Number_w21h27_02.png");
    bRes = arrayPixmapLineNo[2].load(":/Images/Number_w21h27_03.png");
    bRes = arrayPixmapLineNo[3].load(":/Images/Number_w21h27_04.png");
    bRes = arrayPixmapLineNo[4].load(":/Images/Number_w21h27_05.png");
    bRes = arrayPixmapLineNo[5].load(":/Images/Number_w21h27_06.png");
    bRes = arrayPixmapLineNo[6].load(":/Images/Number_w21h27_07.png");
    bRes = arrayPixmapLineNo[7].load(":/Images/Number_w21h27_08.png");
    bRes = arrayPixmapLineNo[8].load(":/Images/Number_w21h27_09.png");
    bRes = arrayPixmapLineNo[9].load(":/Images/Number_w21h27_10.png");
    bRes = arrayPixmapLineNo[10].load(":/Images/Number_w21h27_11.png");
    bRes = arrayPixmapLineNo[11].load(":/Images/Number_w21h27_12.png");

    bRes = arrayPixmapLineNo_out[0].load(":/Images/Number_w21h27_01_out.png");
    bRes = arrayPixmapLineNo_out[1].load(":/Images/Number_w21h27_02_out.png");
    bRes = arrayPixmapLineNo_out[2].load(":/Images/Number_w21h27_03_out.png");
    bRes = arrayPixmapLineNo_out[3].load(":/Images/Number_w21h27_04_out.png");
    bRes = arrayPixmapLineNo_out[4].load(":/Images/Number_w21h27_05_out.png");
    bRes = arrayPixmapLineNo_out[5].load(":/Images/Number_w21h27_06_out.png");
    bRes = arrayPixmapLineNo_out[6].load(":/Images/Number_w21h27_07_out.png");
    bRes = arrayPixmapLineNo_out[7].load(":/Images/Number_w21h27_08_out.png");
    bRes = arrayPixmapLineNo_out[8].load(":/Images/Number_w21h27_09_out.png");
    bRes = arrayPixmapLineNo_out[9].load(":/Images/Number_w21h27_10_out.png");
    bRes = arrayPixmapLineNo_out[10].load(":/Images/Number_w21h27_11_out.png");
    bRes = arrayPixmapLineNo_out[11].load(":/Images/Number_w21h27_12_out.png");

    bRes = arrayPixmapLineNo_on[0].load(":/Images/Number_w21h27_01_On.png");
    bRes = arrayPixmapLineNo_on[1].load(":/Images/Number_w21h27_02_On.png");
    bRes = arrayPixmapLineNo_on[2].load(":/Images/Number_w21h27_03_On.png");
    bRes = arrayPixmapLineNo_on[3].load(":/Images/Number_w21h27_04_On.png");
    bRes = arrayPixmapLineNo_on[4].load(":/Images/Number_w21h27_05_On.png");
    bRes = arrayPixmapLineNo_on[5].load(":/Images/Number_w21h27_06_On.png");
    bRes = arrayPixmapLineNo_on[6].load(":/Images/Number_w21h27_07_On.png");
    bRes = arrayPixmapLineNo_on[7].load(":/Images/Number_w21h27_08_On.png");
    bRes = arrayPixmapLineNo_on[8].load(":/Images/Number_w21h27_09_On.png");
    bRes = arrayPixmapLineNo_on[9].load(":/Images/Number_w21h27_10_On.png");
    bRes = arrayPixmapLineNo_on[10].load(":/Images/Number_w21h27_11_On.png");
    bRes = arrayPixmapLineNo_on[11].load(":/Images/Number_w21h27_12_On.png");
}

void DynamicCorrection::GetImageLineNo(int line)
{
    if (!isValid)
    {
        pixmapLineNo = arrayPixmapLineNo_out[line-1];
    }
    else if (line == currentLine)
    {
        pixmapLineNo = arrayPixmapLineNo_on[line - 1];
    }
    else
    {
        pixmapLineNo = arrayPixmapLineNo[line-1];
    }
}
void DynamicCorrection::updateDraw()
{
    this->update();
}
