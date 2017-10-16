#include "integration_ver3.h"
#include <QPainter>
#include <QDebug>
#include <QDateTime>

Integration_ver3::Integration_ver3(QQuickItem *parent)
    : DrawControlBase_ver5(parent)
{
    LoadImages();
}

Integration_ver3::~Integration_ver3()
{

}

void Integration_ver3::paint(QPainter *painter)
{
    DrawControlBase_ver5::paint(painter);
    DrawMainContent(painter);
}

void Integration_ver3::DrawContent()
{
    update();
}

void Integration_ver3::DrawMainContent(QPainter *qp)
{
    int text;
    text = rand()% 6000 + 1000;
    qp->drawText(15,210, "+1.000");
    qp->drawText(25,285, " 6.000");
    qp->drawText(25,360, "-1.000");
    QPen TextColor2((QColor(46,46,46)),1,Qt::DashLine);
    qp->setPen(TextColor2);
    qp->drawLine(100,355,1000,355);
    qp->drawLine(100,280,1000,280);
    qp->drawLine(100,205,1000,205);

    //QString string = @"各個";
    font.setPixelSize(20);
    qp->setFont(font);
    QPen ColorText(QColor(225,128,0));
    qp->setPen(ColorText);
    qp->drawText(15,405, "a");
    qp->drawText(15,440, "a");
    qp->drawText(15,475, "+OK");
    qp->drawText(15,510, "+NG");
    qp->drawText(15,545, "-NG");
    qp->drawText(15,580, "EXNG");
    qp->drawText(15,615, "EXNG2");

    qp->drawText(85,405, "g");
    qp->drawText(85,440, "g");
    qp->drawText(85,475, "p");
    qp->drawText(85,510, "p");
    qp->drawText(85,545, "p");
    qp->drawText(85,580, "p");
    qp->drawText(85,615, "p");

    // draw line no
    int space = 110;


    for(int i = 0; i < 10; i++)
    {
        qp->drawPixmap(space,153,arrayPixmapLineNo[i]);
        space += 90;
    }

    //draw line main content
    QPen LineColor((QColor(132,131,133)),2);
    qp->setPen(LineColor);
    int x1 = 100;
    int y1 = 160;//152;
    int x2 = 100;
    int y2 = 380;

    for(int i = 0; i < 11; i++)
    {
        qp->drawLine(x1,y1,x2,y2);
        x1 += 90;
        x2 +=90;
    }

    x1 = 10;
    y1 = 415;
    x2 = 1012;
    y2 = 415;

    QPen LineColor1((QColor(132,131,133)),1);
    qp->setPen(LineColor1);
    for(int i = 0; i < 6; i++)
    {
        qp->drawLine(x1,y1,x2,y2);
        y1 += 35;
        y2 += 35;
    }

    // draw text main content
    QPen TextColor((QColor(255,255,255)),1);
    qp->setPen(TextColor);
    x1 = 110;
    y1 = 410;
    for(int i = 0; i < 7; i++)
    {
        for(int j = 0; j < 10; j++)
        {
             qp->drawText(x1,y1,QString::number(text));
             x1+= 90;
             text += 1000;
        }
        x1 = 110;
        y1 += 35;
    }

    space = 110;
    int x;
    int y =1;
    int z = 1;
    int spaceLineColor = 150;
    int spaceLineColorCom4 = 729;
    QPixmap pixmaptmp;
    for(int i = 0; i < 40; i++)
    {
        x = rand()%15 ;
        if( x% 3 ==0 )
        {
            x = 2;
        }
        else if(x % 2 == 0)
        {
            x =0;
        }
        else
        {
            x = 1;
        }
        y = rand()%209 +4;
        if(i < 10)
        {
            // draw status line.
            qp->drawPixmap(space,180,arrayLineImage[x].GetStatusLine());
            space += 90;

            // draw Line Color of main content
            QRect rec(0,0,32,y);
            pixmaptmp = arrayLineImage[x].GetBigLineColor().copy(rec);
            qp->drawPixmap(spaceLineColor,(180 + (200 -y)),  pixmaptmp);
            spaceLineColor += 90;
        }
    }
}

