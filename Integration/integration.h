#ifndef INTEGRATION_H
#define INTEGRATION_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include "Control/drawControlBase/drawcontrolbase.h"
#include "Control/lineImage/lineimage.h"

class Integration : public DrawControlBase
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName)
    Q_PROPERTY(QColor color READ color WRITE setColor)

public:
    Integration(QQuickItem* parent = 0);
    ~Integration();

    QString name() const;
    void setName(const QString& name);

    QColor color() const;
    void setColor(const QColor& color);

    void paint(QPainter *painter);
    void SetInterval(int interval);
    void SetCheckUpdate(bool);
    void SetRecordUpdateTime(bool);
    void SetMyParent(QWindow*);
    void SetStartLoadTimer(QElapsedTimer slt);
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
    void ContentCleared();
    void ColorChanged();

public slots:
    void updateTime();
    void updateDraw();

protected:
    void showEvent(QShowEvent *);
};

#endif // INTEGRATION_H
