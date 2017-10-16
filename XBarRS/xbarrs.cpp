#include "xbarrs.h"
#include <QtMath>

XBarRS::XBarRS(QQuickItem *parent): DrawControlBase(parent)
{
    xBarPos = QPoint(345, 160);
    rsPos = QPoint(345, 450);
    numberPos = QPoint(345, 370);

    xBarRefVal = 600;
    xBarUclVal = 50;
    xBarLclVal = -50;
    xBarClVal = 595;
    rsUclVal = 120;
    rsClVal = 50;
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
XBarRS::~XBarRS()
{

}
void XBarRS::paint(QPainter *painter)
{
    painter->setRenderHint(QPainter::HighQualityAntialiasing);
    DrawControlBase::paint(painter);  
    drawMainGraph(painter);
    drawXBarGraph(painter);
    drawRsGraph(painter);
    drawNumberFrame(painter);
}
void XBarRS::drawMainGraph(QPainter *qp)
{
    pen.setColor(QColor(132,131,133));
    qp->setPen(pen);
    qp->drawRoundedRect(QRect(10, 150, 1005, 480), 5, 5);

    QString XBarUnit = "g";
    QString RsUnit = "g";
    QString BatchNoUnit = "times";

    pen.setColor(QColor(255, 255, 255));
    pen.setWidth(1);
    qp->setPen(pen);

    font.setPixelSize(20);
    qp->setFont(font);

    qp->drawText(170, 250, "UCL");
    qp->drawText(170, 280, "CL");
    qp->drawText(170, 310, "LCL");
    qp->drawText(300, 250, XBarUnit);
    qp->drawText(300, 280, XBarUnit);
    qp->drawText(300, 310, XBarUnit);

    qp->drawText(100, 450, "Batch No.");
    qp->drawText(270, 450, BatchNoUnit);

    qp->drawText(170, 555, "UCL");
    qp->drawText(170, 585, "CL");
    qp->drawText(300, 555, RsUnit);
    qp->drawText(300, 585, RsUnit);

    pen.setColor(QColor(255,217,187));
    qp->setPen(pen);
    qp->drawText(QRect(200, 250 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number((double)(xBarRefVal + xBarUclVal)/100, 'f', 2));
    qp->drawText(QRect(200, 280 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number((double)xBarClVal/100, 'f', 4));
    qp->drawText(QRect(200, 310 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number((double)(xBarRefVal + xBarLclVal)/100, 'f', 2));

    qp->drawText(QRect(200, 555 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number((double)rsUclVal/100, 'f', 2));
    qp->drawText(QRect(200, 585 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number((double)rsClVal/100, 'f', 4));

    qp->drawText(QRect(170, 450 - font.pixelSize(), 90, font.pixelSize()), Qt::AlignRight, QString::number(batchVal));

    pen.setWidth(2);
    pen.setColor(QColor("#FFB200"));
    qp->setPen(pen);
    qp->drawLine(110, 245, 150, 245);
    qp->drawLine(110, 550, 150, 550);

    pen.setColor(QColor("#0EEDED"));
    qp->setPen(pen);
    qp->drawLine(110, 275, 150, 275);
    qp->drawLine(110, 580, 150, 580);

    pen.setColor(QColor("red"));
    qp->setPen(pen);
    qp->drawLine(110, 305, 150, 305);
}
void XBarRS::drawXBarGraph(QPainter *qp)
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
            drawPolyline(qp, xBarForLinePassNumber[currentLine - 1], QPoint(xBarPos.x() + xMagin, xBarPos.y()), true, width - xMagin, xBar_height);
        } else {
            drawPolyline(qp, xBarForLineFullNumber[currentLine - 1], QPoint(xBarPos.x() + xMagin, xBarPos.y()), true, width - xMagin, xBar_height);
        }
    } else {
        if (isPass) {
            drawPolyline(qp, xBarAllLinePassNumber, QPoint(xBarPos.x() + xMagin, xBarPos.y()), true, width - xMagin, xBar_height);
        } else {
            drawPolyline(qp, xBarAllLineFullNumber, QPoint(xBarPos.x() + xMagin, xBarPos.y()), true, width - xMagin, xBar_height);
        }
    }
}
void XBarRS::drawRsGraph(QPainter *qp)
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
    for (int i = 0; i < 5; i++)
    {
       int x = (rsPos.x() + xMagin) + i*(width - xMagin)/5;
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

    height = calHeightRS(rsUclVal - rsClVal);
    qp->drawLine(rsPos.x() + pen_RS.width(), rsPos.y() + height, rsPos.x() + width, rsPos.y() + height);

    if (isForLine) {
        if (isPass) {
            if (isR) {
                drawPolyline(qp, dataForLineRPassNumber[currentLine - 1], QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            } else {
                drawPolyline(qp, dataForLineSPassNumber[currentLine - 1], QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            }
        } else {
            if (isR) {
                drawPolyline(qp, dataForLineRFullNumber[currentLine - 1], QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            } else {
                drawPolyline(qp, dataForLineSFullNumber[currentLine - 1], QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            }
        }
    } else {
        if (isPass) {
            if (isR) {
                drawPolyline(qp, dataAllLineRPassNumber, QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            } else {
                drawPolyline(qp, dataAllLineSPassNumber, QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            }
        } else {
            if (isR) {
                drawPolyline(qp, dataAllLineRFullNumber, QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            } else {
                drawPolyline(qp, dataAllLineSFullNumber, QPoint(rsPos.x() + xMagin, rsPos.y()), false, width - xMagin, rs_height);
            }
        }
    }
}
void XBarRS::drawNumberFrame(QPainter *qp)
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
int XBarRS::calHeightXBar(int value)
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
int XBarRS::calHeightRS(int value)
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
void XBarRS::drawPolyline(QPainter *qp, int dataInput[], QPoint pos, bool xBar, int maxWidth, int maxHeight)
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
                y0 = pos.y() + calHeightRS(rsUclVal - dataInput[i]);
                y1 = pos.y() + calHeightRS(rsUclVal - dataInput[i+1]);
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
