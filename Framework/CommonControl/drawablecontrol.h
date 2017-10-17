#ifndef DRAWABLECONTROL_H
#define DRAWABLECONTROL_H
#include <QtQuick/QQuickPaintedItem>
#include <QtGui>

class DrawableControl : public QQuickPaintedItem
{
    Q_OBJECT
public:
    DrawableControl();
    void paint(QPainter *painter);
public slots:

signals:
    void onPaintHandle(QQuickItem* item, QPainter *painter);

};

#endif // DRAWABLECONTROL_H
