#include "xray_qimage.h"
#include "QTimer"
#include "QPen"
#include "QFont"
#include "QPropertyAnimation"
#include "QWidget"

XRay_qimage::XRay_qimage(QQuickItem *parent):QQuickPaintedItem(parent)
{
    LoadImage();
    isStart =false;
    _mImage = QImage(_WIDTH_SCREEN, _HEIGHT_SCREEN, QImage::Format_ARGB32);
    _mImage.fill(qRgba(0,0,0,0));
    _mPainter = new QPainter(&_mImage);

    timerDrawing = new QTimer(this);
    connect(timerDrawing, SIGNAL(timeout()), this, SLOT(updateDraw()));

}
XRay_qimage::~XRay_qimage()
{
    delete timerDrawing;
    //timerDrawing = NULL;
}
void XRay_qimage::paint(QPainter *painter)
{
    DrawPanelContentResult();
    DrawImageInput();
    DrawImageOutput();
    painter->drawImage(this->boundingRect(), _mImage);
}
void XRay_qimage::updateDraw()
{
    this->update();
}
void XRay_qimage::DrawPanelContentResult()
{
    QPen pen;
    QFont font;
    //Draw Back Ground
    _mPainter->drawRoundedRect(QRect(750,38,274,257),5,5);
    _mPainter->fillRect(QRect(750,38,274,257), QColor(90,100,105));

    //Draw Button ProductNo
    pen.setColor("#FFCC99");
    pen.setWidth(2);
    _mPainter->setPen(pen);
    _mPainter->drawRoundedRect(QRect(750,39,272,54), 5,5);

    pen.setColor("#00CD66");
    font.setPixelSize(15);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);

    _mPainter->setPen(pen);
    _mPainter->setFont(font);
    _mPainter->drawText(755,55,"Prod No.");

    font.setPixelSize(40);
    font.setBold(true);
    _mPainter->setFont(font);
    _mPainter->drawText(QRect(750,39,272,54), Qt::AlignCenter, "001");

    //Draw Status: OK,NG

    pen.setColor("#FFCC99");
    pen.setWidth(2);
    _mPainter->setPen(pen);
    font.setPixelSize(40);
    _mPainter->setFont(font);
    _mPainter->drawRoundedRect(QRect(750,94, 272,54), 5,5);
    pen.setColor("#FFEC8B");
    _mPainter->setPen(pen);
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
            _mPainter->fillRect(QRect(751,95,270,52),QColor("red"));
            _mPainter->drawText(QRect(751,95,270,52), Qt::AlignCenter, "NG");
            countNG++;
        }
        else {
            _mPainter->fillRect(QRect(751,95,270,52),QColor("Green"));
            _mPainter->drawText(QRect(751,95,270,52), Qt::AlignCenter, "OK");
            countOK ++;
        }
        //countTotal = countNG+countOK;
    }

    //Draw ratio OK/NG
    pen.setColor("#788287");
    _mPainter->setPen(pen);
    _mPainter->fillRect(QRect(750,150,274,147),QColor("#d0d0d0") );

    pen.setColor("#000000");
    pen.setWidth(2);
    _mPainter->setPen(pen);
    _mPainter->drawRoundedRect(QRect(750,151,274,37),0,0);
    _mPainter->drawRoundedRect(QRect(750,188,137,73),0,0);
    _mPainter->drawRoundedRect(QRect(887,188,137,73),0,0);
    _mPainter->drawRoundedRect(QRect(750,261,274,37),0,0);

    pen.setColor("#000099");
    font.setPixelSize(15);
    font.setBold(false);
    _mPainter->setPen(pen);
    _mPainter->setFont(font);
    _mPainter->drawText(QRect(751,151,100,37), Qt::AlignCenter, "Total Number");

    pen.setColor("#000000");
    font.setPixelSize(15);
    font.setBold(false);
    _mPainter->setPen(pen);
    _mPainter->setFont(font);

    QString str;
    //str.setNum(countTotal);

    _mPainter->drawText(QRect(924,151,100,37), Qt::AlignCenter, str.setNum(countTotal)+ " Pic");
    _mPainter->drawText(QRect(924,261,100,37), Qt::AlignCenter, str.setNum(countNG)+ "Pic ("+ str.setNum(countNG*100/countTotal)+" %)");
    _mPainter->drawText(QRect(837,188+9,40,37), Qt::AlignRight, str.setNum(countOK)+" Pic");
    _mPainter->drawText(QRect(837,225+9,50,37), Qt::AlignRight, str.setNum(countOK*100/countTotal)+" %");
    _mPainter->drawText(QRect(974,188+9,40,37), Qt::AlignRight, str.setNum(countNG)+" Pic");
    _mPainter->drawText(QRect(974,225+9,50,37), Qt::AlignRight, str.setNum(countNG*100/countTotal)+" %");

    pen.setColor("Green");
    font.setPixelSize(20);
    font.setBold(false);
    _mPainter->setPen(pen);
    _mPainter->setFont(font);
    _mPainter->drawText(QRect(750,188,40,37), Qt::AlignCenter, "OK");

    pen.setColor("red");
    font.setPixelSize(20);
    font.setBold(false);
    _mPainter->setPen(pen);
    _mPainter->setFont(font);
    _mPainter->drawText(QRect(888,188,40,37), Qt::AlignCenter, "NG");
    _mPainter->drawText(QRect(770,261,50,37), Qt::AlignCenter, "* NG");

    pen.setColor("#FFFF99");
    pen.setWidth(2);
    _mPainter->setPen(pen);

}
void XRay_qimage::getIsStart(bool _isStart)
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
void XRay_qimage:: DrawImageInput()
{/*
    if(isStart){
        int i = rand()% 9;
        _mPainter->drawPixmap(150,25,450, 400, NG[i]);
        qDebug() <<"DrawImageInput: ...."<<isStart<<"image No: "<<i ;
        QPushButton *button = new QPushButton(d, this);
            button->show();

            QPropertyAnimation *mAnimation = new QPropertyAnimation(myWidget, "geometry");
            mAnimation->setDuration(10000);
            mAnimation->setStartValue(QRect(0, 0, 100, 30));
            mAnimation->setEndValue(QRect(250, 250, 100, 30));

            mAnimation->start(QAbstractAnimation::DeleteWhenStopped);
    }*/

}
//Draw Images Output
void XRay_qimage:: DrawImageOutput()
{/*
    if(isStart)
    {
        int j=qrand()%5;
        _mPainter->drawPixmap(220, 540,300,100, Spectrum[j]);
        qDebug() <<"Image Output: ...."<<isStart<< "image: "<<j ;
    }*/
}

void XRay_qimage::LoadImage()
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
