#include "drawcontrolbase_ver6.h"
#include <QDateTime>

DrawControlBase_ver6::DrawControlBase_ver6(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    _isForLine = false;
    _isR = true;
    _isPass = false;
    _currentLine = 1;

    _timerDrawing = new QTimer(this);
    connect(_timerDrawing, SIGNAL(timeout()), this, SLOT(updateDraw()));
    _timerDrawing->start(100);
}

DrawControlBase_ver6::~DrawControlBase_ver6()
{
    delete _timerDrawing;
    _timerDrawing = NULL;
}

void DrawControlBase_ver6::paint(QPainter *painter)
{
    painter->fillRect(0, 0, _WIDTH_SCREEN, _HEIGHT_SCREEN, QColor(0, 0, 0));
    DrawCom1(painter);
    DrawCom2(painter);
    DrawCom3(painter);
}

void DrawControlBase_ver6::updateDraw()
{
    this->update();
}

void DrawControlBase_ver6::DrawCom1(QPainter *qp)
{
    _pen.setColor(Qt::white);
    _pen.setWidth(1);
    _pen.setStyle(Qt::SolidLine);
    qp->setPen(_pen);
    _font.setFamily("MS Gothic");
    _font.setPixelSize(40);
    _font.setBold(false);
    _font.setUnderline(false);
    _font.setItalic(false);
    qp->setFont(_font);

    // draw text
#ifdef STUP_DISPLAY_DATA
    QString prod = "品種";
#endif
    qp->drawText(_x_COM + 5, _y_COM + 42, prod);

    _font.setPixelSize(40);
    qp->setFont(_font);
#ifdef STUP_DISPLAY_DATA
    QString prodName = "ああ";
#endif
    qp->drawText(_x_COM + 5, _y_COM + 100, prodName);

    _font.setPixelSize(60);
    qp->setFont(_font);
    _pen.setColor(QColor(255, 217, 187));
    qp->setPen(_pen);
#ifdef STUP_DISPLAY_DATA
    QString prodNo = "001";
#endif
    qp->drawText(_x_COM + 140, _x_COM + 50, prodNo);

    //draw border line com1
    _pen.setColor(QColor(132, 131, 133));
    qp->setPen(_pen);

    qp->drawRoundedRect(QRect(_x_COM, _y_COM, _WIDTH_COM, _HEIGHT_COM), 5, 5);
}

void DrawControlBase_ver6::DrawCom2(QPainter *qp)
{
    _pen.setColor(Qt::white);
    _pen.setWidth(1);
    _pen.setStyle(Qt::SolidLine);
    qp->setPen(_pen);
    _font.setPixelSize(23);
    _font.setBold(false);
    _font.setUnderline(false);
    _font.setItalic(false);
    qp->setFont(_font);

    int xCom2 = _x_COM + _WIDTH_COM + 15;
    // draw text
#ifdef STUP_DISPLAY_DATA
    QString refValName = "基準値";
    QString lowerLimitName = "下限値";
    QString upperLimitName = "上限値";
    QString ptName = "風袋値";
    QString unit = "g";
#endif
    qp->drawText(xCom2 + 10, _y_COM + 5, _WIDTH_COM, _HEIGHT_COM, Qt::AlignLeft, refValName);
    qp->drawText(xCom2 + 10, _y_COM + 35, _WIDTH_COM, _HEIGHT_COM, Qt::AlignLeft, lowerLimitName);
    qp->drawText(xCom2 + 10, _y_COM + 65, _WIDTH_COM, _HEIGHT_COM, Qt::AlignLeft, upperLimitName);
    qp->drawText(xCom2 + 10, _y_COM + 95, _WIDTH_COM, _HEIGHT_COM, Qt::AlignLeft, ptName);

    qp->drawText(xCom2 - 10, _y_COM + 5, _WIDTH_COM, _HEIGHT_COM, Qt::AlignRight, unit);
    qp->drawText(xCom2 - 10, _y_COM + 35, _WIDTH_COM, _HEIGHT_COM, Qt::AlignRight, unit);
    qp->drawText(xCom2 - 10, _y_COM + 65, _WIDTH_COM, _HEIGHT_COM, Qt::AlignRight, unit);
    qp->drawText(xCom2 - 10, _y_COM + 95, _WIDTH_COM, _HEIGHT_COM, Qt::AlignRight, unit);

    _pen.setColor(QColor(255, 217, 187));
    qp->setPen(_pen);
#ifdef STUP_DISPLAY_DATA
    QString refValValue = "95.2";
    QString lowerLimitValue = "-5.0";
    QString upperLimitValue = "+5.0";
    QString ptValue = "0.0";
#endif
    qp->drawText(xCom2 - 25, _y_COM + 5, _WIDTH_COM, _HEIGHT_COM, Qt::AlignRight, refValValue);
    qp->drawText(xCom2 - 25, _y_COM + 35, _WIDTH_COM, _HEIGHT_COM, Qt::AlignRight, lowerLimitValue);
    qp->drawText(xCom2 - 25, _y_COM + 65, _WIDTH_COM, _HEIGHT_COM, Qt::AlignRight, upperLimitValue);
    qp->drawText(xCom2 - 25, _y_COM + 95, _WIDTH_COM, _HEIGHT_COM, Qt::AlignRight, ptValue);

    //draw border line com2
    _pen.setColor(QColor(132, 131, 133));
    qp->setPen(_pen);

    qp->drawRoundedRect(QRect(xCom2, _y_COM, _WIDTH_COM, _HEIGHT_COM), 5, 5);
}

