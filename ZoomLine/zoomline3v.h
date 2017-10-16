#ifndef ZOOMLINE3V_H
#define ZOOMLINE3V_H
#include "Control/drawControlBase/drawcontrolbase.h"
#include "Control/lineImage/lineimage.h"

class ZoomLine3V: public DrawControlBase
{
public:
    ZoomLine3V(QQuickItem* parent =0);
    ~ZoomLine3V();

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
    QPixmap backGroundCenter;
    QString strWeight= "50";

    void LoadImage();
};


#endif // ZOOMLINE3V_H
