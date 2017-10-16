#include "xbarrs_ver2.h"
#include <QtMath>

XBarRS_ver2::XBarRS_ver2(QQuickItem *parent): DrawControlBase(parent)
{
    xBarPos = QPoint(15, 150);
    rsPos = QPoint(15, 370);
    numberPos = QPoint(15, 320);

    xBarRefVal = 600;
    xBarUclVal = 50;
    xBarLclVal = -50;
    xBarClVal = 595;
    rUclVal = 120;
    rClVal = 50;
    sUclVal = 120;
    sClVal = 50;
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
XBarRS_ver2::~XBarRS_ver2()
{

}
void XBarRS_ver2::paint(QPainter *painter)
{
    painter->setRenderHint(QPainter::HighQualityAntialiasing);
    DrawControlBase::paint(painter);
    drawMainGraph(painter);
    drawXBarGraph(painter);
    drawRsGraph(painter);
    drawNumberFrame(painter);
}
void XBarRS_ver2::drawMainGraph(QPainter *qp)
{
    pen.setColor(QColor(132,131,133));
    qp->setPen(pen);
    qp->drawRoundedRect(QRect(10, 145, 1005, 485), 5, 5);

    QString XBarUnit = "g";
    QString RsUnit = "g";
    QString BatchNoUnit = "times";

    pen.setColor(QColor(255, 255, 255));
    pen.setWidth(1);
    qp->setPen(pen);

    font.setPixelSize(20);
    qp->setFont(font);

    qp->drawText(830, 230, "UCL");
    qp->drawText(830, 260, "CL");
    qp->drawText(830, 290, "LCL");
    qp->drawText(990, 230, XBarUnit);
    qp->drawText(990, 260, XBarUnit);
    qp->drawText(990, 290, XBarUnit);

    qp->drawText(720, 350, "Batch No.");
    qp->drawText(960, 350, BatchNoUnit);

    qp->drawText(830, 430, "UCL");
    qp->drawText(830, 460, "CL");
    qp->drawText(990, 430, RsUnit);
    qp->drawText(990, 460, RsUnit);

    qp->drawText(830, 555, "UCL");
    qp->drawText(830, 585, "CL");
    qp->drawText(990, 555, RsUnit);
    qp->drawText(990, 585, RsUnit);

    pen.setColor(QColor(255,217,187));
    qp->setPen(pen);
    qp->drawText(QRect(860, 230 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number((double)(xBarRefVal + xBarUclVal)/100, 'f', 2));
    qp->drawText(QRect(860, 260 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number((double)xBarClVal/100, 'f', 4));
    qp->drawText(QRect(860, 290 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number((double)(xBarRefVal + xBarLclVal)/100, 'f', 2));

    qp->drawText(QRect(860, 555 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number((double)rUclVal/100, 'f', 2));
    qp->drawText(QRect(860, 585 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number((double)rClVal/100, 'f', 4));

    qp->drawText(QRect(860, 430 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number((double)sUclVal/100, 'f', 2));
    qp->drawText(QRect(860, 460 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number((double)sClVal/100, 'f', 4));

    qp->drawText(QRect(830, 350 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number(batchVal));

    pen.setWidth(2);
    pen.setColor(QColor("#FFB200"));
    qp->setPen(pen);
    qp->drawLine(770, 225, 810, 225);
    qp->drawLine(770, 425, 810, 425);
    qp->drawLine(770, 550, 810, 550);

    pen.setColor(QColor("#0EEDED"));
    qp->setPen(pen);
    qp->drawLine(770, 255, 810, 255);
    qp->drawLine(770, 455, 810, 455);
    qp->drawLine(770, 580, 810, 580);

    pen.setColor(QColor("red"));
    qp->setPen(pen);
    qp->drawLine(770, 285, 810, 285);
}
void XBarRS_ver2::drawXBarGraph(QPainter *qp)
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
    for (int i = 0; i < 5; i++)
    {
       int x = (xBarPos.x() + xMagin) + i*(width - xMagin)/5;
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
            drawPolyline(qp, xBarForLinePassNumber[currentLine - 1], QPoint(xBarPos.x() + xMagin, xBarPos.y()), "xBar", width - xMagin, xBar_height);
        } else {
            drawPolyline(qp, xBarForLineFullNumber[currentLine - 1], QPoint(xBarPos.x() + xMagin, xBarPos.y()), "xBar", width - xMagin, xBar_height);
        }
    } else {
        if (isPass) {
            drawPolyline(qp, xBarAllLinePassNumber, QPoint(xBarPos.x() + xMagin, xBarPos.y()), "xBar", width - xMagin, xBar_height);
        } else {
            drawPolyline(qp, xBarAllLineFullNumber, QPoint(xBarPos.x() + xMagin, xBarPos.y()), "xBar", width - xMagin, xBar_height);
        }
    }
}
void XBarRS_ver2::drawRsGraph(QPainter *qp)
{
    QPen pen_RS;
    //Draw Frame
    pen_RS.setColor(QColor(254,254,254));
    qp->setPen(pen_RS);
    QRect frameR(rsPos.x(), rsPos.y(), width, rs_height);
    qp->fillRect(frameR, QColor(31, 61, 72));
    qp->drawRoundedRect(frameR,0,0);

    QRect frameS(rsPos.x(), rsPos.y()+ rs_height + 10, width, rs_height);
    qp->fillRect(frameS, QColor(31, 61, 72));
    qp->drawRoundedRect(frameS,0,0);

    //Draw Ruler
    pen_RS.setColor(QColor(132,131,133));
    pen_RS.setStyle(Qt::DashLine);
    qp->setPen(pen_RS);
    for (int i = 0; i < 5; i++)
    {
       int x = (rsPos.x() + xMagin) + i*(width - xMagin)/5;
       qp->drawLine(x, rsPos.y(), x, rsPos.y() + 2*rs_height + 10);
    }

    pen_RS.setWidth(2);
    pen_RS.setStyle(Qt::SolidLine);

    int height;
    //Draw UCL Line
    pen_RS.setColor("#FFB200");
    qp->setPen(pen_RS);

    height = yMagin;
    qp->drawLine(rsPos.x() + pen_RS.width(), rsPos.y() + height, rsPos.x() + width, rsPos.y() + height);
    qp->drawLine(rsPos.x() + pen_RS.width(), rsPos.y() + height + rs_height + 10, rsPos.x() + width, rsPos.y() + height + rs_height + 10);

    //Draw CL Line
    pen_RS.setColor("#0EEDED");
    qp->setPen(pen_RS);

    height = calHeightRS(rUclVal - rClVal);
    qp->drawLine(rsPos.x() + pen_RS.width(), rsPos.y() + height, rsPos.x() + width, rsPos.y() + height);

    height = calHeightRS(sUclVal - rClVal);
    qp->drawLine(rsPos.x() + pen_RS.width(), rsPos.y() + height + rs_height + 10, rsPos.x() + width, rsPos.y() + height + rs_height + 10);

    if (isForLine) {
        if (isPass) {
            drawPolyline(qp, dataForLineRPassNumber[currentLine - 1], QPoint(rsPos.x() + xMagin, rsPos.y()), "r", width - xMagin, rs_height);
            drawPolyline(qp, dataForLineSPassNumber[currentLine - 1], QPoint(rsPos.x() + xMagin, rsPos.y() + rs_height + 10), "s", width - xMagin, rs_height);
        } else {
            drawPolyline(qp, dataForLineRFullNumber[currentLine - 1], QPoint(rsPos.x() + xMagin, rsPos.y()), "r", width - xMagin, rs_height);
            drawPolyline(qp, dataForLineSFullNumber[currentLine - 1], QPoint(rsPos.x() + xMagin, rsPos.y() + rs_height + 10), "s", width - xMagin, rs_height);
        }
    } else {
        if (isPass) {
            drawPolyline(qp, dataAllLineRPassNumber, QPoint(rsPos.x() + xMagin, rsPos.y()), "r", width - xMagin, rs_height);
            drawPolyline(qp, dataAllLineSPassNumber, QPoint(rsPos.x() + xMagin, rsPos.y() + rs_height + 10), "s", width - xMagin, rs_height);
        } else {
            drawPolyline(qp, dataAllLineRFullNumber, QPoint(rsPos.x() + xMagin, rsPos.y()), "r", width - xMagin, rs_height);
            drawPolyline(qp, dataAllLineSFullNumber, QPoint(rsPos.x() + xMagin, rsPos.y() + rs_height + 10), "s", width - xMagin, rs_height);
        }
    }
}
void XBarRS_ver2::drawNumberFrame(QPainter *qp)
{
    QPen pen_number;
    pen_number.setColor(QColor(224, 254, 255));
    qp->setPen(pen_number);

    font.setPixelSize(18);
    qp->setFont(font);

    QPoint pos = numberPos;
    QString numberStr;
    for (int i = 0; i <= 5; i++)
    {
        pos.setX(numberPos.x() + xMagin + i*(width - xMagin)/5);
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
int XBarRS_ver2::calHeightXBar(int value)
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
int XBarRS_ver2::calHeightRS(int value)
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
void XBarRS_ver2::drawPolyline(QPainter *qp, int dataInput[], QPoint pos, QString graph, int maxWidth, int maxHeight)
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

            if (graph == "xBar") {
                y0 = pos.y() + calHeightXBar(dataInput[i] - xBarRefVal);
                y1 = pos.y() + calHeightXBar(dataInput[i + 1] - xBarRefVal);
            } else if(graph == "r"){
                y0 = pos.y() + calHeightRS(rUclVal - dataInput[i]);
                y1 = pos.y() + calHeightRS(rUclVal - dataInput[i+1]);
            } else {
                y0 = pos.y() + calHeightRS(sUclVal - dataInput[i]);
                y1 = pos.y() + calHeightRS(sUclVal - dataInput[i+1]);
            }

            //Compare point and frame
            if (!((y0 < ymin && y1 < ymin )|| (y0 > ymax && y1 > ymax))) {
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
