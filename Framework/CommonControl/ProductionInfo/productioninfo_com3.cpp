#include "productioninfo_com3.h"

ProductionInfo_com3::ProductionInfo_com3()
{

}

QString ProductionInfo_com3::txtTotalTitle()
{
    return m_TotalTitle;
}

void ProductionInfo_com3::setTxtTotalTitle(QString &value)
{
    m_TotalTitle = value;
}

QString ProductionInfo_com3::txtOKTitle()
{
    return m_OKTitle;
}

void ProductionInfo_com3::setTxtOKTitle(QString &value)
{
    m_OKTitle = value;
}

QString ProductionInfo_com3::txtNGTitle()
{
    return m_NGTitle;
}

void ProductionInfo_com3::setTxtNGTitle(QString &value)
{
    m_NGTitle = value;
}

QString ProductionInfo_com3::txtTotalValue()
{
    return m_TotalValue;
}

void ProductionInfo_com3::setTxtTotalValue(QString &value)
{
    m_TotalValue = value;
}

QString ProductionInfo_com3::txtOKValue()
{
    return m_OKValue;
}

void ProductionInfo_com3::setTxtOKValue(QString &value)
{
    m_OKValue = value;
}

QString ProductionInfo_com3::txtNGValue()
{
    return m_NGValue;
}

void ProductionInfo_com3::setTxtNGValue(QString &value)
{
    m_NGValue = value;
}

void ProductionInfo_com3::paint(QPainter *painter)
{
    QPoint point(3, 3);
    QSize size(this->width() - (2 * point.x()), this->height() - (2 * point.y()));
    QPen pen;
    pen.setColor(QColor(132, 131, 133));
    painter->setPen(pen);
    painter->drawRoundedRect(QRect(point.x(), point.y(), size.width(), size.height()), 5, 5);
    painter->setOpacity(1);

    QFont font;
    font.setPixelSize(23);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);
    painter->setFont(font);
    pen.setColor(Qt::white);
    pen.setWidth(1);
    pen.setStyle(Qt::SolidLine);
    painter->setPen(pen);

    // draw text com3
    int margin = 5;
    painter->drawText(point.x() + margin, point.y() + 5, size.width(), size.height(), Qt::AlignLeft, m_TotalTitle);
    painter->drawText(point.x() + margin, point.y() + 35, size.width(), size.height(), Qt::AlignLeft, m_OKTitle);
    painter->drawText(point.x() + margin, point.y() + 65, size.width(), size.height(), Qt::AlignLeft, m_NGTitle);

    pen.setColor(QColor(255, 217, 187));
    painter->setPen(pen);

    painter->drawText(point.x(), point.y() + 5, size.width() - margin, size.height(), Qt::AlignRight, m_TotalValue);
    painter->drawText(point.x(), point.y() + 35, size.width() - margin, size.height(), Qt::AlignRight, m_OKValue);
    painter->drawText(point.x(), point.y() + 65, size.width() - margin, size.height(), Qt::AlignRight, m_NGValue);
}
