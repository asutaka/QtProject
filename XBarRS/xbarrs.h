#ifndef XBARRS_H
#define XBARRS_H
#include "Control/drawControlBase/drawcontrolbase.h"
#include "Control/lineImage/lineimage.h"

class XBarRS: public DrawControlBase
{
public:
    XBarRS(QQuickItem* parent = 0);
    ~XBarRS();
    void paint(QPainter *painter);
    void drawMainGraph(QPainter *qp);
    void drawXBarGraph(QPainter *qp);
    void drawRsGraph(QPainter *qp);
    void drawNumberFrame(QPainter *qp);
    QPoint xBarPos;
    QPoint rsPos;
    QPoint numberPos;

private:
    const int xBar_height = 210;
    const int width = 660;
    const int xMagin = 23;
    const int yMagin = 30;
    const int rs_height = 170;
    const int numberFrame_height = 80;
    const int number_Node = 50;
    const int number_Line = 12;

    int xBarRefVal;
    int xBarUclVal;
    int xBarLclVal;
    int xBarClVal;
    int rsUclVal;
    int rsClVal;
    int batchVal;

    int calHeightXBar(int value);
    int calHeightRS(int value);
    void drawPolyline(QPainter *qp, int dataInput[], QPoint pos, bool xBar, int maxWidth, int maxHeight);

    int xBarAllLineFullNumber[50];
    int xBarAllLinePassNumber[50];
    int dataAllLineRPassNumber[50];
    int dataAllLineRFullNumber[50];
    int dataAllLineSPassNumber[50];
    int dataAllLineSFullNumber[50];
    int xBarForLineFullNumber[12][50];
    int xBarForLinePassNumber[12][50];
    int dataForLineRPassNumber[12][50];
    int dataForLineRFullNumber[12][50];
    int dataForLineSPassNumber[12][50];
    int dataForLineSFullNumber[12][50];
};

#endif // XBARRS_H
