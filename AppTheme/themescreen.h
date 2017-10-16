#ifndef THEMESCREEN_H
#define THEMESCREEN_H
#include <QQuickItem>
#include <QtQuick/QQuickPaintedItem>
#include "AppTheme/appthememanager.h"
#include <QPainter>
#include <QColor>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include "Control/lineImage/lineimage.h"

class ThemeScreen : public QQuickPaintedItem
{
    Q_OBJECT
public:
    ThemeScreen(QQuickItem* parent = 0);
    ~ThemeScreen();
    Q_INVOKABLE void setTheme(int indexTheme);
    Q_INVOKABLE int getTheme();
private:
    QString m_name;
    QColor m_color;
    QPixmap pixmap, barLimit,bgLine,bgLineInDiv, upper_AvgAlm,upper_AvgAlm_S,lower_AvgAlm,lower_AvgAlm_S;
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

    QTimer* timerDrawing;
    QPen pen;
    QFont font;

    void DrawMainContent(QPainter*);
    void DrawCom1(QPainter *qp);
    void DrawCom2(QPainter *qp);
    void DrawCom3(QPainter *qp);
    void paint(QPainter *painter);
    void LoadImages();
public slots:
    void updateDraw();
};

#endif // THEMESCREEN_H
