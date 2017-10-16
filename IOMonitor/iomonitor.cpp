#include "iomonitor.h"
#include "QDebug"

IOMonitor::IOMonitor()
{
    m_Timer = new QTimer();
    connect(m_Timer, SIGNAL(timeout()), this, SLOT(updateDraw()));
    m_Timer->start(2000);
}

IOMonitor::~IOMonitor()
{

}

void IOMonitor::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 640, AppThemeManager::GetInstance()->theme()->colorBackGround());
    QPen pen(AppThemeManager::GetInstance()->theme()->linePen());
    painter->setPen(pen);
    painter->drawRoundedRect(4, 4, this->width() - 8, this->height() - 8, 5, 5);

    //Draw title
    QPoint pointTitle(407, 8);
    QSize sizeTitle(600, 40);
    painter->drawRoundedRect(pointTitle.x(), pointTitle.y(), sizeTitle.width(), sizeTitle.height(), 5, 5);
    QFont font(":/Images/MS Gothic.ttf");
    font.setPixelSize(28);
    painter->setFont(font);
    pen = AppThemeManager::GetInstance()->theme()->labelPen();
    painter->setPen(pen);
    painter->drawText(pointTitle.x() + 5, pointTitle.y(), sizeTitle.width(), sizeTitle.height(), Qt::AlignLeft, m_SampCycleTitle);
    painter->drawText(pointTitle.x(), pointTitle.y(), sizeTitle.width() - 4, sizeTitle.height(), Qt::AlignRight, m_SampCycleUnit);

    //Draw graph
    int iTime = m_SamplingCycle;
    int xScale = iTime * CH_MAX / 5;
    QPoint pointBegin(20, 30);
    QPoint pointOfBuffered(387, 54);
    QSize sizeOfBuffered(618, 582);
    font.setPixelSize(14);
    painter->setFont(font);
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
        pen.setStyle(Qt::DashLine);
        painter->setPen(pen);
        painter->drawLine(i * X_SPACE + pointBegin.x() + pointOfBuffered.x(), pointOfBuffered.y(),
                          i * X_SPACE + pointBegin.x() + pointOfBuffered.x(), sizeOfBuffered.height() - pointBegin.x() + pointOfBuffered.y());
    }

    pen = AppThemeManager::GetInstance()->theme()->linePen();
    painter->setPen(pen);
    painter->drawLine(pointOfBuffered.x() + pointBegin.x(), pointOfBuffered.y(), sizeOfBuffered.width() + pointOfBuffered.x(), pointOfBuffered.y());

    for (int i = 0; i < SIGNAL_NUM; i++)
    {
        pen = AppThemeManager::GetInstance()->theme()->labelPen();
        painter->setPen(pen);
        painter->drawText(pointBegin.x() + pointOfBuffered.x() - pointBegin.x(),
                          i * Y_SPACE + 10 + pointOfBuffered.y(),
                          Y_SPACE, 30, Qt::AlignLeft, QString::number(i + 1));

        pen = AppThemeManager::GetInstance()->theme()->linePen();
        painter->setPen(pen);
        painter->drawLine(pointBegin.x() + pointOfBuffered.x(), Y_BEGIN + i * Y_SPACE + pointOfBuffered.y(),
                          sizeOfBuffered.width() + pointOfBuffered.x(), Y_BEGIN + i * Y_SPACE + pointOfBuffered.y());
    }

    if (!m_isStarted)
    {
        return;
    }

    if (m_isClear)
    {
        if (m_isFetchingData)
        {
            m_isClear = false;
        }
        return;
    }

    int graph_info = 2;
    if (graph_info == (int)IOMonitor::Yes)
    {
        pen.setStyle(Qt::SolidLine);
        pen.setWidth(3);
        pen.setColor(QColor(0x66, 0xCC, 0xFF));
        painter->setPen(pen);

        float x = pointBegin.x() + pointOfBuffered.x();
        for (int i = 0; i < CH_MAX; i++)
        {
            for (int j = 0; j < SIGNAL_NUM; j++)
            {
                if (checkNullSignal((ushort)(j + 1)))
                {
                    continue;
                }

                if (40 <= i && i <= 130 && !m_isPredictedSignal)
                {
                    continue;
                }

                uint pId = getIOTimingDataPID((ushort)(j + 1));
                uint contents1 = getParamUint(pId, (ushort)(i + 1));

                if (contents1 == 1)
                {
                    if ((i > 0) && (m_listLinePosition.contains(j)) && (m_listLinePosition[j] == IOMonitor::down))
                    {
                        painter->drawLine(x, Y_BEGIN_TRUE + Y_SPACE * j + pointOfBuffered.y(), x, Y_BEGIN_TRUE + Y_SPACE * j + 30 - 3 + pointOfBuffered.y());

                    }
                    painter->drawLine(x, Y_BEGIN_TRUE + Y_SPACE * j + pointOfBuffered.y(), x + X_STEP, Y_BEGIN_TRUE + Y_SPACE * j + pointOfBuffered.y());
                    m_listLinePosition[j] = IOMonitor::up;
                }
                else
                {
                    if ((i > 0) && (m_listLinePosition.contains(j)) && (m_listLinePosition[j] == IOMonitor::up))
                    {
                        painter->drawLine(x, Y_BEGIN + (Y_SPACE * j) + pointOfBuffered.y(), x, Y_BEGIN + (Y_SPACE * j) - 30 + 3 + pointOfBuffered.y());
                    }
                    painter->drawLine(x, Y_BEGIN + Y_SPACE * j + pointOfBuffered.y(), x + X_STEP, Y_BEGIN + Y_SPACE * j + pointOfBuffered.y());
                    m_listLinePosition[j] = IOMonitor::down;
                }
            }
            x += X_STEP;
        }
    }
}

