#ifndef XRAY_QIMAGE_H
#define XRAY_QIMAGE_H

#include "QtQuick/qquickpainteditem.h"
#include "QPixmap"
#include "QPainter"
#include "QWidget"


class XRay_qimage : public QQuickPaintedItem
{
    Q_OBJECT
public:
    XRay_qimage(QQuickItem *parent=0);
    ~XRay_qimage();

    bool isStart;
    void paint(QPainter *painter);

    void DrawPanelContentResult();
    void DrawImageInput();
    void DrawImageOutput();

    void LoadImage();
    QPixmap NG[9];
    QPixmap Spectrum[5];

    Q_INVOKABLE void getIsStart(bool _isStart);

protected:
    QImage _mImage;
    QPainter *_mPainter;
    int const _WIDTH_SCREEN = 1024;
    int const _HEIGHT_SCREEN = 640;
private:
    QTimer* timerDrawing;
public slots:

    void updateDraw();
};

#endif // XRAY_QIMAGE_H
