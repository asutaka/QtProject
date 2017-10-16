#ifndef ZOOMLINE2V_H
#define ZOOMLINE2V_H

#include "Control/drawControlBase/drawcontrolbase.h"
#include "Control/lineImage/lineimage.h"


class ZoomLine2V : public DrawControlBase
{
public:
    ZoomLine2V(QQuickItem* parent =0);
    ~ZoomLine2V();

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

#endif // ZOOMLINE2V_H
