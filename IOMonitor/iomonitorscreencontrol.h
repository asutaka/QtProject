#ifndef IOMONITORSCREENCONTROL_H
#define IOMONITORSCREENCONTROL_H

#include <QQuickPaintedItem>
#include <QPainter>
#include <QMap>
#include "AppTheme/appthememanager.h"

class IOMonitorScreenControl : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(int sampCycleValue READ sampCycleValue WRITE setSampCycleValue)
    Q_PROPERTY(int signalNumber READ signalNumber WRITE setSignalNumber)
    Q_PROPERTY(int chanelMax READ chanelMax WRITE setChanelMax)
    Q_PROPERTY(int graphInfoValue READ graphInfoValue WRITE setGraphInfoValue)
    Q_PROPERTY(bool isClear READ isClear WRITE setIsClear)
    Q_PROPERTY(bool isFetchingData READ isFetchingData WRITE setIsFetchingData)
    Q_PROPERTY(bool isStarted READ isStarted WRITE setIsStarted)
    Q_PROPERTY(bool isPredictedSignal READ isPredictedSignal WRITE setIsPredictedSignal)
    Q_PROPERTY(QFont fontText READ fontText WRITE setFontText)
    Q_PROPERTY(QColor colorSignal READ colorSignal WRITE setColorSignal)
    Q_PROPERTY(QList<int> signalValueList READ signalValueList WRITE setSignalValueList)
    Q_PROPERTY(QList<int> pIDValueList READ pIDValueList WRITE setPIDValueList)

public:
    explicit IOMonitorScreenControl();

    bool isClear();
    void setIsClear(bool &value);
    bool isFetchingData();
    void setIsFetchingData(bool &value);
    bool isStarted();
    void setIsStarted(bool &value);
    bool isPredictedSignal();
    void setIsPredictedSignal(bool &value);
    int signalNumber();
    void setSignalNumber(int &value);
    int sampCycleValue();
    void setSampCycleValue(int &value);
    int chanelMax();
    void setChanelMax(int &value);
    int graphInfoValue();
    void setGraphInfoValue(int &value);
    QFont fontText();
    void setFontText(QFont &value);
    QColor colorSignal();
    void setColorSignal(QColor &value);
    QList<int> signalValueList();
    void setSignalValueList(QList<int> &value);
    QList<int> pIDValueList();
    void setPIDValueList(QList<int> &value);

    void paint(QPainter *painter);

    enum yesNo12 {
        No = 1,
        Yes = 2
    };

    enum linePosition {
        up = 0,
        down = 1
    };

private:
    int m_SampCycleValue;
    int m_SignalNumber;
    int m_ChanelMax;
    int m_GraphInfoValue;
    bool m_IsClear;
    bool m_IsFetchingData;
    bool m_IsStarted;
    bool m_IsPredictedSignal;
    QFont m_FontText;
    QColor m_ColorSignal;
    QList<int> m_SignalValueList;
    QList<int> m_PIDValueList;
    QMap<int, linePosition> m_LinePositionList;

    const int Y_BEGIN_TRUE = 11;
    const int Y_BEGIN = 38;
    const int Y_SPACE = 40;
    const int X_SPACE = 115;
    const float X_STEP = 2.875f;
    const int YLINE_BIGIN = 54;
    const int YLINE_END = 619;
};

#endif // IOMONITORSCREENCONTROL_H
