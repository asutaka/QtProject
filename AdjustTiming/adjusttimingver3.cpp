#include "adjusttimingver3.h"
#include <QPainter>
#include <QDebug>
#include <QQuickItem>
#include <QList>

AdjustTimingVer3::AdjustTimingVer3(QQuickItem *parent): QQuickPaintedItem (parent)
{
}
AdjustTimingVer3::~AdjustTimingVer3()
{

}
void AdjustTimingVer3::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 640, QColor(0, 0, 0));
    if(isDrawTn){
        if(local.count()!=0){
            DrawTn(painter, QColor(255,0,0),QPoint(local[1], local[0]),"T1",local[5],local[6]);
            DrawTn(painter, QColor(0,255,0),QPoint(local[2],local[0]),"T2",local[5],local[1]);
            DrawTn(painter, QColor(255,255,255),QPoint(local[3],local[0]),"T3",local[5],local[2]);
            DrawTn(painter, QColor(0,191,255),QPoint(local[4],local[0]),"T4",local[5],local[3]);
            DrawTn(painter, QColor(255,255,0),QPoint(local[5],local[0]),"T7",local[5],local[2]);
            DrawTn(painter, QColor(244,164,96),QPoint(local[6],local[0]),"T9",local[5],local[4]);
        }
    }
}
void AdjustTimingVer3::setDrawTn(QList<int> localTn)
{
    local =localTn;
    isDrawTn= true;
    this->update();
}

void AdjustTimingVer3::drawLegendLine(QPainter *qp)
{
}
void AdjustTimingVer3::DrawTn(QPainter *qp, QColor color, QPoint start, QString strTn, int maxX, int preTnX)
{
    int offsetLocalText = 470;
    QPen asisColor(color,0.7, Qt::SolidLine);
    qp->setPen(asisColor);

    QFont font(":/Images/MS Gothic.ttf",13, QFont::Normal);
    font.setPixelSize(17);
    qp->setFont(font);
    if((start.x() > maxX)||(start.x()>=(maxX -25))){
        if (start.x() > maxX){
            start.setX(maxX);
        }
        qp->drawLine(start.x(),start.y() -7,start.x(),start.y()-450);
        if(strTn == "T1"){
            qp->drawLine(start.x(),start.y()-450,start.x()-130,start.y()-460);
            QPen textColor(Qt::white, 1, Qt::SolidLine);
            qp->setPen(textColor);
            qp->drawText(start.x()-140,start.y()-offsetLocalText,strTn);
        }
        else if(strTn == "T2"){
            qp->drawLine(start.x(),start.y()-450,start.x()-110,start.y()-460);
            QPen textColor(Qt::white, 1, Qt::SolidLine);
            qp->setPen(textColor);
            qp->drawText(start.x()-120,start.y()-offsetLocalText,strTn);
        }
        else if(strTn == "T3"){
            qp->drawLine(start.x(),start.y()-450,start.x()-90,start.y()-460);
            QPen textColor(Qt::white, 1, Qt::SolidLine);
            qp->setPen(textColor);
            qp->drawText(start.x()-100,start.y()-offsetLocalText,strTn);
        }
        else if (strTn =="T4") {
            qp->drawLine(start.x(),start.y()-450,start.x()-70,start.y()-460);
            QPen textColor(Qt::white, 1, Qt::SolidLine);
            qp->setPen(textColor);
            qp->drawText(start.x()-80,start.y()-offsetLocalText,strTn);
        }
        else if (strTn =="T7") {
            qp->drawLine(start.x(),start.y()-450,start.x()-50,start.y()-460);
            QPen textColor(Qt::white, 1, Qt::SolidLine);
            qp->setPen(textColor);
            qp->drawText(start.x()-60,start.y()-offsetLocalText,strTn);
        }
        else{
            qp->drawLine(start.x(),start.y()-450,start.x()-30,start.y()-460);
            QPen textColor(Qt::white, 1, Qt::SolidLine);
            qp->setPen(textColor);
            qp->drawText(start.x()-40,start.y()-offsetLocalText,strTn);
        }
    }
    else{
        if(start.x()< (maxX -25)){
            if((start.x()- preTnX)<25)
            {
                qp->drawLine(start.x(),start.y()-7,start.x(),start.y()-450);
                if((start.x()-358)<100){
                    if(strTn == "T1"){
                        qp->drawLine(start.x(),start.y()-450,start.x()+30,start.y()-460);
                        QPen textColor(Qt::white, 1, Qt::SolidLine);
                        qp->setPen(textColor);
                        qp->drawText(start.x()+20,start.y()-offsetLocalText,strTn);
                    }
                    else if(strTn == "T2"){
                        qp->drawLine(start.x(),start.y()-450,start.x()+50,start.y()-460);
                        QPen textColor(Qt::white, 1, Qt::SolidLine);
                        qp->setPen(textColor);
                        qp->drawText(start.x()+40,start.y()-offsetLocalText,strTn);
                    }
                    else if(strTn == "T3"){
                        qp->drawLine(start.x(),start.y()-450,start.x()+70,start.y()-460);
                        QPen textColor(Qt::white, 1, Qt::SolidLine);
                        qp->setPen(textColor);
                        qp->drawText(start.x()+60,start.y()-offsetLocalText,strTn);
                    }
                    else if (strTn =="T4") {
                        qp->drawLine(start.x(),start.y()-450,start.x()+90,start.y()-460);
                        QPen textColor(Qt::white, 1, Qt::SolidLine);
                        qp->setPen(textColor);
                        qp->drawText(start.x()+80,start.y()-offsetLocalText,strTn);
                    }
                    else if (strTn =="T7") {
                        qp->drawLine(start.x(),start.y()-450,start.x()+110,start.y()-460);
                        QPen textColor(Qt::white, 1, Qt::SolidLine);
                        qp->setPen(textColor);
                        qp->drawText(start.x()+100,start.y()-offsetLocalText,strTn);
                    }
                    else{
                        qp->drawLine(start.x(),start.y()-450,start.x()+130,start.y()-460);
                        QPen textColor(Qt::white, 1, Qt::SolidLine);
                        qp->setPen(textColor);
                        qp->drawText(start.x()+120,start.y()-offsetLocalText,strTn);
                    }
                }
                else{
                    qp->drawLine(start.x(),start.y()-450,start.x()+30,start.y()-460);
                    QPen textColor(Qt::white, 1, Qt::SolidLine);
                    qp->setPen(textColor);
                    qp->drawText(start.x(),start.y()-offsetLocalText,strTn);
                }
            }
            else{
                qp->drawLine(start.x(),start.y()-7,start.x(),start.y()-460);
                QPen textColor(Qt::white, 1, Qt::SolidLine);
                qp->setPen(textColor);
                qp->drawText(start.x() +10 ,start.y()-offsetLocalText,strTn);
            }
        }
    }

}

