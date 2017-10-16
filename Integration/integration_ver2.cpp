#include "integration_ver2.h"
#include <QPainter>
#include <QDebug>
#include <QDateTime>

Integration_ver2::Integration_ver2(QQuickItem *parent)
    : DrawControlBase_ver4(parent)
{
    LoadImages();
}

Integration_ver2::~Integration_ver2()
{

}

void Integration_ver2::paint(QPainter *painter)
{
    DrawControlBase_ver4::paint(painter);
    DrawMainContent(painter);
}

void Integration_ver2::DrawContent()
{
    update();
}

void Integration_ver2::DrawMainContent(QPainter *qp)
{
    int text;
    text = rand()% 6000 + 1000;
    QBrush brush(QColor(28,35,45));
    qp->fillRect(0, 145, 1024, 285, brush);
    qp->setPen(QColor(255,255,255));
    qp->drawText(10,215, "+1.000");
    qp->drawText(18,280, " 6.000");
    qp->drawText(18,345, "-1.000");

    //QString string = @"各個";
    qp->drawText(3,455, "a(g)");
    qp->drawText(3,485, "a(g)");
    qp->drawText(3,515, "+OK(p)");
    qp->drawText(3,545, "+NG(p)");
    qp->drawText(3,575, "-NG(p)");
    qp->drawText(3,605, "EXNG(p)");
    qp->drawText(3,635, "EXNG2(p)");

    // draw line no
    int space = 155;
    for(int i = 0; i < 10; i++)
    {
        qp->drawPixmap(space,380,arrayPixmapLineNo[i]);
        space += 90;
    }

    //draw line main content
    QPen TextColor1((QColor(164,164,164)),1);
    qp->setPen(TextColor1);
    qp->drawLine(110,165,110,375);
    qp->drawLine(110,375,1020,375);
    QPen TextColor2((QColor(46,46,46)),1,Qt::DashLine);
    qp->setPen(TextColor2);
    qp->drawLine(110,335,1020,335);
    qp->drawLine(110,270,1020,270);
    qp->drawLine(110,205,1020,205);

    QPen LineColor((QColor(132,131,133)),1);
    qp->setPen(LineColor);
    int x1 = 0;
    int y1 = 430;
    int x2 = 1017;
    int y2 = 430;

    for(int i = 0; i < 7; i++)
    {
        qp->drawLine(x1,y1,x2,y2);
        y1 += 30;
        y2 += 30;
    }
    //draw border line com4
    qp->drawLine(725,60,1017,60);
    qp->drawLine(725,60,725,140);
    qp->drawLine(1017,60,1017,140);
    qp->drawLine(725,140,1017,140);

    qp->drawLine(798,60,798,140);
    qp->drawLine(871,60,871,140);
    qp->drawLine(944,60,944,140);

    //draw text main content
    QPen TextColor(QColor(255,217,187),1);
    qp->setPen(TextColor);
    x1 = 130;
    y1 = 455;
    for(int i = 0; i < 7; i++)
    {
        for(int j = 0; j < 11; j++)
        {
            qp->drawText(x1,y1,QString::number(text));
            x1+= 90;
            text += 1000;
        }
        x1 = 130;
        y1 += 30;
    }

    //draw background color of line in com4
    space = 729;
    for(int i =0; i< 40; i++)
    {
        qp->drawPixmap(space, 76, com4backImg);
        space += 7;
        if((i+1) % 10 ==0 && i != 0)
        {
            space += 3;
        }
    }

    //draw line image of main content, status line, line image of com4
    space = 150;
    for(int i =0; i< 10; i++)
    {
        qp->drawPixmap(space, 165, com4lineImg);
        space += 90;
    }

    space = 115;
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
            qp->drawPixmap(space,165,arrayLineImage[x].GetStatusLine());
            space += 90;

            //draw Line Color of main content
            QRect rec(0,0,32,y);
            pixmaptmp = arrayLineImage[x].GetBigLineColor().copy(rec);
            qp->drawPixmap(spaceLineColor,(160 + (215 -y)),  pixmaptmp);
            spaceLineColor += 90;
        }
        z = (y *63/209);
        QRect rec1(0,0,3,z);
        // draw Line color of com4
        pixmaptmp = arrayLineImage[x].GetSmallLineColor().copy(rec1);

        qp->drawPixmap(spaceLineColorCom4, 140 - z, pixmaptmp); // 140 = 77 + 63
        spaceLineColorCom4 += 7;
        if( (i + 1) % 10 == 0 && i != 0)
        {
            spaceLineColorCom4 +=3;
        }
    }
}

void Integration_ver2::LoadImages()
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

void Integration_ver2::updateDraw()
{
    this->update();
}

void Integration_ver2::updateTime()
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


QList<int> Integration_ver2::GetLogDrawingTime()
{
    QList<int> aa;
    return aa;
}

int Integration_ver2::GetLoadingTime()
{
    return nLoadTime;
}


void Integration_ver2::showEvent(QShowEvent *)
{
    nLoadTime = startLoadTimer.elapsed();
    //((ToolStart*)myParent)->SetIntegrationLoadTime(nLoadTime);
}
