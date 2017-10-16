#include "xray.h"
#include <QPropertyAnimation>
#include <QPushButton>
#include <QGraphicsPixmapItem>

XRay::XRay(QQuickItem *parent) : QQuickPaintedItem(parent)
{
    LoadImage();
    isStart =false;
    timerDrawing = new QTimer(this);
    connect(timerDrawing, SIGNAL(timeout()), this, SLOT(updateDraw()));
    //    timerDrawing->start(2000);
}
XRay::~XRay()
{
    delete timerDrawing;
}
void XRay::paint(QPainter *painter)
{
    DrawPanelContentResult(painter);
    DrawImageInput(painter);
    DrawImageOutput(painter);
}
void XRay:: updateDraw()
{
    this->update();
}

// Draw Content Result
void XRay::DrawPanelContentResult(QPainter *qp)
{
    QPen pen;
    QFont font;
    //Draw Back Ground
    qp->drawRoundedRect(QRect(750,38,274,257),5,5);
    qp->fillRect(QRect(750,38,274,257), QColor(90,100,105));

    //Draw Button ProductNo
    pen.setColor("#FFCC99");
    pen.setWidth(2);
    qp->setPen(pen);
    qp->drawRoundedRect(QRect(750,39,272,54), 5,5);

    pen.setColor("#00CD66");
    font.setPixelSize(15);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);

    qp->setPen(pen);
    qp->setFont(font);
    qp->drawText(755,55,"Prod No.");

    font.setPixelSize(40);
    font.setBold(true);
    qp->setFont(font);
    qp->drawText(QRect(750,39,272,54), Qt::AlignCenter, "001");

    //Draw Status: OK,NG

    pen.setColor("#FFCC99");
    pen.setWidth(2);
    qp->setPen(pen);
    font.setPixelSize(40);
    qp->setFont(font);
    qp->drawRoundedRect(QRect(750,94, 272,54), 5,5);
    pen.setColor("#FFEC8B");
    qp->setPen(pen);
    int threshold=50;
    int inputValue;
    int countOK =0;
    int countNG =0;
    int countTotal =9;
    inputValue =qrand()%30+30;
    for(int i=0; i<countTotal;i++)
    {
        if(inputValue>threshold)
        {
            qp->fillRect(QRect(751,95,270,52),QColor("red"));
            qp->drawText(QRect(751,95,270,52), Qt::AlignCenter, "NG");
            countNG++;
        }
        else {
            qp->fillRect(QRect(751,95,270,52),QColor("Green"));
            qp->drawText(QRect(751,95,270,52), Qt::AlignCenter, "OK");
            countOK ++;
        }
        //countTotal = countNG+countOK;
    }

    //Draw ratio OK/NG
    pen.setColor("#788287");
    qp->setPen(pen);
    qp->fillRect(QRect(750,150,274,147),QColor("#d0d0d0") );

    pen.setColor("#000000");
    pen.setWidth(2);
    qp->setPen(pen);
    qp->drawRoundedRect(QRect(750,151,274,37),0,0);
    qp->drawRoundedRect(QRect(750,188,137,73),0,0);
    qp->drawRoundedRect(QRect(887,188,137,73),0,0);
    qp->drawRoundedRect(QRect(750,261,274,37),0,0);

    pen.setColor("#000099");
    font.setPixelSize(15);
    font.setBold(false);
    qp->setPen(pen);
    qp->setFont(font);
    qp->drawText(QRect(751,151,100,37), Qt::AlignCenter, "Total Number");

    pen.setColor("#000000");
    font.setPixelSize(15);
    font.setBold(false);
    qp->setPen(pen);
    qp->setFont(font);

    QString str;
    //str.setNum(countTotal);

    qp->drawText(QRect(924,151,100,37), Qt::AlignCenter, str.setNum(countTotal)+ " Pic");
    qp->drawText(QRect(924,261,100,37), Qt::AlignCenter, str.setNum(countNG)+ "Pic ("+ str.setNum(countNG*100/countTotal)+" %)");
    qp->drawText(QRect(837,188+9,40,37), Qt::AlignRight, str.setNum(countOK)+" Pic");
    qp->drawText(QRect(837,225+9,50,37), Qt::AlignRight, str.setNum(countOK*100/countTotal)+" %");
    qp->drawText(QRect(974,188+9,40,37), Qt::AlignRight, str.setNum(countNG)+" Pic");
    qp->drawText(QRect(974,225+9,50,37), Qt::AlignRight, str.setNum(countNG*100/countTotal)+" %");

    pen.setColor("Green");
    font.setPixelSize(20);
    font.setBold(false);
    qp->setPen(pen);
    qp->setFont(font);
    qp->drawText(QRect(750,188,40,37), Qt::AlignCenter, "OK");

    pen.setColor("red");
    font.setPixelSize(20);
    font.setBold(false);
    qp->setPen(pen);
    qp->setFont(font);
    qp->drawText(QRect(888,188,40,37), Qt::AlignCenter, "NG");
    qp->drawText(QRect(770,261,50,37), Qt::AlignCenter, "* NG");



    pen.setColor("#FFFF99");
    pen.setWidth(2);
    qp->setPen(pen);

}
void XRay::getIsStart(bool _isStart)
{
    isStart = _isStart;
    qDebug() <<isStart ;
    if(isStart)
    {
        timerDrawing->start(1000);
    }
    else {
        timerDrawing->stop();
        this->update();
    }
}
//Draw Images Input
void XRay:: DrawImageInput(QPainter *qp)
{
    qDebug() <<"DrawImageInput: ...."<<isStart ;
    if(isStart){
        QPen pen;
        QFont font;
        pen.setColor("#ccc");
        font.setPixelSize(20);
        int i = qrand()% 9;
        qp->drawPixmap(0,0,750, 450, NG[i]);

        int j=qrand()%5;
        qp->drawPixmap(220, 540,300,100, Spectrum[j]);
    }
}
//Draw Images Output
void XRay:: DrawImageOutput(QPainter *qp)
{

}
void XRay:: LoadImage()
{
    bool bRes =false;

    bRes = NG[0].load(":/Images/NG1.png");
    bRes = NG[1].load(":/Images/NG2.png");
    bRes = NG[2].load(":/Images/NG3.png");
    bRes = NG[3].load(":/Images/NG4.png");
    bRes = NG[4].load(":/Images/NG5.png");
    bRes = NG[5].load(":/Images/NG6.png");
    bRes = NG[6].load(":/Images/NG7.png");
    bRes = NG[7].load(":/Images/NG8.png");
    bRes = NG[8].load(":/Images/NG9.png");

    // Spectrum
    bRes =Spectrum[0].load(":Images/spectrum1.png");
    bRes =Spectrum[1].load(":Images/spectrum2.png");
    bRes =Spectrum[2].load(":Images/spectrum3.png");
    bRes =Spectrum[3].load(":Images/spectrum4.png");
    bRes =Spectrum[4].load(":Images/spectrum5.png");

}
