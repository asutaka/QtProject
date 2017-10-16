#include "adjusttimingver4.h"
#include <QPainter>
#include <QDebug>
#include <QQuickItem>
#include <QList>
#include <QPen>

AdjustTimingVer4::AdjustTimingVer4(QQuickItem *parent) :QQuickPaintedItem(parent)
{
    adjustVM =  new AdjustTimingVer4_VM();
}
AdjustTimingVer4::~AdjustTimingVer4()
{

}

void AdjustTimingVer4::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 640, AppThemeManager::GetInstance()->theme()->colorBackGround());
    if(isDrawTn){
        if(local.count()!=0){
            DrawTn(painter, QColor(255,0,0),QPoint(local[1], local[0]),titleTn[0],local[7],local[6]);
            DrawTn(painter, QColor(0,255,0),QPoint(local[2],local[0]),titleTn[1],local[7],local[1]);
            DrawTn(painter, QColor(255,255,255),QPoint(local[3],local[0]),titleTn[2],local[7],local[2]);
            DrawTn(painter, QColor(0,191,255),QPoint(local[4],local[0]),titleTn[3],local[7],local[3]);
            DrawTn(painter, QColor(255,255,0),QPoint(local[5],local[0]),titleTn[4],local[7],local[2]);
        }
    }
}

void AdjustTimingVer4::setDrawTn(QList<int> localTn, QList<QString> stringTn)
{
    local =localTn;
    titleTn=stringTn;
    isDrawTn= true;
    this->update();
}
void AdjustTimingVer4::DrawTn(QPainter *qp, QColor color,
                              QPoint start, QString strTn, int maxX, int preTnX)
{
    int offsetLocalText = 470;
    QPen asisColor(color,0.7, Qt::SolidLine);
    qp->setPen(asisColor);

    QFont font(":/Images/MS Gothic.ttf",13, QFont::Normal);
    font.setPixelSize(17);
    qp->setFont(font);
    qDebug()<<"start.x" <<start.x() <<"->" <<maxX << "--->"<<start.y()<<"preTn: "<<preTnX;
    qDebug()<<"local[4]" <<local[4];
    qDebug()<<"local[5]" <<local[5];
    if((start.x() > maxX)||(start.x()>=(maxX -25))){
        if (start.x() > maxX){
            start.setX(maxX);
        }
        qp->drawLine(start.x(),start.y() -7,start.x(),start.y()-450);
        if(strTn == titleTn[0]){
            qp->drawLine(start.x(),start.y()-450,start.x()-150,start.y()-460);
            QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x()-170,start.y()-offsetLocalText,strTn);
        }
        else if(strTn == titleTn[1]){
            qp->drawLine(start.x(),start.y()-450,start.x()-120,start.y()-460);
            QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x()-140,start.y()-offsetLocalText,strTn);
        }
        else if(strTn == titleTn[2]){
            qp->drawLine(start.x(),start.y()-450,start.x()-90,start.y()-460);
            QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x()-110,start.y()-offsetLocalText,strTn);
        }
        else if (strTn ==titleTn[3]) {
            qp->drawLine(start.x(),start.y()-450,start.x()-60,start.y()-460);
            QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x()-80,start.y()-offsetLocalText,strTn);
            qDebug()<<"T4: "<<1111;
        }

        else{
            qp->drawLine(start.x(),start.y()-450,start.x()-30,start.y()-460);
            QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x()-50,start.y()-offsetLocalText,strTn);
            qDebug()<<"T7: "<<1111;
        }
    }
    else{
        if(start.x()< (maxX -25)){
            if((start.x()- preTnX)<25)
            {
                qp->drawLine(start.x(),start.y()-7,start.x(),start.y()-450);
                if((start.x()-405)<100){
                    if(strTn == titleTn[0]){
                        qp->drawLine(start.x(),start.y()-450,start.x()+30,start.y()-460);
                        QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
                        qp->setPen(textColor);
                        qp->drawText(start.x()+20,start.y()-offsetLocalText,strTn);
                    }
                    else if(strTn == titleTn[1]){
                        qp->drawLine(start.x(),start.y()-450,start.x()+50,start.y()-460);
                        QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
                        qp->setPen(textColor);
                        qp->drawText(start.x()+40,start.y()-offsetLocalText,strTn);
                    }
                    else if(strTn == titleTn[2]){
                        qp->drawLine(start.x(),start.y()-450,start.x()+70,start.y()-460);
                        QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
                        qp->setPen(textColor);
                        qp->drawText(start.x()+60,start.y()-offsetLocalText,strTn);
                    }
                    else if (strTn ==titleTn[3]) {
                        qp->drawLine(start.x(),start.y()-450,start.x()+90,start.y()-460);
                        QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
                        qp->setPen(textColor);
                        qp->drawText(start.x()+80,start.y()-offsetLocalText,strTn);
                        qDebug()<<"T4: "<<2222;
                    }
                    else{
                        qp->drawLine(start.x(),start.y()-450,start.x()+110,start.y()-460);
                        QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
                        qp->setPen(textColor);
                        qp->drawText(start.x()+100,start.y()-offsetLocalText,strTn);
                        qDebug()<<"T7: "<<2222;
                    }
                }
                else{
                    qp->drawLine(start.x(),start.y()-450,start.x()+10,start.y()-460);
                    QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
                    qp->setPen(textColor);
                    qp->drawText(start.x(),start.y()-offsetLocalText,strTn);
                }

            }
            else{
                qp->drawLine(start.x(),start.y()-7,start.x(),start.y()-460);
                QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
                qp->setPen(textColor);
                qp->drawText(start.x() -10 ,start.y()-offsetLocalText,strTn);
            }

        }
    }
}
