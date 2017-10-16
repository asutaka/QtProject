#include "productionscreencontrol_ver3.h"
#include "productionscreenvm_ver3.h"

ProductionScreenControl_ver3::ProductionScreenControl_ver3()
{

}

QPixmap ProductionScreenControl_ver3::imgMassBarGraphBgk()
{
    return m_MassBarGraphBgk;
}

void ProductionScreenControl_ver3::setImgMassBarGraphBgk(QPixmap &value)
{
    m_MassBarGraphBgk = value;
}

QPixmap ProductionScreenControl_ver3::imgMassBarGraph()
{
    return m_MassBarGraph;
}

void ProductionScreenControl_ver3::setImgMassBarGraph(QPixmap &value)
{
    m_MassBarGraph = value;
}

QPixmap ProductionScreenControl_ver3::imgBarLimit()
{
    return m_BarLimit;
}

void ProductionScreenControl_ver3::setImgBarLimit(QPixmap &value)
{
    m_BarLimit = value;
}

QPixmap ProductionScreenControl_ver3::imgAverage()
{
    return m_Average;
}

void ProductionScreenControl_ver3::setImgAverage(QPixmap &value)
{
    m_Average = value;
}

QPixmap ProductionScreenControl_ver3::imgDetect()
{
    return m_ImgDetect;
}

void ProductionScreenControl_ver3::setImgDetect(QPixmap &value)
{
    m_ImgDetect = value;
}

QPixmap ProductionScreenControl_ver3::imgLineBkg()
{
    return m_LineBkg;
}

void ProductionScreenControl_ver3::setImgLineBkg(QPixmap &value)
{
    m_LineBkg = value;
}

QList<QPixmap> ProductionScreenControl_ver3::imgLineResult()
{
    return m_LineResult;
}

void ProductionScreenControl_ver3::setImgLineResult(QList<QPixmap> &value)
{
    m_LineResult.clear();
    for (int i = 0; i < m_MaxLine; i++)
    {
        m_LineResult.append(value[i]);
    }
}

QList<QPixmap> ProductionScreenControl_ver3::imgProductReason()
{
    return m_ImgProductReason;
}

void ProductionScreenControl_ver3::setImgProductReason(QList<QPixmap> &value)
{
    m_ImgProductReason = value;
}

QString ProductionScreenControl_ver3::txtMeasureUnit()
{
    return m_MeasureUnit;
}

void ProductionScreenControl_ver3::setTxtMeasureUnit(QString &value)
{
    m_MeasureUnit = value;
}

QString ProductionScreenControl_ver3::txtMeasureValue()
{
    return m_MeasureValue;
}

void ProductionScreenControl_ver3::setTxtMeasureValue(QString &value)
{
    m_MeasureValue = value;
}

QString ProductionScreenControl_ver3::txtLineTitle()
{
    return m_LineTitle;
}

void ProductionScreenControl_ver3::setTxtLineTitle(QString &value)
{
    m_LineTitle = value;
}

int ProductionScreenControl_ver3::maxLine()
{
    return m_MaxLine;
}

void ProductionScreenControl_ver3::setMaxLine(int &value)
{
    m_MaxLine = value;
}

int ProductionScreenControl_ver3::prodResult()
{
    return m_ProductResult;
}

void ProductionScreenControl_ver3::setProdResult(int &value)
{
    m_ProductResult = value;
}

int ProductionScreenControl_ver3::widtMassBar()
{
    return m_WidthMassBar;
}

void ProductionScreenControl_ver3::setWidtMassBar(int &value)
{
    m_WidthMassBar = value;
}

int ProductionScreenControl_ver3::widtMassBarResult()
{
    return m_WidthMassBarResult;
}

void ProductionScreenControl_ver3::setWidtMassBarResult(int &value)
{
    m_WidthMassBarResult = value;
}

QPixmap ProductionScreenControl_ver3::imgProductResult()
{
    return m_ImgProductResult;
}

void ProductionScreenControl_ver3::setImgProductResult(QPixmap &value)
{
    m_ImgProductResult = value;
}

QFont ProductionScreenControl_ver3::fontText()
{
    return m_FontText;
}

void ProductionScreenControl_ver3::setFontText(QFont &value)
{
    m_FontText = value;
}

