#include "iomonitorscreencontrol.h"

IOMonitorScreenControl::IOMonitorScreenControl()
{

}

bool IOMonitorScreenControl::isClear()
{
    return m_IsClear;
}

void IOMonitorScreenControl::setIsClear(bool &value)
{
    m_IsClear = value;
}

bool IOMonitorScreenControl::isFetchingData()
{
    return m_IsFetchingData;
}

void IOMonitorScreenControl::setIsFetchingData(bool &value)
{
    m_IsFetchingData = value;
}

bool IOMonitorScreenControl::isStarted()
{
    return m_IsStarted;
}

void IOMonitorScreenControl::setIsStarted(bool &value)
{
    m_IsStarted = value;
}

bool IOMonitorScreenControl::isPredictedSignal()
{
    return m_IsPredictedSignal;
}

void IOMonitorScreenControl::setIsPredictedSignal(bool &value)
{
    m_IsPredictedSignal = value;
}

int IOMonitorScreenControl::signalNumber()
{
    return m_SignalNumber;
}

void IOMonitorScreenControl::setSignalNumber(int &value)
{
    m_SignalNumber = value;
}

int IOMonitorScreenControl::sampCycleValue()
{
    return m_SampCycleValue;
}

void IOMonitorScreenControl::setSampCycleValue(int &value)
{
    m_SampCycleValue = value;
}

int IOMonitorScreenControl::chanelMax()
{
    return m_ChanelMax;
}

void IOMonitorScreenControl::setChanelMax(int &value)
{
    m_ChanelMax = value;
}

int IOMonitorScreenControl::graphInfoValue()
{
    return m_GraphInfoValue;
}

void IOMonitorScreenControl::setGraphInfoValue(int &value)
{
    m_GraphInfoValue = value;
}

QFont IOMonitorScreenControl::fontText()
{
    return m_FontText;
}

void IOMonitorScreenControl::setFontText(QFont &value)
{
    m_FontText = value;
}

QColor IOMonitorScreenControl::colorSignal()
{
    return m_ColorSignal;
}

void IOMonitorScreenControl::setColorSignal(QColor &value)
{
    m_ColorSignal = value;
}

QList<int> IOMonitorScreenControl::signalValueList()
{
    return m_SignalValueList;
}

void IOMonitorScreenControl::setSignalValueList(QList<int> &value)
{
    m_SignalValueList = value;
}

QList<int> IOMonitorScreenControl::pIDValueList()
{
    return m_PIDValueList;
}

void IOMonitorScreenControl::setPIDValueList(QList<int> &value)
{
    m_PIDValueList = value;
}

void IOMonitorScreenControl::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 640, AppThemeManager::GetInstance()->theme()->colorBackGround());
    QPen pen;
    pen = AppThemeManager::GetInstance()->theme()->borderPen();
    painter->setPen(pen);
    painter->drawRoundedRect(4, 4, this->width() - 8, this->height() - 8, 5, 5);

    //Draw title
//    QPoint pointTitle(407, 8);
//    QSize sizeTitle(600, 40);
//    painter->drawRoundedRect(pointTitle.x(), pointTitle.y(), sizeTitle.width(), sizeTitle.height(), 5, 5);
    m_FontText.setPixelSize(28);
    painter->setFont(m_FontText);
