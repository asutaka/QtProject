#ifndef ZOOMLINE4V_H
#define ZOOMLINE4V_H
#include "Control/drawControlBase/drawcontrolbase.h"
#include "Control/lineImage/lineimage.h"


class ZoomLine4V : public DrawControlBase
{
public:
    ZoomLine4V(QQuickItem *parent =0);
    ~ZoomLine4V();
    void paint(QPainter *painter);
    void DrawBottomContent(QPainter *qp);
    void DrawMiddleContent(QPainter *qp);

private:

    QPixmap arrPixmapLineNo[12];
    QPixmap arrPixmapLineNoON[12];
    QPixmap arrMassbarBargraph[4];
    QPixmap arrEval[3];
    QPixmap arrBarGrap[4];
    QPixmap arrLineNoButton[12];
    QPixmap arrButton[16];
    QPixmap pixmapAve;
    QString strWeight= "50";

    void LoadImage();

};

#endif // ZOOMLINE4V_H
