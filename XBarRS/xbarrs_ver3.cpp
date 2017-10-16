#include "xbarrs_ver3.h"
#include <QtMath>

XBarRS_ver3::XBarRS_ver3(QQuickItem *parent): DrawControlBase_Ver2(parent)
{
    xBarPos = QPoint(290, 200);
    rsPos = QPoint(290, 480);
    numberPos = QPoint(290, 400);

    xBarRefVal = 600;
    xBarUclVal = 50;
    xBarLclVal = -50;
    xBarClVal = 595;
    rUclVal = 120;
    rClVal = 50;
    sUclVal = 100;
    sClVal = 60;
    batchVal = 50 + qrand()%50;

    for (int i = 0; i < 50; i++) {
        xBarAllLineFullNumber[i] = 530 + qrand()%130;
        xBarAllLinePassNumber[i] = 550 + qrand()%100;
        dataAllLineRFullNumber[i] = 30 + qrand()%100;
        dataAllLineRPassNumber[i] = 50 + qrand()%70;
        dataAllLineSFullNumber[i] = 30 + qrand()%100;
        dataAllLineSPassNumber[i] = 50 + qrand()%70;
        for (int j = 0; j < 12; j++) {
            xBarForLineFullNumber[j][i] = 530 + qrand()%130;
            xBarForLinePassNumber[j][i] = 550 + qrand()%100;
            dataForLineRFullNumber[j][i] = 30 + qrand()%100;
            dataForLineRPassNumber[j][i] = 50 + qrand()%70;
            dataForLineSFullNumber[j][i] = 30 + qrand()%100;
            dataForLineSPassNumber[j][i] = 50 + qrand()%70;
        }
    }
}
XBarRS_ver3::~XBarRS_ver3()
{

}
void XBarRS_ver3::paint(QPainter *painter)
{
    painter->setRenderHint(QPainter::HighQualityAntialiasing);
    DrawControlBase_Ver2::paint(painter);
    drawMainGraph(painter);
    drawXBarGraph(painter);
    drawRsGraph(painter);
    drawNumberFrame(painter);
}
void XBarRS_ver3::drawMainGraph(QPainter *qp)
{
    //draw border
    pen.setColor(QColor(166,166,166));
    qp->setPen(pen);
    qp->drawRoundedRect(QRect(290, 60, 240, 130), 0, 0); // X-Bar statistic area
    qp->drawRoundedRect(QRect(770, 60, 240, 130), 0, 0); // R/S statistic area
    qp->drawRoundedRect(QRect(538, 60, 226, 40), 0, 0); // batch no area


    //draw title
    pen.setColor("#D9DB42");
    qp->setPen(pen);
    font.setPixelSize(32);
    qp->setFont(font);

    qp->drawText(QRect(290, 60, 240, 40), Qt::AlignCenter, "X-Bar");

    if (isR) {
        qp->drawText(QRect(770, 60, 240, 40), Qt::AlignCenter, "R");
    } else {
        qp->drawText(QRect(770, 60, 240, 40), Qt::AlignCenter, "S");
    }

    QString XBarUnit = "g";
    QString RsUnit = "g";
    QString BatchNoUnit = "times";

    pen.setColor(QColor(255, 255, 255));
    qp->setPen(pen);
    font.setPixelSize(20);
    qp->setFont(font);

    qp->drawText(340, 120, "UCL");
    qp->drawText(340, 150, "CL");
    qp->drawText(340, 180, "LCL");
    qp->drawText(510, 120, XBarUnit);
    qp->drawText(510, 150, XBarUnit);
    qp->drawText(510, 180, XBarUnit);

    qp->drawText(540, 90, "Batch No.");
    qp->drawText(710, 90, BatchNoUnit);

    qp->drawText(820, 120, "UCL");
    qp->drawText(820, 150, "CL");
    qp->drawText(990, 120, RsUnit);
    qp->drawText(990, 150, RsUnit);

    pen.setColor(QColor(255,217,187));
    qp->setPen(pen);
    qp->drawText(QRect(370, 120 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)(xBarRefVal + xBarUclVal)/100, 'f', 4));
    qp->drawText(QRect(370, 150 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)xBarClVal/100, 'f', 4));
    qp->drawText(QRect(370, 180 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)(xBarRefVal + xBarLclVal)/100, 'f', 4));

    if (isR) {
        qp->drawText(QRect(850, 120 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)rUclVal/100, 'f', 2));
        qp->drawText(QRect(850, 150 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)rClVal/100, 'f', 4));
    } else {
        qp->drawText(QRect(850, 120 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)sUclVal/100, 'f', 2));
        qp->drawText(QRect(850, 150 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)sClVal/100, 'f', 4));
    }

    qp->drawText(QRect(600, 90 - font.pixelSize(), 100, font.pixelSize()), Qt::AlignRight, QString::number(batchVal));

    pen.setWidth(2);
    pen.setColor(QColor("#FFB200"));
    qp->setPen(pen);
    qp->drawLine(295, 110, 335, 110);
    qp->drawLine(775, 110, 815, 110);

    pen.setColor(QColor("#0EEDED"));
    qp->setPen(pen);
    qp->drawLine(295, 140, 335, 140);
    qp->drawLine(775, 140, 815, 140);

    pen.setColor(QColor("red"));
    qp->setPen(pen);
    qp->drawLine(295, 170, 335, 170);
}
void XBarRS_ver3::drawXBarGraph(QPainter *qp)
{
    QPen pen_xBar;
    //Draw Frame
    pen_xBar.setColor(QColor(254,254,254));
    qp->setPen(pen_xBar);
    QRect frame(xBarPos.x(), xBarPos.y(), width, xBar_height);
    qp->fillRect(frame, QColor(31, 61, 72));
    qp->drawRoundedRect(frame,0,0);

    //Draw Ruler
    pen_xBar.setColor(QColor(132,131,133));
    pen_xBar.setStyle(Qt::DashLine);
    qp->setPen(pen_xBar);
    for (int i = 0; i < 6; i++)
    {
       int x = (xBarPos.x() + xMagin) + i*(width - xMagin - 10)/5;
       qp->drawLine(x, xBarPos.y(), x, xBarPos.y() + xBar_height);
    }

    pen_xBar.setWidth(2);
    pen_xBar.setColor("white");
    qp->setPen(pen_xBar);

    //Draw Line Ref
    qp->drawLine(xBarPos.x() + pen_xBar.width(), xBarPos.y() + xBar_height/2, xBarPos.x() + width, xBarPos.y() + xBar_height/2);
    pen_xBar.setStyle(Qt::SolidLine);

    int height;
    //Draw UCL Line
    pen_xBar.setColor("#FFB200");
    qp->setPen(pen_xBar);

    height = calHeightXBar(xBarUclVal);
    qp->drawLine(xBarPos.x() + pen_xBar.width(), xBarPos.y() + height, xBarPos.x() + width, xBarPos.y() + height);

    //Draw LCL Line
    pen_xBar.setColor("red");
    qp->setPen(pen_xBar);

    height = calHeightXBar(xBarLclVal);
    qp->drawLine(xBarPos.x() + pen_xBar.width(), xBarPos.y() + height, xBarPos.x() + width, xBarPos.y() + height);
    //Draw CL Line
    pen_xBar.setColor("#0EEDED");
    qp->setPen(pen_xBar);

    height =  calHeightXBar(xBarClVal - xBarRefVal);
    qp->drawLine(xBarPos.x() + pen_xBar.width(), xBarPos.y() + height, xBarPos.x() + width, xBarPos.y() + height);

    if (isForLine) {
        if (isPass) {
            drawLineChart(qp, xBarForLinePassNumber[currentLine - 1], QPoint(xBarPos.x() + xMagin, xBarPos.y()), true, width - xMagin, xBar_height);
        } else {
            drawLineChart(qp, xBarForLineFullNumber[currentLine - 1], QPoint(xBarPos.x() + xMagin, xBarPos.y()), true, width - xMagin, xBar_height);
        }
    } else {
        if (isPass) {
            drawLineChart(qp, xBarAllLinePassNumber, QPoint(xBarPos.x() + xMagin, xBarPos.y()), true, width - xMagin, xBar_height);
        } else {
            drawLineChart(qp, xBarAllLineFullNumber, QPoint(xBarPos.x() + xMagin, xBarPos.y()), true, width - xMagin, xBar_height);
        }
    }
}
void XBarRS_ver3::drawRsGraph(QPainter *qp)
{
    QPen pen_RS;
    //Draw Frame
    pen_RS.setColor(QColor(254,254,254));
    qp->setPen(pen_RS);
    QRect frame(rsPos.x(), rsPos.y(), width, rs_height);
    qp->fillRect(frame, QColor(31, 61, 72));
    qp->drawRoundedRect(frame,0,0);

    //Draw Ruler
    pen_RS.setColor(QColor(132,131,133));
    pen_RS.setStyle(Qt::DashLine);
    qp->setPen(pen_RS);
    for (int i = 0; i < 6; i++)
    {
       int x = (rsPos.x() + xMagin) + i*(width - xMagin - 10)/5;
       qp->drawLine(x, rsPos.y(), x, rsPos.y() + rs_height);
    }

    pen_RS.setWidth(2);
    pen_RS.setStyle(Qt::SolidLine);

    int height;
    //Draw UCL Line
    pen_RS.setColor("#FFB200");
    qp->setPen(pen_RS);

    height = yMagin;
    qp->drawLine(rsPos.x() + pen_RS.width(), rsPos.y() + height, rsPos.x() + width, rsPos.y() + height);

    //Draw CL Line
    pen_RS.setColor("#0EEDED");
    qp->setPen(pen_RS);

    height = calHeightRS(rUclVal - rClVal);
    qp->drawLine(rsPos.x() + pen_RS.width(), rsPos.y() + height, rsPos.x() + width, rsPos.y() + height);

    if (isForLine) {
        if (isPass) {
            if (isR) {
                drawLineChart(qp, dataForLineRPassNumber[currentLine - 1], QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            } else {
                drawLineChart(qp, dataForLineSPassNumber[currentLine - 1], QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            }
        } else {
            if (isR) {
                drawLineChart(qp, dataForLineRFullNumber[currentLine - 1], QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            } else {
                drawLineChart(qp, dataForLineSFullNumber[currentLine - 1], QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            }
        }
    } else {
        if (isPass) {
            if (isR) {
                drawLineChart(qp, dataAllLineRPassNumber, QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            } else {
                drawLineChart(qp, dataAllLineSPassNumber, QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            }
        } else {
            if (isR) {
                drawLineChart(qp, dataAllLineRFullNumber, QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            } else {
                drawLineChart(qp, dataAllLineSFullNumber, QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            }
        }
    }
}
void XBarRS_ver3::drawNumberFrame(QPainter *qp)
{
    QPen pen_number;
    pen_number.setColor(QColor(224, 254, 255));
    qp->setPen(pen_number);

    font.setPixelSize(18);
    qp->setFont(font);

    QPoint pos = numberPos;
    QString numberStr;
    for (int i = 0; i <= 6; i++)
    {
        pos.setX(numberPos.x() + xMagin + i*(width - xMagin - 10)/5);
        pos.setY(numberPos.y() + numberFrame_height/2 - font.pixelSize()/2);
        if (i == 0)
        {
           numberStr = QString::number(1);
        } else
        {
           numberStr = QString::number(i*10);
        }
        qp->drawText(QRect(pos.x() - 10, pos.y(), 20, 20), Qt::AlignCenter, numberStr);
        qp->drawLine(pos.x(), numberPos.y(), pos.x(), pos.y());
        qp->drawLine(pos.x(), pos.y() + font.pixelSize(), pos.x(), numberPos.y() + numberFrame_height);
    }
}
int XBarRS_ver3::calHeightXBar(int value)
{
    int _refLine;
    if(qFabs(xBarUclVal)>= qFabs(xBarLclVal))
    {
        _refLine = qFabs(xBarUclVal);
    }
    else {
        _refLine = qFabs(xBarLclVal);
    }
    double height;
    if(value == _refLine)
    {
        height = xBar_height/3;
    }
    else{
        height = ((double)value/_refLine) * (xBar_height/3);
    }
    return xBar_height/2 - (int)height;
}
int XBarRS_ver3::calHeightRS(int value)
{
    double scale;
    if(qFabs(value) < 100)
    {
        scale = (double)(rs_height - 2*yMagin)/100;
    }
    else{
        scale = (double)(rs_height - 2*yMagin)/qFabs(value);
    }
    return (int)(value*scale + yMagin);
}
void XBarRS_ver3::drawLineChart(QPainter *qp, int dataInput[], QPoint pos, bool xBar, int maxWidth, int maxHeight)
{
    int stepX = maxWidth/(number_Node - 1);
    int x0, y0, x1, y1, ymin, ymax;
    int margin = 2;
    ymin = pos.y() + margin;
    ymax = pos.y() + maxHeight - margin;

    QPen pen_polyline;
    pen_polyline.setWidth(2);
    pen_polyline.setColor("yellow");
    qp->setPen(pen_polyline);
    for (int i = 0; i < number_Node; i++) {
        if(i < number_Node - 1) {
            x0 = pos.x() + stepX * i;
            x1 = pos.x() + stepX * (i+1);

            if (xBar) {
                y0 = pos.y() + calHeightXBar(dataInput[i] - xBarRefVal);
                y1 = pos.y() + calHeightXBar(dataInput[i + 1] - xBarRefVal);
            } else {
                y0 = pos.y() + calHeightRS(rUclVal - dataInput[i]);
                y1 = pos.y() + calHeightRS(rUclVal - dataInput[i+1]);
            }

            //Compare point and frame
            if (!(y0 < ymin && y1 < ymin || y0 > ymax && y1 > ymax)) {
                if (y0 < ymin) {
                    x0 = x0 + ((ymin - y0) * (x1 - x0)) / (y1 - y0);
                    y0 = ymin;
                } else if (y0 > ymax) {
                    x0 = x0 + ((ymax - y0) * (x1 - x0)) / (y1 - y0);
                    y0 = ymax;
                }

                if (y1 < ymin) {
                    x1 = x0 + ((ymin - y0) * (x1 - x0)) / (y1 - y0);
                    y1 = ymin;
                } else if (y1 > ymax) {
                    x1 = x0 + ((ymax - y0) * (x1 - x0)) / (y1 - y0);
                    y1 = ymax;
                }
                qp->drawLine(QPointF(x0, y0),QPointF(x1, y1));

                QVector<QPoint> vector(0);
                vector.append(QPoint(x0, y0));
                vector.append(QPoint(x1, y1));
                vector.append(QPoint(x1, ymax));
                vector.append(QPoint(x0, ymax));
                QPolygon poly = QPolygon(vector);

                QPainterPath path;
                path.addPolygon(poly);
                qp->setOpacity(0.1);
                qp->fillPath(path,QBrush("yellow"));
                qp->setOpacity(1);

                if (isForLine) {
                    qp->drawEllipse(QPoint(x0, y0), 2, 2);
                    qp->drawEllipse(QPoint(x1, y1), 2, 2);
                }
            }
        }
    }
}