//    pen = AppThemeManager::GetInstance()->theme()->labelPen();
//    painter->setPen(pen);
//    painter->drawText(pointTitle.x() + 5, pointTitle.y(), sizeTitle.width(), sizeTitle.height(), Qt::AlignLeft, m_TxtSampCycleTitle);
//    painter->drawText(pointTitle.x(), pointTitle.y(), sizeTitle.width() - 4, sizeTitle.height(), Qt::AlignRight, m_TxtSampCycleUnit);
//    QFontMetrics fm(m_FontText);
//    int widthSampCycleUnit = fm.width(m_TxtSampCycleUnit);
//    pen = AppThemeManager::GetInstance()->theme()->valuePen();
//    painter->setPen(pen);
//    painter->drawText(pointTitle.x() - widthSampCycleUnit - 10, pointTitle.y(), sizeTitle.width() - 4, sizeTitle.height(), Qt::AlignRight, m_TxtSampCycleValue);

    //Draw graph
    int iTime = m_SampCycleValue;
    int xScale = iTime * m_ChanelMax / 5;
    QPoint pointBegin(20, 30);
    QPoint pointOfBuffered(387, 54);
    QSize sizeOfBuffered(618, 582);
    m_FontText.setPixelSize(14);
    painter->setFont(m_FontText);
    pen = AppThemeManager::GetInstance()->theme()->labelPen();
    painter->setPen(pen);
    for (int i = 0; i < 6; i++)
    {
        if (i == 0)
        {
            painter->drawText(i * X_SPACE + pointBegin.x() + pointOfBuffered.x() - 5,
                              sizeOfBuffered.height() - pointBegin.x() + pointOfBuffered.y(),
                              X_SPACE, 30, Qt::AlignLeft, QString::number(i * xScale));
        }
        else
        {
            painter->drawText(i * X_SPACE + pointBegin.x() / 2 + pointOfBuffered.x(),
                              sizeOfBuffered.height() - pointBegin.x() + pointOfBuffered.y(),
                              X_SPACE, 30, Qt::AlignLeft, QString::number(i * xScale));
        }
        pen = AppThemeManager::GetInstance()->theme()->linePen();
        pen.setStyle(Qt::DashLine);
        painter->setPen(pen);
        painter->drawLine(i * X_SPACE + pointBegin.x() + pointOfBuffered.x(), pointOfBuffered.y(),
                          i * X_SPACE + pointBegin.x() + pointOfBuffered.x(), sizeOfBuffered.height() - pointBegin.x() + pointOfBuffered.y());
    }

    painter->drawLine(pointOfBuffered.x() + pointBegin.x(), pointOfBuffered.y(), sizeOfBuffered.width() + pointOfBuffered.x(), pointOfBuffered.y());

    for (int i = 0; i < m_SignalNumber; i++)
    {
        pen = AppThemeManager::GetInstance()->theme()->labelPen();
        painter->setPen(pen);
        painter->drawText(pointBegin.x() + pointOfBuffered.x() - pointBegin.x(),
                          i * Y_SPACE + 10 + pointOfBuffered.y(),
                          Y_SPACE, 30, Qt::AlignLeft, QString::number(i + 1));

        pen = AppThemeManager::GetInstance()->theme()->linePen();
        pen.setStyle(Qt::DashLine);
        painter->setPen(pen);
        painter->drawLine(pointBegin.x() + pointOfBuffered.x(), Y_BEGIN + i * Y_SPACE + pointOfBuffered.y(),
                          sizeOfBuffered.width() + pointOfBuffered.x(), Y_BEGIN + i * Y_SPACE + pointOfBuffered.y());
    }

    if (!m_IsStarted)
    {
        return;
    }

    if (m_IsClear)
    {
        if (m_IsFetchingData)
        {
            m_IsClear = false;
        }
        return;
    }

    if (m_GraphInfoValue == (int)IOMonitorScreenControl::Yes)
    {
        pen.setStyle(Qt::SolidLine);
        pen.setWidth(3);
        pen.setColor(m_ColorSignal);
        painter->setPen(pen);

        float x = pointBegin.x() + pointOfBuffered.x();
        for (int i = 0; i < m_ChanelMax; i++)
        {
            for (int j = 0; j < m_SignalNumber; j++)
            {
                if (m_SignalValueList[j + 1])
                {
                    continue;
                }

//                if (40 <= i && i <= 130 && !m_IsPredictedSignal)
//                {
//                    continue;
//                }

//                uint pId = getIOTimingDataPID((ushort)(j + 1));
//                uint contents1 = getParamUint(pId, (ushort)(i + 1));

                if (m_PIDValueList[i + 1] == 1)
                {
                    if ((i > 0) && (m_LinePositionList.contains(j)) && (m_LinePositionList[j] == IOMonitorScreenControl::down))
                    {
                        painter->drawLine(x, Y_BEGIN_TRUE + Y_SPACE * j + pointOfBuffered.y(), x, Y_BEGIN_TRUE + Y_SPACE * j + 30 - 3 + pointOfBuffered.y());

                    }
                    painter->drawLine(x, Y_BEGIN_TRUE + Y_SPACE * j + pointOfBuffered.y(), x + X_STEP, Y_BEGIN_TRUE + Y_SPACE * j + pointOfBuffered.y());
                    m_LinePositionList[j] = IOMonitorScreenControl::up;
                }
                else
                {
                    if ((i > 0) && (m_LinePositionList.contains(j)) && (m_LinePositionList[j] == IOMonitorScreenControl::up))
                    {
                        painter->drawLine(x, Y_BEGIN + (Y_SPACE * j) + pointOfBuffered.y(), x, Y_BEGIN + (Y_SPACE * j) - 30 + 3 + pointOfBuffered.y());
                    }
                    painter->drawLine(x, Y_BEGIN + Y_SPACE * j + pointOfBuffered.y(), x + X_STEP, Y_BEGIN + Y_SPACE * j + pointOfBuffered.y());
                    m_LinePositionList[j] = IOMonitorScreenControl::down;
                }
            }
            x += X_STEP;
        }
    }
}
