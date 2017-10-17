#ifndef XBARRS_NEWCHART_H
#define XBARRS_NEWCHART_H
#include "Control/drawControlBase/drawcontrolbase_ver3.h"
#include "QtCore/QTimer"

class XbarRS_NewChart: public DrawControlBase_Ver3
{
public:
    XbarRS_NewChart(QQuickItem *parent =0);
    ~XbarRS_NewChart();
    void paint(QPainter *painter);
    void drawMainGraph(QPainter *qp);
    void drawThreshold(QPainter *qp);

public:
    Q_INVOKABLE void drawXBarLine(QQuickItem *item, QPainter *painter);
    Q_INVOKABLE void drawRSLine(QQuickItem *item, QPainter *painter);
    Q_INVOKABLE void getPlotLocation(int plotX, int plotY, int plotWidth, int plotHeight, int space);


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

    int _plotX;
    int _plotY;
    int _plotWidth;
    int _plotHeight;
    int _space;

};

#endif // XBARRS_NEWCHART_H
