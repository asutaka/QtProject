#include "production.h"
#include <QPainter>
#include <QDebug>
#include <QDateTime>
#include <QQuickItem>

Production::Production(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    LoadImages();
}

Production::~Production()
{
}
void Production::updateView(QString sWeight){
    strWeight = sWeight;
    this->update();
}

void Production::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 640, QColor(0, 0, 0));
    DrawMainContent(painter);
}

void Production::DrawMainContent(QPainter *qp)
{
    QFont font(":/fonts/MS Gothic.ttf", 100, QFont::Bold);
    font.setPixelSize(130);
    qp->setFont(font);
    QPen pen(Qt::white, 1, Qt::SolidLine);
    qp->setPen(pen);
    qp->drawText(QPoint(270 +(330- strWeight.length())/2,300),strWeight);
    qp->drawText(QPoint(620,300)," g");

    int weight = strWeight.toInt();
    int widthGraph= 0;
    qp->drawPixmap(277,361,pixmap1);
    if(weight== 0){
        widthGraph = 0;
        qp->drawPixmap(770,200,pixmap3);
    }
    else {
        widthGraph =(pixmap1.width())*weight/100;
        QRect rect(0, 0, widthGraph, pixmap1.height());
        if((weight >= 35)&&(weight<=70)){
            //OK
            qp->drawPixmap(770,200,pixmap2);
            qp->drawPixmap(277,361,pixmap5.copy(rect));
        }
        else if(weight < 35){
            //-NG
            qp->drawPixmap(770,200,pixmap3);
            qp->drawPixmap(277,361,pixmap7.copy(rect));
        }
        else{
            //+NG
            qp->drawPixmap(770,200,pixmap4);
            qp->drawPixmap(277,361,pixmap6.copy(rect));
        }
    }
}

void Production::LoadImages()
{
    pixmap1.load(":/Images/Massbar_bargraph.png");
    pixmap2.load(":/Images/cw_eval_pass.png");
    pixmap3.load(":/Images/cw_eval_minus.png");
    pixmap4.load(":/Images/cw_eval_plusng.png");
    pixmap5.load(":/Images/Massbar_bargraph_pass.png");
    pixmap6.load(":/Images/Massbar_bargraph_plusng.png");
    pixmap7.load(":/Images/Massbar_bargraph_minusng.png");
}





