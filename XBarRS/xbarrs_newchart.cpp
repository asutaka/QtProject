#include "xbarrs_newchart.h"
#include <QApplication>
#include <QGridLayout>
#include <QQuickView>

XbarRS_NewChart::XbarRS_NewChart(QQuickItem *parent): DrawControlBase_Ver3(parent)
{
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
        xBarAllLineFullNumber[i] = 530 + qrand()%140;
        xBarAllLinePassNumber[i] = 550 + qrand()%100;
        dataAllLineRFullNumber[i] = 30 + qrand()%110;
        dataAllLineRPassNumber[i] = 50 + qrand()%70;
        dataAllLineSFullNumber[i] = 30 + qrand()%110;
        dataAllLineSPassNumber[i] = 50 + qrand()%70;
        for (int j = 0; j < 12; j++) {
            xBarForLineFullNumber[j][i] = 530 + qrand()%140;
            xBarForLinePassNumber[j][i] = 550 + qrand()%100;
            dataForLineRFullNumber[j][i] = 30 + qrand()%110;
            dataForLineRPassNumber[j][i] = 50 + qrand()%70;
            dataForLineSFullNumber[j][i] = 30 + qrand()%110;
            dataForLineSPassNumber[j][i] = 50 + qrand()%70;
        }
    }

}
XbarRS_NewChart::~XbarRS_NewChart()
{

}
void XbarRS_NewChart::paint(QPainter *painter)
{
    DrawControlBase_Ver3::paint(painter);
    drawMainGraph(painter);
    drawThreshold(painter);
}
void XbarRS_NewChart::drawMainGraph(QPainter *qp)
{
    //draw border
    pen.setColor(QColor(166,166,166));
    qp->setPen(pen);
    qp->fillRect(QRect(290, 450, 240, 130),"#29313c");
    qp->drawRoundedRect(QRect(290, 450, 240, 130), 0, 0); // X-Bar statistic area
    qp->fillRect(QRect(770, 450, 240, 130),"#29313c");
    qp->drawRoundedRect(QRect(770, 450, 240, 130), 0, 0); // R/S statistic area
    qp->fillRect(QRect(538, 450, 226, 40),"#29313c");
    qp->drawRoundedRect(QRect(538, 450, 226, 40), 0, 0); // batch no area


    //draw title
    pen.setColor("#D9DB42");
    qp->setPen(pen);
    font.setPixelSize(32);
    qp->setFont(font);

    qp->drawText(QRect(290, 450, 240, 40), Qt::AlignCenter, "X-Bar");

    if (isR) {
        qp->drawText(QRect(770, 450, 240, 40), Qt::AlignCenter, "R");
    } else {
        qp->drawText(QRect(770, 450, 240, 40), Qt::AlignCenter, "S");
    }

    QString XBarUnit = "g";
    QString RsUnit = "g";
    QString BatchNoUnit = "times";

    pen.setColor(QColor(255, 255, 255));
    qp->setPen(pen);
    font.setPixelSize(20);
    qp->setFont(font);

    qp->drawText(340, 510, "UCL");
    qp->drawText(340, 540, "CL");
    qp->drawText(340, 570, "LCL");
    qp->drawText(510, 510, XBarUnit);
    qp->drawText(510, 540, XBarUnit);
    qp->drawText(510, 570, XBarUnit);

    qp->drawText(540, 480, "Batch No.");
    qp->drawText(710, 480, BatchNoUnit);

    qp->drawText(820, 510, "UCL");
    qp->drawText(820, 540, "CL");
    qp->drawText(990, 510, RsUnit);
    qp->drawText(990, 540, RsUnit);

    pen.setColor(QColor(255,217,187));
    qp->setPen(pen);
    qp->drawText(QRect(370, 510 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)(xBarRefVal + xBarUclVal)/100, 'f', 4));
    qp->drawText(QRect(370, 540 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)xBarClVal/100, 'f', 4));
    qp->drawText(QRect(370, 570 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)(xBarRefVal + xBarLclVal)/100, 'f', 4));

    if (isR) {
        qp->drawText(QRect(850, 510 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)rUclVal/100, 'f', 2));
        qp->drawText(QRect(850, 540 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)rClVal/100, 'f', 4));
    } else {
        qp->drawText(QRect(850, 510 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)sUclVal/100, 'f', 2));
        qp->drawText(QRect(850, 540 - font.pixelSize(), 130, font.pixelSize()), Qt::AlignRight, QString::number((double)sClVal/100, 'f', 4));
    }

    qp->drawText(QRect(600, 480 - font.pixelSize(), 100, font.pixelSize()), Qt::AlignRight, QString::number(batchVal));

    pen.setWidth(2);
    pen.setColor(QColor("#FFB200"));
    qp->setPen(pen);
    qp->drawLine(295, 500, 335, 500);
    qp->drawLine(775, 500, 815, 500);

    pen.setColor(QColor("#0EEDED"));
    qp->setPen(pen);
    qp->drawLine(295, 530, 335, 530);
    qp->drawLine(775, 530, 815, 530);

    pen.setColor(QColor("red"));
    qp->setPen(pen);
    qp->drawLine(295, 560, 335, 560);
}

void XbarRS_NewChart::drawThreshold(QPainter *qp)
{
    QPen pen_xBar;
    //Draw UCL Line
    pen_xBar.setColor("#FFB200");
    qp->setPen(pen_xBar);
    qp->drawLine(330, 100, 980, 100);

    //Draw LCL Line
    pen_xBar.setColor("red");
    qp->setPen(pen_xBar);
    qp->drawLine(330, 138, 980, 138 );

    //Draw CL Line
    pen_xBar.setColor("#0EEDED");
    qp->setPen(pen_xBar);
    qp->drawLine(330, 175, 980, 175 );

    //Draw area chart Xbar
    pen_xBar.setColor("#7e7e7e");
    qp->setPen(pen_xBar);
    qp->drawLine(330,70, 980,70 );
    qp->drawLine(330, 70, 330, 200);
    qp->drawLine(980, 70, 980, 200);

    //Draw UCL Line RS
    pen_xBar.setColor("#FFB200");
    qp->setPen(pen_xBar);
    qp->drawLine(330,300, 980, 300 );

    //Draw CL Line RS
    pen_xBar.setColor("#0EEDED");
    qp->setPen(pen_xBar);
    qp->drawLine(330,350, 980, 350);

    //Draw area chart RS
    pen_xBar.setColor("#7e7e7e");
    qp->setPen(pen_xBar);
    qp->drawLine(330,270, 980,270);
    qp->drawLine(330,270, 330,400);
    qp->drawLine(980,270, 980,400);

}

