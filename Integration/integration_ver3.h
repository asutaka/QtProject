#ifndef INTERGRATION_VER3_H
#define INTERGRATION_VER3_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include "Control/drawControlBase/drawcontrolbase_ver5.h"
#include "Control/lineImage/lineimage.h"

class Integration_ver3 : public DrawControlBase_ver5
{
public:
    Integration_ver3(QQuickItem* parent = 0);
    ~Integration_ver3();

    void paint(QPainter *painter);
//    void SetInterval(int interval);
//    void SetCheckUpdate(bool);
//    void SetRecordUpdateTime(bool);
//    void SetStartLoadTimer(QElapsedTimer slt);
    QList<int> GetLogDrawingTime();
    int GetLoadingTime();

    Q_INVOKABLE void DrawContent();
    Q_INVOKABLE void ClearContent();

private:
    QString m_name;
    QColor m_color;
    QPixmap com4backImg;
    QPixmap com4lineImg;
    QPixmap arrayPixmapLineNo[10];
    LineImage arrayLineImage[3];

    QElapsedTimer startLoadTimer;
    QElapsedTimer drawTimer;

    int nLoadTime;
    int interval;
    int nMilliseconds;
    bool checkUpdate;

    // two timers for updating DateTime and drawing
    QTimer* timerDateTime;
    QTimer* timerDrawing;

    void DrawMainContent(QPainter*);

    void LoadImages();

signals:
public slots:
    void updateTime();
    void updateDraw();

protected:
    void showEvent(QShowEvent *);
};

#endif // INTERGRATION_VER3_H