void ProductionScreenControl_ver3::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 640, AppThemeManager::GetInstance()->theme()->colorBackGround());

    QPoint pImgDetect(15, 140);
    QSize sizeImgDetect(474, 474);
    int xImgDetect = qAbs((sizeImgDetect.width() / 2) - (m_ImgDetect.width() / 2));
    int yImgDetect = qAbs((sizeImgDetect.height() / 2) - (m_ImgDetect.height() / 2));
    QRect rectImgDetect(xImgDetect, yImgDetect, sizeImgDetect.width(), sizeImgDetect.height());
    painter->fillRect(pImgDetect.x(), pImgDetect.y(), sizeImgDetect.width(), sizeImgDetect.height(), QColor(255, 255, 255));
    painter->drawPixmap(pImgDetect.x(), pImgDetect.y(), m_ImgDetect.copy(rectImgDetect));

    QPoint pResult(504, 160);
    QSize graphSize(m_WidthMassBar, m_MassBarGraphBgk.height());
    QRect rect((m_MassBarGraphBgk.width() - graphSize.width()) / 2,
               (m_MassBarGraphBgk.height() - graphSize.height()) / 2,
                graphSize.width(), graphSize.height());

    painter->drawPixmap(pResult.x() + 110, pResult.y(), m_ImgProductResult);
    pResult.setY(pResult.y() + 85);
    if (m_ProductResult == ProductionScreenVM_ver3::NG)
    {
        int widthReason = (m_ImgProductReason[0].width() * m_ImgProductReason.count()) + (m_ImgProductReason.count() - 1) * 3;
        int xReason = pResult.x() + 110 + (m_ImgProductResult.width() / 2) - (widthReason / 2);
        for (int i = 0; i < m_ImgProductReason.count(); i++)
        {
            painter->drawPixmap(xReason, pResult.y(), m_ImgProductReason[i]);
            xReason += m_ImgProductReason[0].width() + 3;
        }
    }

    //Draw background MassBarGraph
    pResult.setY(pResult.y() + 75);
    painter->drawPixmap(pResult.x(), pResult.y(), m_MassBarGraphBgk.copy(rect));

    //Draw MassBarGraph
    QRect resultMassBar(rect.x(), rect.y(), m_WidthMassBarResult, rect.height());
    painter->drawPixmap(pResult.x(), pResult.y(), m_MassBarGraph.copy(resultMassBar));

    //Draw BarLimit
    int distance = 100;
    int yBarLimit = pResult.y() - m_BarLimit.height() - 5;
    painter->drawPixmap(pResult.x() + distance, yBarLimit, m_BarLimit);
    painter->drawPixmap(pResult.x() + rect.width() - distance, yBarLimit, m_BarLimit);

    //Draw Average
    pResult.setY(pResult.y() + rect.height());
    painter->drawPixmap(pResult.x() - (m_Average.width() / 2), pResult.y(), m_Average);

    //Draw measure unit
    QPen pen;
    pen = AppThemeManager::GetInstance()->theme()->linePen();
    pen.setWidth(1);
    pen.setStyle(Qt::SolidLine);
    painter->setPen(pen);

    m_FontText.setPixelSize(80);
    m_FontText.setBold(false);
    painter->setFont(m_FontText);

    QSize sBorder(500, 130);
    pen = AppThemeManager::GetInstance()->theme()->borderPen();
    painter->setPen(pen);
    painter->drawRoundedRect(QRect(pResult.x(), pResult.y() + 25, sBorder.width(), sBorder.height()), 5, 5);
    pen = AppThemeManager::GetInstance()->theme()->labelPen();
    painter->setPen(pen);
    painter->drawText(pResult.x() - 100, pResult.y() + 60,
                      sBorder.width() - 10, sBorder.height() + 50,
                      Qt::AlignRight, m_MeasureUnit);

    //Draw measure value
    pen = AppThemeManager::GetInstance()->theme()->valuePen();
    painter->setPen(pen);
    QFontMetrics fm(m_FontText);
    int widthMeasureUint = fm.width(m_MeasureUnit);
    painter->drawText(pResult.x() - 100 - widthMeasureUint - 5, pResult.y() + 60,
                      sBorder.width() - 10, sBorder.height() + 50,
                      Qt::AlignRight, m_MeasureValue);

    pen = AppThemeManager::GetInstance()->theme()->linePen();
    painter->setPen(pen);
    m_FontText.setPixelSize(30);
    painter->setFont(m_FontText);
    pResult.setY(pResult.y() + 30 + sBorder.height());
    sBorder.setHeight(sBorder.height() - 50);
    pen = AppThemeManager::GetInstance()->theme()->linePen();
    painter->setPen(pen);
    painter->drawRoundedRect(QRect(pResult.x(), pResult.y(), sBorder.width(), sBorder.height()), 5, 5);
    pen = AppThemeManager::GetInstance()->theme()->labelPen();
    painter->setPen(pen);
    painter->drawText(pResult.x() + 5, pResult.y() + 5,
                      sBorder.width(), sBorder.height(),
                      Qt::AlignLeft, m_LineTitle);

    //Draw Line Result
    int marginResult = 20;
    int margin = (500 - (m_MaxLine * m_LineBkg.width() + (2 * marginResult))) / 2;
    int x = pResult.x() + margin;
    int y = pResult.y() + sBorder.height() - m_LineBkg.width() - 3;
    for (int i = 0; i < m_MaxLine; i++)
    {
        if (i != 0 && (i % 4) == 0)
        {
            x += marginResult;
        }
        painter->drawPixmap(x, y, m_LineBkg);
        painter->drawPixmap(x, y, m_LineResult[i]);
        x += m_LineBkg.width();
    }
}
