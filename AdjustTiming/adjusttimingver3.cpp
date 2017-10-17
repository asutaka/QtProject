#include "adjusttimingver3.h"
#include <QPainter>
#include <QDebug>
#include <QQuickItem>
#include <QList>
#include <QPen>

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
            DrawTn2(painter, QColor(255,0,0),QPoint(local[1], local[0]+16),"T1",local[7],local[8]);
            DrawTn2(painter, QColor(0,255,0),QPoint(local[2],local[0]+16),"T2",local[7],local[8]);
            DrawTn2(painter, QColor(255,255,255),QPoint(local[3],local[0]+16),"T3",local[7],local[8]);
            DrawTn2(painter, QColor(0,191,255),QPoint(local[4],local[0]+16),"T4",local[7],local[8]);
            DrawTn2(painter, QColor(255,255,0),QPoint(local[5],local[0]+16),"T7",local[7],local[8]);
            DrawTn2(painter, QColor(244,164,96),QPoint(local[6],local[0]+16),"T9",local[7],local[8]);
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

void AdjustTimingVer3::DrawTn2(QPainter *qp, QColor color,
                              QPoint start, QString strTn, int maxX, int startY)
{
    int offsetLocalText = 465;
    QPen asisColor(color, 0.7, Qt::SolidLine);
    qp->setPen(asisColor);

    QFont font(":/Images/MS Gothic.ttf",13, QFont::Normal);
    font.setPixelSize(17);
    qp->setFont(font);

    qp->drawLine(start.x(), startY , start.x(), startY - 440);

    if(strTn == "T1"){
        if(local[1] > maxX - 60){ //draw left
            qp->drawLine(start.x(), start.y() - 450, start.x() - 130, start.y() - 460);
            QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x() - 120, start.y() - offsetLocalText, strTn);
        }
        else { //draw right
            qp->drawLine(start.x(), start.y() - 42, start.x(), start.y() - 460);
            QPen textColor = AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x() - 10 , start.y() - offsetLocalText, strTn);
        }
    }

    if(strTn == "T2"){
        if(local[2] - local[1] < 150 && local[2] < maxX-40){ //Draw right
            qp->drawLine(start.x(), start.y() - 450, start.x() + 30, start.y() - 460);
            QPen textColor = AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x() + 10, start.y() - offsetLocalText, strTn);
        }
        else { //Draw left
            qp->drawLine(start.x(), start.y() - 450, start.x() - 100, start.y() - 460);
            QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x() - 90, start.y() - offsetLocalText, strTn);
        }
    }

    if(strTn == "T3"){
        if(local[3] - local[2] < 150 && local[3] < maxX-40){ //Draw right
            qp->drawLine(start.x(), start.y() - 450, start.x() + 50, start.y() - 460);
            QPen textColor = AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x() + 50, start.y() - offsetLocalText, strTn);
        }
        else { //Draw left
            qp->drawLine(start.x(), start.y() - 450, start.x() - 70, start.y() - 460);
            QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x() - 60, start.y() - offsetLocalText, strTn);
        }
    }

    if(strTn == "T4"){
        if(local[4] - local[3] < 150 && local[4] < maxX-40){ //Draw right
            qp->drawLine(start.x(), start.y() - 450, start.x() + 70, start.y() - 460);
            QPen textColor = AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x() + 60, start.y() - offsetLocalText, strTn);
        }
        else { //Draw left
            qp->drawLine(start.x(), start.y() - 450, start.x() - 60, start.y() - 460);
            QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x() - 40, start.y() - offsetLocalText, strTn);
        }
    }

    if(strTn == "T7"){
        if(local[5] - local[4] < 150 && local[5] < maxX-40){ //Draw right
            qp->drawLine(start.x(), start.y() - 450, start.x() + 90, start.y() - 460);
            QPen textColor = AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x() + 80, start.y() - offsetLocalText, strTn);
        }
        else { //Draw left
            qp->drawLine(start.x(), start.y() - 450, start.x() - 30, start.y() - 460);
            QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x() - 20, start.y() - offsetLocalText, strTn);
        }
    }

    if(strTn == "T9"){
        if(local[6] - local[5] < 150 && local[6] < maxX-40){ //Draw right
            qp->drawLine(start.x(), start.y() - 450, start.x() + 110, start.y() - 460);
            QPen textColor = AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x() + 100, start.y() - offsetLocalText, strTn);
        }
        else { //Draw left
            qp->drawLine(start.x(), start.y() - 450, start.x() - 10, start.y() - 460);
            QPen textColor= AppThemeManager::GetInstance()->theme()->labelPen();
            qp->setPen(textColor);
            qp->drawText(start.x(), start.y() - offsetLocalText, strTn);
        }
    }
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

void AdjustTimingVer3::drawAxisLine(QQuickItem *item, QPainter *painter)
{
    AxisOption option = mAxisOption.value((void*)item, AxisOption());

    QRectF rect = item->boundingRect();

    if (option.distanceX == 0)
        option.distanceX = rect.width();
    if (option.distanceY == 0)
        option.distanceY = rect.height();

    painter->setPen(QPen(QColor("#7f7f7f"), 2, Qt::SolidLine));

    // draw Axis X
    painter->drawLine(QPointF(0,rect.height()-1), QPointF(rect.width(), rect.height()-1));

    // draw dividing line of axis X
    QPointF p1, p2;
    for (qreal dx = 0; dx <= rect.width(); dx += option.distanceX) {
        painter->setPen(QPen(QColor(option.color), 1, Qt::SolidLine));
        p1.setX(dx);
        p1.setY(rect.height() - 1);

        p2.setX(dx);
        p2.setY(rect.height() + 1);

        painter->drawLine(p1, p2);

        if (option.drawGridX) {
            painter->setPen(QPen(QColor(option.color), 1, Qt::DashLine));
            painter->drawLine(QPointF(dx, rect.height()), QPointF(dx, 0));
        }
    }

    // draw Axis Y
    painter->setPen(QPen(QColor("#7f7f7f"), 2, Qt::SolidLine));
    painter->drawLine(QPointF(1,0), QPointF(1, rect.height()));

    // draw dividing line of axis Y
    for (qreal dy = 0; dy <= rect.height(); dy += option.distanceY) {
        painter->setPen(QPen(QColor(option.color), 1, Qt::SolidLine));
        p1.setX(1);
        p1.setY(dy);

        p2.setX(-1);
        p2.setY(dy);

        painter->drawLine(p1, p2);

        if (option.drawGridY) {
            painter->setPen(QPen(QColor(option.color), 1, Qt::DashLine));
            painter->drawLine(QPointF(0, dy), QPointF(rect.width(), dy));
        }
    }


}

