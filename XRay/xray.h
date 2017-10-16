#ifndef XRAY_H
#define XRAY_H

#include <QtQuick/QQuickPaintedItem>
#include "QPainter"
#include "QPen"
#include "QPixmap"
#include "QTimer"


class XRay: public QQuickPaintedItem
{
    Q_OBJECT
public:

    bool isStart;
    XRay(QQuickItem* parent = 0);
    ~XRay();
    void paint(QPainter *painter);
    void DrawPanelContentResult(QPainter *qp );
    void DrawImageInput(QPainter *qp);
    void DrawImageOutput(QPainter *qp);
    void LoadImage();
    QPixmap NG[9];
    QPixmap Spectrum[5];

    Q_INVOKABLE void getIsStart(bool _isStart);

private:
    QTimer* timerDrawing;
public slots:

    void updateDraw();
};

#endif // XRAY_H