void IOMonitor::updateDraw()
{
    this->update();
}

QString IOMonitor::txtSampCycleTitle()
{
    return m_SampCycleTitle;
}

void IOMonitor::setTxtSampCycleTitle(QString &value)
{
    m_SampCycleTitle = value;
}

QString IOMonitor::txtSampCycleUnit()
{
    return m_SampCycleUnit;
}

void IOMonitor::setTxtSampCycleUnit(QString &value)
{
    m_SampCycleUnit = value;
}

void IOMonitor::updateSamplingCycle(int value)
{
    m_SamplingCycle = value;
    this->update();
}

void IOMonitor::updateClear()
{
    m_isClear = true;
    this->update();
}

void IOMonitor::updateFetchingData(bool isFetchingData)
{
    m_isFetchingData = isFetchingData;
}

void IOMonitor::updateStartStopMachine(bool isStart)
{
    m_isStarted = isStart;
}

bool IOMonitor::checkNullSignal(ushort chanel)
{
#ifdef STUP_DISPLAY_DATA
    if (chanel == 0)
    {
        return true;
    }

    if ((chanel == 2 || chanel == 3) && chanel == 0)
    {
        return true;
    }

    if (chanel == 1 && chanel == 100)
    {
        return true;
    }

    return false;
#endif
}

uint IOMonitor::getIOTimingDataPID(ushort chanel)
{
    uint pid = 0;
#ifdef STUP_DISPLAY_DATA
    switch (chanel)
    {
        case 1:
            pid = 1;
            break;

        case 2:
            pid = 2;
            break;

        case 3:
            pid = 3;
            break;

        case 4:
            pid = 4;
            break;

        case 5:
            pid = 5;
            break;

        case 6:
            pid = 6;
            break;

        case 7:
            pid = 7;
            break;

        case 8:
            pid = 8;
            break;

        case 9:
            pid = 9;
            break;

        case 10:
            pid = 10;
            break;

        case 11:
            pid = 11;
            break;

        case 12:
            pid = 12;
            break;

        case 13:
            pid = 13;
            break;

        case 14:
            pid = 14;
            break;
    }
#endif

    return pid;
}

uint IOMonitor::getParamUint(uint paramId, ushort chanel)
{
    uint value = 0;
#ifdef STUP_DISPLAY_DATA
    switch (paramId)
    {
        case 1:
            if (0 <= chanel && chanel <= 10)
            {
                value = 0;
            }
            else
            {
                value = 1;
            }
            break;

        case 2:
            value = rand() % 1;
            break;

        case 3:
            value = rand() % 1;
            break;

        case 4:
            value = rand() % 1;
            break;

        case 5:
            value = rand() % 1;
            break;

        case 6:
            value = rand() % 1;
            break;

        case 7:
            value = rand() % 1;
            break;

        case 8:
            value = rand() % 1;
            break;

        case 9:
            value = rand() % 1;
            break;

        case 10:
            value = rand() % 1;
            break;

        case 11:
            value = rand() % 1;
            break;

        case 12:
            value = rand() % 1;
            break;

        case 13:
            value = rand() % 1;
            break;

        case 14:
            value = rand() % 1;
            break;
    }
#endif
    return value;
}

void IOMonitor::updatePredictedSignal(bool isPredictedSignal)
{
    m_isPredictedSignal = isPredictedSignal;
}
