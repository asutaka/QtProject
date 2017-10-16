#ifndef BUFFEREDGRAPHICSPANEL_H
#define BUFFEREDGRAPHICSPANEL_H

#include <QTimer>
#include <QPainter>
#include <QQuickPaintedItem>
#include <QObject>

class BufferedGraphicsPanel : public QQuickPaintedItem
{
    Q_OBJECT

public:
    BufferedGraphicsPanel();
    ~BufferedGraphicsPanel();

    void paint(QPainter *painter);
    int getFrequence() const;
    void setFrequence(const int frequence);

    Q_INVOKABLE void updateBufferedGraphisPanel();

private:
    QTimer *m_Timer;
    QImage m_Image;
    QPainter *m_Painter;
    int m_Frequence = 100;
    const int _WIDTH_SCREEN = 1024;
    const int _HEIGHT_SCREEN = 640;

signals:
    void signalDrawControl(QPainter *painter);

public slots:
    void refreshPanel();

public:
    enum IntervalTime {
        Interval_Stop = -1,
        Interval_None = 0,
        Interval_100 = 100,
        Interval_300 = 300,
        Interval_330 = 330,
        Interval_500 = 500,
        Interval_2000 = 2000,
        Interval_5000 = 5000,
    };
    Q_ENUMS(IntervalTime)
};

#endif // BUFFEREDGRAPHICSPANEL_H
