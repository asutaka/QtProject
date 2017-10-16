#ifndef XBARRS_VER3_H
#define XBARRS_VER3_H
#include "Control/drawControlBase/drawcontrolbase_ver2.h"
#include "Control/lineImage/lineimage.h"

class XBarRS_ver3: public DrawControlBase_Ver2
{
public:
    XBarRS_ver3(QQuickItem* parent = 0);
    ~XBarRS_ver3();
    void paint(QPainter *painter);
    void drawMainGraph(QPainter *qp);
    void drawXBarGraph(QPainter *qp);
    void drawRsGraph(QPainter *qp);
    void drawNumberFrame(QPainter *qp);
    QPoint xBarPos;
    QPoint rsPos;
    QPoint numberPos;

private:
    const int xBar_height = 200;
    const int width = 720;
    const int xMagin = 24;
    const int yMagin = 30;
    const int rs_height = 150;
    const int numberFrame_height = 80;
    const int number_Node = 50;
    const int number_Line = 12;

    int xBarRefVal;
    int xBarUclVal;
    int xBarLclVal;
    int xBarClVal;
    int rUclVal;
    int rClVal;
    int sUclVal;
    int sClVal;
    int batchVal;

    int calHeightXBar(int value);
    int calHeightRS(int value);
    void drawLineChart(QPainter *qp, int dataInput[], QPoint pos, bool xBar, int maxWidth, int maxHeight);

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

#endif // XBARRS_VER3_H
