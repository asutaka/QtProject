#include "drawcontrolbase_ver7.h"
#include <QDateTime>
#include <QDebug>

DrawControlBase_ver7::DrawControlBase_ver7(QQuickItem *parent)
    : QQuickItem(parent)
{
    _isForLine = false;
    _isR = true;
    _isPass = false;
    _currentLine = 1;
}

DrawControlBase_ver7::~DrawControlBase_ver7()
{
}

void DrawControlBase_ver7::DrawCom1(QPainter *painter)
{
    QPoint point(10, 10);
    QSize size(315, 80);
    painter->setOpacity(0.1);
    QPainterPath path;
    QBrush greyBrush(QColor(255,255,255));
    path.addRoundRect(QRect(point.x(), point.y(), size.width(), size.height()), 5, 5);
    painter->fillPath(path,greyBrush);
    path.addRoundRect(QRect(point.x(), point.y() + 85, size.width(), size.height() - 35), 5, 5);
    painter->fillPath(path,greyBrush);
    _pen.setColor(QColor(138,41,8));
    painter->setPen(_pen);
    painter->drawRoundedRect(QRect(point.x(), point.y(), size.width(), size.height()), 5, 5);
    painter->drawRoundedRect(QRect(point.x(), point.y() + 85, size.width(), size.height() - 35), 5, 5);
    painter->setOpacity(1);
    _pen.setColor(Qt::white);
    _pen.setWidth(1);
    _pen.setStyle(Qt::SolidLine);
    painter->setPen(_pen);
    _font.setFamily(":/Images/MS Gothic.ttf");
    _font.setPixelSize(23);
    _font.setBold(false);
    _font.setUnderline(false);
    _font.setItalic(false);
    painter->setFont(_font);

#ifdef STUP_DISPLAY_DATA
    QString titleProd = "Prod";
    QString valueProd = "001";
    QString nameProd = "Sample";
    QString nameLotNo = "LotNo name.";
    QString valueLotNo = "Anritsu";
#endif
    // draw text
    painter->drawText(point.x() + 5, point.y() + 5, size.width(), size.height(), Qt::AlignLeft, titleProd);
    painter->drawText(point.x() + 5, point.y() + 90, size.width(), size.height(), Qt::AlignLeft, nameLotNo);
    painter->drawText(point.x(), point.y() + 90, size.width() - 10, size.height(), Qt::AlignRight, valueLotNo);

    _font.setPixelSize(40);
    painter->setFont(_font);
    _pen.setColor(QColor(255,217,187));
    painter->setPen(_pen);

    painter->drawText(point.x(), point.y() + 15, size.width() - 50, size.height(), Qt::AlignRight, valueProd);

    _font.setPixelSize(23);
    painter->setFont(_font);

    painter->drawText(point.x() + 5, point.y() + 45, size.width(), size.height(), Qt::AlignLeft, nameProd);
}

