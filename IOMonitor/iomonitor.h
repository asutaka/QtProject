#ifndef IOMONITOR_H
#define IOMONITOR_H

#include <QQuickPaintedItem>
#include <QPainter>
#include <QMap>
#include <QTimer>
#include "AppTheme/appthememanager.h"

class IOMonitor : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QString txtSampCycleTitle READ txtSampCycleTitle WRITE setTxtSampCycleTitle)
    Q_PROPERTY(QString txtSampCycleUnit READ txtSampCycleUnit WRITE setTxtSampCycleUnit)

public:
    IOMonitor();
    ~IOMonitor();

    QString txtSampCycleTitle();
    void setTxtSampCycleTitle(QString &value);
    QString txtSampCycleUnit();
    void setTxtSampCycleUnit(QString &value);

    void paint(QPainter *painter);

    Q_INVOKABLE void updateSamplingCycle(int value);
    Q_INVOKABLE void updateClear();
    Q_INVOKABLE void updateFetchingData(bool isFetchingData);
    Q_INVOKABLE void updateStartStopMachine(bool isStart);
    Q_INVOKABLE void updatePredictedSignal(bool isPredictedSignal);

private:
        const int Y_BEGIN_TRUE = 11;
        const int Y_BEGIN = 38;
        const int Y_SPACE = 40;
        const int X_SPACE = 115;
        const float X_STEP = 2.875f;
        const int YLINE_BIGIN = 54;
        const int YLINE_END = 619;
        const int SIGNAL_NUM = 14;
        const int CH_MAX = 200;

public:
        enum YesNo12 {
            No = 1,
            Yes = 2
        };

        enum _linePosition {
            up = 0,
            down = 1
        };

private:
        QTimer *m_Timer;
        int m_SamplingCycle = 10;
        bool m_isClear = true;
        bool m_isFetchingData = false;
        bool m_isStarted = false;
        bool m_isPredictedSignal = false;
        QMap<int, _linePosition> m_listLinePosition;
        QString m_SampCycleTitle;
        QString m_SampCycleUnit;

        bool checkNullSignal(ushort chanel);
        uint getIOTimingDataPID(ushort chanel);
        uint getParamUint(uint paramId, ushort chanel);

public slots:
        void updateDraw();
};

#endif // IOMONITOR_H
