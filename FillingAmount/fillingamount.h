#ifndef FILLINGAMOUNT_H
#define FILLINGAMOUNT_H

#include <QtQuick/QQuickPaintedItem>
#include "Control/drawControlBase/drawcontrolbase.h"
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include "Control/lineImage/lineimage.h"

class FillingAmount : public DrawControlBase
{
public:
    FillingAmount(QQuickItem* parent = 0);
    ~FillingAmount();



private:
    QString m_name;
    QColor m_color;
    QPixmap barLimit,bgLine,bgLineInDiv, upper_AvgAlm,upper_AvgAlm_S,lower_AvgAlm,lower_AvgAlm_S;
    QPixmap com4backImg;
    QPixmap com4lineImg;
    QPixmap arrayPixmapLineNo[12];
    LineImage arrayLineImage[3];
    LineImage arrayLineImage1[3];

    QElapsedTimer startLoadTimer;
    QElapsedTimer drawTimer;

    int nLoadTime;
    int interval;
    int nMilliseconds;
    bool checkUpdate;
    bool switchValue = false;

    // two timers for updating DateTime and drawing
    QTimer* timerDateTime;
    QTimer* timerDrawing;

    void DrawMainContent(QPainter*);
    void paint(QPainter *painter);
    void LoadImages();
};

#endif // FILLINGAMOUNT_H