void DrawControlBase_ver6::DrawCom3(QPainter *qp)
{
    _font.setPixelSize(23);
    _font.setBold(false);
    _font.setUnderline(false);
    _font.setItalic(false);
    qp->setFont(_font);
    _pen.setColor(Qt::white);
    _pen.setWidth(1);
    _pen.setStyle(Qt::SolidLine);
    qp->setPen(_pen);

    int xCom3 = _x_COM + _WIDTH_COM * 2 + 30;
#ifdef STUP_DISPLAY_DATA
    QString totalName = "総数";
    QString okName = "OK";
    QString ngName = "NG";
#endif
    qp->drawText(xCom3 + 10, _y_COM + 5, _WIDTH_COM, _HEIGHT_COM, Qt::AlignLeft, totalName);
    qp->drawText(xCom3 + 10, _y_COM + 35, _WIDTH_COM, _HEIGHT_COM, Qt::AlignLeft, okName);
    qp->drawText(xCom3 + 10, _y_COM + 65, _WIDTH_COM, _HEIGHT_COM, Qt::AlignLeft, ngName);

    _pen.setColor(QColor(255,217,187));
    qp->setPen(_pen);
#ifdef STUP_DISPLAY_DATA
    int okValue = rand()% 1000;
    int ngValue = rand()% 1000;
    int totalValue = okValue + ngValue;
#endif

    qp->drawText(xCom3 - 10, _y_COM + 5, _WIDTH_COM, _HEIGHT_COM, Qt::AlignRight, QString::number(totalValue));
    qp->drawText(xCom3 - 10, _y_COM + 35, _WIDTH_COM, _HEIGHT_COM, Qt::AlignRight, QString::number(okValue));
    qp->drawText(xCom3 - 10, _y_COM + 65, _WIDTH_COM, _HEIGHT_COM, Qt::AlignRight, QString::number(ngValue));

    //draw border line com3
    _pen.setColor(QColor(132,131,133));
    qp->setPen(_pen);

    qp->drawRoundedRect(QRect(xCom3, _y_COM, _WIDTH_COM, _HEIGHT_COM), 5, 5);
}

void DrawControlBase_ver6::setNumSelect(int lineNo,int numSelect)
{
    _lineNo = lineNo;
    _numSelect = numSelect;
}

void DrawControlBase_ver6::getIsLeft(bool isLeft, int btnID, int screenID)
{
    if (screenID == 4) {
        switch (btnID) {
        case 0:
           _isForLine = isLeft;
            break;
        case 1:
            _isR = isLeft;
            break;
        case 2:
            _isPass = isLeft;
        default:
            break;
        }
    }
    this->update();
}

void DrawControlBase_ver6::getCurrentLine(int currentLine)
{
    _currentLine = currentLine;
    this->update();
}
