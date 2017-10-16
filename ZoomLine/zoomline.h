#ifndef ZOOMLINE_H
#define ZOOMLINE_H
#include "Control/drawControlBase/drawcontrolbase.h"
#include "Control/lineImage/lineimage.h"

class ZoomLine : public DrawControlBase
{
public:
    ZoomLine(QQuickItem* parent = 0);
    ~ZoomLine();

    void paint(QPainter *painter);
    void DrawBottomContent(QPainter *qp);
    void DrawMiddleContent(QPainter *qp);

private:
    QPixmap arrPixmapLineNo[12];
    QPixmap arrPixmapLineNoON[12];
    QPixmap arrMassbarBargraph[4];
    QPixmap arrEval[3];
    QPixmap arrBarGrap[4];
    QPixmap arrButton[16];
    QPixmap arrLineNoButton[12];
    QPixmap pixmapAve;

    QString strWeight= "50";

    void LoadImages();
};

#endif // ZOOMLINE_H