void DrawControlBase_ver7::DrawCom2(QPainter *painter)
{
    QPoint point(330, 10);
    QSize size(225, 130);
    painter->setOpacity(0.1);
    QPainterPath path;
    QBrush greyBrush(QColor(255,255,255));
    path.addRoundRect(QRect(point.x(), point.y(), size.width(), size.height()), 5, 5);
    painter->fillPath(path,greyBrush);
    _pen.setColor(QColor(132,131,133));
    painter->setPen(_pen);
    painter->drawRoundedRect(QRect(point.x(), point.y(), size.width(), size.height()), 5, 5);
    painter->setOpacity(1);

    _pen.setColor(Qt::white);
    _pen.setWidth(1);
    _pen.setStyle(Qt::SolidLine);
    painter->setPen(_pen);
    _font.setPixelSize(23);
    _font.setBold(false);
    _font.setUnderline(false);
    _font.setItalic(false);
    painter->setFont(_font);

#ifdef STUP_DISPLAY_DATA
    QString titleRef = "基準値";
    QString titleLowLmt = "下限値";
    QString titleUpLmt = "上限値";
    QString titleNo = "号数";
    QString uintRef = "g";
    QString uintLowLmt = "g";
    QString uintUpLmt = "g";
    QString uintNo = "号";
    QString valueRef = "12.0";
    QString valueLowLmt = "-5.0";
    QString valueUpLmt = "5.0";
    QString valueNo = "000";
#endif
    // draw text
    int margin = 5;
    painter->drawText(point.x() + margin, point.y() + 5, size.width(), size.height(), Qt::AlignLeft, titleRef);
    painter->drawText(point.x() + margin, point.y() + 35, size.width(), size.height(), Qt::AlignLeft, titleLowLmt);
    painter->drawText(point.x() + margin, point.y() + 65, size.width(), size.height(), Qt::AlignLeft, titleUpLmt);
    painter->drawText(point.x() + margin, point.y() + 95, size.width(), size.height(), Qt::AlignLeft, titleNo);

    painter->drawText(point.x(), point.y() + 5, size.width() - margin, size.height(), Qt::AlignRight, uintRef);
    painter->drawText(point.x(), point.y() + 35, size.width() - margin, size.height(), Qt::AlignRight, uintLowLmt);
    painter->drawText(point.x(), point.y() + 65, size.width() - margin, size.height(), Qt::AlignRight, uintUpLmt);
    painter->drawText(point.x(), point.y() + 95, size.width() - margin, size.height(), Qt::AlignRight, uintNo);

    _pen.setColor(QColor(255,217,187));
    painter->setPen(_pen);
    margin = 35;
    painter->drawText(point.x(), point.y() + 5, size.width() - margin, size.height(), Qt::AlignRight, valueRef);
    painter->drawText(point.x(), point.y() + 35, size.width() - margin, size.height(), Qt::AlignRight, valueLowLmt);
    painter->drawText(point.x(), point.y() + 65, size.width() - margin, size.height(), Qt::AlignRight, valueUpLmt);
    painter->drawText(point.x(), point.y() + 95, size.width() - margin, size.height(), Qt::AlignRight, valueNo);
}

void DrawControlBase_ver7::DrawCom3(QPainter *painter)
{
    QPoint point(560, 10);
    QSize size(160, 130);
    painter->setOpacity(0.1);
    QPainterPath path;
    QBrush greyBrush(QColor(255,255,255));
    path.addRoundRect(QRect(point.x(), point.y(), size.width(), size.height()), 5, 5);
    painter->fillPath(path,greyBrush);
    _pen.setColor(QColor(132,131,133));
    painter->setPen(_pen);
    painter->drawRoundedRect(QRect(point.x(), point.y(), size.width(), size.height()), 5, 5);
    painter->setOpacity(1);

    _font.setPixelSize(23);
    _font.setBold(false);
    _font.setUnderline(false);
    _font.setItalic(false);
    painter->setFont(_font);
    _pen.setColor(Qt::white);
    _pen.setWidth(1);
    _pen.setStyle(Qt::SolidLine);
    painter->setPen(_pen);

#ifdef STUP_DISPLAY_DATA
    QString titleTotal = "総数";
    QString titleOK = "OK";
    QString titleNG = "NG";
    int valueOK = rand() % 1000;
    int valueNG = rand() % 1000;
    int valueTotal = valueOK + valueNG;
#endif
    // draw text com3
    int margin = 5;
    painter->drawText(point.x() + margin, point.y() + 5, size.width(), size.height(), Qt::AlignLeft, titleTotal);
    painter->drawText(point.x() + margin, point.y() + 35, size.width(), size.height(), Qt::AlignLeft, titleOK);
    painter->drawText(point.x() + margin, point.y() + 65, size.width(), size.height(), Qt::AlignLeft, titleNG);

    _pen.setColor(QColor(255,217,187));
    painter->setPen(_pen);

    painter->drawText(point.x(), point.y() + 5, size.width() - margin, size.height(), Qt::AlignRight, QString::number(valueTotal));
    painter->drawText(point.x(), point.y() + 35, size.width() - margin, size.height(), Qt::AlignRight, QString::number(valueOK));
    painter->drawText(point.x(), point.y() + 65, size.width() - margin, size.height(), Qt::AlignRight, QString::number(valueNG));
}

void DrawControlBase_ver7::setNumSelect(int lineNo,int numSelect)
{
    _lineNo = lineNo;
    _numSelect = numSelect;
}

void DrawControlBase_ver7::getIsLeft(bool isLeft, int btnID, int screenID)
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
}

void DrawControlBase_ver7::getCurrentLine(int currentLine)
{
    _currentLine = currentLine;
}
