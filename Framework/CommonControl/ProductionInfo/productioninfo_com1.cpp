#include "productioninfo_com1.h"

ProductionInfo_com1::ProductionInfo_com1()
{

}

QString ProductionInfo_com1::txtProductTitle()
{
    return m_ProductTitle;
}

void ProductionInfo_com1::setTxtProductTitle(QString &value)
{
    m_ProductTitle = value;
}

QString ProductionInfo_com1::txtLotNoTitle()
{
    return m_LotNoTitle;
}

void ProductionInfo_com1::setTxtLotNoTitle(QString &value)
{
    m_LotNoTitle = value;
}

QString ProductionInfo_com1::txtProductNo()
{
    return m_ProductNo;
}

void ProductionInfo_com1::setTxtProductNo(QString &value)
{
    m_ProductNo = value;
}

QString ProductionInfo_com1::txtProductName()
{
    return m_ProductName;
}

void ProductionInfo_com1::setTxtProductName(QString &value)
{
    m_ProductName = value;
}

QString ProductionInfo_com1::txtLotNoValue()
{
    return m_LotNoValue;
}

void ProductionInfo_com1::setTxtLotNoValue(QString &value)
{
    m_LotNoValue = value;
}

void ProductionInfo_com1::paint(QPainter *painter)
{
    QPoint point(3, 3);
    QSize size(this->width() - (2 * point.x()), this->height() - (2 * point.y()));
    int marginTop = 5;
    int heightPath2 = 45;
    int heightPath1 = size.height() - heightPath2 - marginTop;
    QPen pen;
    pen.setColor(QColor(132, 131, 133));
    painter->setPen(pen);
    painter->drawRoundedRect(QRect(point.x(), point.y(), size.width(), heightPath1), 5, 5);
    painter->drawRoundedRect(QRect(point.x(), point.y() + heightPath1 + marginTop, size.width(), heightPath2), 5, 5);
    painter->setOpacity(1);
    pen.setColor(Qt::white);
    pen.setWidth(1);
    pen.setStyle(Qt::SolidLine);
    painter->setPen(pen);
    QFont font;
    font.setFamily(":/Images/MS Gothic.ttf");
    font.setPixelSize(23);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);
    painter->setFont(font);

    // draw text
    QFontMetrics fm(font);
    int heightFont = fm.height();
    painter->drawText(point.x() + 5, point.y() + 5, size.width(), heightPath1, Qt::AlignLeft, m_ProductTitle);
    painter->drawText(point.x() + 5, point.y() + heightPath1 - heightFont - 5, size.width(), heightPath1, Qt::AlignLeft, m_ProductName);
    painter->drawText(point.x() + 5, point.y() + heightPath1 + marginTop + (heightPath2 / 2) - (heightFont / 2), size.width(), heightPath2, Qt::AlignLeft, m_LotNoTitle);
    painter->drawText(point.x(), point.y() + heightPath1 + marginTop + (heightPath2 / 2) - (heightFont / 2), size.width() - 10, heightPath2, Qt::AlignRight, m_LotNoValue);

    font.setPixelSize(40);
    painter->setFont(font);
    pen.setColor(QColor(255, 217, 187));
    painter->setPen(pen);

    painter->drawText(point.x(), point.y() + 15, size.width() - 50, heightPath1, Qt::AlignRight, m_ProductNo);
}