void Integration_ver3::LoadImages()
{
    bool bRes = false;
    //bRes = pixmap.load(":/Images/Icon_Capsule_5.bmp");

    bRes = arrayPixmapLineNo[0].load(":/Images/Number_w24h24_01.png");
    bRes = arrayPixmapLineNo[1].load(":/Images/Number_w24h24_02.png");
    bRes = arrayPixmapLineNo[2].load(":/Images/Number_w24h24_03.png");
    bRes = arrayPixmapLineNo[3].load(":/Images/Number_w24h24_04.png");
    bRes = arrayPixmapLineNo[4].load(":/Images/Number_w24h24_05.png");
    bRes = arrayPixmapLineNo[5].load(":/Images/Number_w24h24_06.png");
    bRes = arrayPixmapLineNo[6].load(":/Images/Number_w24h24_07.png");
    bRes = arrayPixmapLineNo[7].load(":/Images/Number_w24h24_08.png");
    bRes = arrayPixmapLineNo[8].load(":/Images/Number_w24h24_09.png");
    bRes = arrayPixmapLineNo[9].load(":/Images/Number_w24h24_10.png");
    bRes = arrayPixmapLineNo[10].load(":/Images/Number_w24h24_11.png");
    bRes = arrayPixmapLineNo[12].load(":/Images/Number_w24h24_11.png");

    QPixmap pixmap1;
    QPixmap pixmap2;
    QPixmap pixmap3;
    QPixmap pixmap4;
    QPixmap pixmap5;
    QPixmap pixmap6;
    QPixmap pixmap7;
    QPixmap pixmap8;
    QPixmap pixmap9;
    bRes = pixmap1.load(":/Images/bargraph_w32_red.png");
    bRes = pixmap2.load(":/Images/bargraph_w3h61_red_.bmp");
    bRes = pixmap3.load(":/Images/Icon_w28h28_mNG.png");
    LineImage arrayElem1(pixmap1, pixmap2, pixmap3);
    arrayLineImage[0] = arrayElem1;
    bRes = pixmap4.load(":/Images/bargraph_w32_Orange_v2.png");
    bRes = pixmap5.load(":/Images/bargraph_w3h61_orange_.bmp");
    bRes = pixmap6.load(":/Images/Icon_w28h28_pNG.png");
    LineImage arrayElem2(pixmap4, pixmap5, pixmap6);
    arrayLineImage[1] = arrayElem2;
    bRes = pixmap7.load(":/Images/bargraph_w32_green_v2.png");
    bRes = pixmap8.load(":/Images/bargraph_w3h61_green_.bmp");
    bRes = pixmap9.load(":/Images/Not_Exist.bmp");
    LineImage arrayElem3(pixmap7, pixmap8, pixmap9);
    arrayLineImage[2] = arrayElem3;

    bRes = com4backImg.load(":/Images/bargraph_w3h61_.bmp");
    bRes = com4lineImg.load(":/Images/bargraph_w32_.bmp");

}

void Integration_ver3::updateDraw()
{
    this->update();
}

void Integration_ver3::updateTime()
{
    QDate date = QDate::currentDate();
    QTime time = QTime::currentTime();
    QString strYear = QString::number(date.year());
    int month = date.month();
    QString strMonth = QString::number(month);
    if (month < 10)
    {
        strMonth = "0" + strMonth;
    }
    int day = date.day();
    QString strDay = QString::number(day);
    if (day < 10)
    {
        strDay = "0" + strDay;
    }
    int hour = time.hour();
    QString strHour = QString::number(hour);
    if (hour < 10)
    {
        strHour = "0" + strHour;
    }
    int minute = time.minute();
    QString strMinute = QString::number(minute);
    if (minute < 10)
    {
        strMinute = "0" + strMinute;
    }
    QString strDateTime = strYear + "-" + strMonth + "-" + strDay;
    strDateTime += "\n";
    strDateTime += strHour + ":" + strMinute;
}

QList<int> Integration_ver3::GetLogDrawingTime()
{
    QList<int> aa;
    return aa;
}

int Integration_ver3::GetLoadingTime()
{
    return nLoadTime;
}

void Integration_ver3::showEvent(QShowEvent *)
{
    nLoadTime = startLoadTimer.elapsed();
    //((ToolStart*)myParent)->SetIntegrationLoadTime(nLoadTime);
}
