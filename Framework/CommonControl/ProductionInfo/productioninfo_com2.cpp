#include "productioninfo_com2.h"

ProductionInfo_com2::ProductionInfo_com2()
{

}

QString ProductionInfo_com2::txtRefTitle()
{
    return m_RefTitle;
}

void ProductionInfo_com2::setTxtRefTitle(QString &value)
{
    m_RefTitle = value;
}

QString ProductionInfo_com2::txtLowLmtTitle()
{
    return m_LowLmtTitle;
}

void ProductionInfo_com2::setTxtLowLmtTitle(QString &value)
{
    m_LowLmtTitle = value;
}

QString ProductionInfo_com2::txtUpLmtTitle()
{
    return m_UpLmtTitle;
}

void ProductionInfo_com2::setTxtUpLmtTitle(QString &value)
{
    m_UpLmtTitle = value;
}

QString ProductionInfo_com2::txtNoTitle()
{
    return m_NoTitle;
}

void ProductionInfo_com2::setTxtNoTitle(QString &value)
{
    m_NoTitle = value;
}

QString ProductionInfo_com2::txtRefUnit()
{
    return m_RefUnit;
}

void ProductionInfo_com2::setTxtRefUnit(QString &value)
{
    m_RefUnit = value;
}

QString ProductionInfo_com2::txtLowLmtUnit()
{
    return m_LowLmtUnit;
}

void ProductionInfo_com2::setTxtLowLmtUnit(QString &value)
{
    m_LowLmtUnit = value;
}

QString ProductionInfo_com2::txtUpLmtUnit()
{
    return m_UpLmtUnit;
}

void ProductionInfo_com2::setTxtUpLmtUnit(QString &value)
{
    m_UpLmtUnit = value;
}

QString ProductionInfo_com2::txtNoUnit()
{
    return m_NoUnit;
}

void ProductionInfo_com2::setTxtNoUnit(QString &value)
{
    m_NoUnit = value;
}

QString ProductionInfo_com2::txtRefValue()
{
    return m_RefValue;
}

void ProductionInfo_com2::setTxtRefValue(QString &value)
{
    m_RefValue = value;
}

QString ProductionInfo_com2::txtLowLmtValue()
{
    return m_LowLmtValue;
}

void ProductionInfo_com2::setTxtLowLmtValue(QString &value)
{
    m_LowLmtValue = value;
}

QString ProductionInfo_com2::txtUpLmtValue()
{
    return m_UpLmtValue;
}

void ProductionInfo_com2::setTxtUpLmtValue(QString &value)
{
    m_UpLmtValue = value;
}

QString ProductionInfo_com2::txtNoValue()
{
    return m_NoValue;
}

void ProductionInfo_com2::setTxtNoValue(QString &value)
{
    m_NoValue = value;
}

void ProductionInfo_com2::paint(QPainter *painter)
{
    QPoint point(3, 3);
    QSize size(this->width() - (2 * point.x()), this->height() - (2 * point.y()));
    QPen pen;
    pen.setColor(QColor(132, 131, 133));
    painter->setPen(pen);
    painter->drawRoundedRect(QRect(point.x(), point.y(), size.width(), size.height()), 5, 5);
    painter->setOpacity(1);

    pen.setColor(Qt::white);
    pen.setWidth(1);
    pen.setStyle(Qt::SolidLine);
    painter->setPen(pen);
    QFont font;
    font.setPixelSize(23);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);
    painter->setFont(font);

    // draw text
    int margin = 5;
    painter->drawText(point.x() + margin, point.y() + 5, size.width(), size.height(), Qt::AlignLeft, m_RefTitle);
    painter->drawText(point.x() + margin, point.y() + 35, size.width(), size.height(), Qt::AlignLeft, m_LowLmtTitle);
    painter->drawText(point.x() + margin, point.y() + 65, size.width(), size.height(), Qt::AlignLeft, m_UpLmtTitle);
    painter->drawText(point.x() + margin, point.y() + 95, size.width(), size.height(), Qt::AlignLeft, m_NoTitle);

    painter->drawText(point.x(), point.y() + 5, size.width() - margin, size.height(), Qt::AlignRight, m_RefUnit);
    painter->drawText(point.x(), point.y() + 35, size.width() - margin, size.height(), Qt::AlignRight, m_LowLmtUnit);
    painter->drawText(point.x(), point.y() + 65, size.width() - margin, size.height(), Qt::AlignRight, m_UpLmtUnit);
    painter->drawText(point.x(), point.y() + 95, size.width() - margin, size.height(), Qt::AlignRight, m_NoUnit);

    pen.setColor(QColor(255, 217, 187));
    painter->setPen(pen);
    margin = 35;
    painter->drawText(point.x(), point.y() + 5, size.width() - margin, size.height(), Qt::AlignRight, m_RefValue);
    painter->drawText(point.x(), point.y() + 35, size.width() - margin, size.height(), Qt::AlignRight, m_LowLmtValue);
    painter->drawText(point.x(), point.y() + 65, size.width() - margin, size.height(), Qt::AlignRight, m_UpLmtValue);
    painter->drawText(point.x(), point.y() + 95, size.width() - margin, size.height(), Qt::AlignRight, m_NoValue);
}
