#include "integration.h"
#include "integartionvm.h"
#include <QPainter>
#include <QDebug>
#include <QDateTime>

Integration::Integration(QQuickItem *parent)
    : DrawControlBase(parent)
{
    LoadImages();
}

Integration::~Integration()
{

}

void Integration::setName(const QString &name)
{
    m_name = name;
}

void Integration::setColor(const QColor &color)
{
    m_color = color;
}

QString Integration::name() const
{
    return m_name;
}

QColor Integration::color() const
{
    return m_color;
}

void Integration::paint(QPainter *painter)
{
    DrawControlBase::paint(painter);
    DrawMainContent(painter);
}

void Integration::DrawContent()
{
//    update();
}

void Integration::ClearContent()
{
    setColor(QColor(Qt::transparent));
    update();

    emit ContentCleared();
}

void Integration::DrawMainContent(QPainter *qp)
{
    // draw text
    QFont font(":/fonts/MS Gothic.ttf", 20, QFont::Normal);
    font.setPixelSize(26);
    qp->setFont(font);
    int text;
    text = rand()% 6000 + 1000;

    qp->drawText(25,225, "+1.000");
    qp->drawText(25,285, " 6.000");
    qp->drawText(25,345, "-1.000");

    //QString string = @"各個";
    qp->drawText(3,425, "a");
    qp->drawText(3,460, "a");
    qp->drawText(3,495, "+OK");
    qp->drawText(3,530, "+NG");
    qp->drawText(3,565, "-NG");
    qp->drawText(3,600, "EXNG");
    qp->drawText(3,635, "EXNG2");

    qp->drawText(95,425, "g");
    qp->drawText(95,460, "g");
    qp->drawText(95,495, "p");
    qp->drawText(95,530, "p");
    qp->drawText(95,565, "p");
    qp->drawText(95,600, "p");
    qp->drawText(95,635, "p");

    // draw line no
    int space = 130;


    for(int i = 0; i < 10; i++)
    {
        qp->drawPixmap(space,155,arrayPixmapLineNo[i]);
        space += 90;
    }

    //draw line main content
    QPen LineColor((QColor(132,131,133)),1);
    qp->setPen(LineColor);
    int x1 = 124;
    int y1 = 142;//152;
    int x2 = 124;
    int y2 = 637;

    for(int i = 0; i < 11; i++)
    {
        qp->drawLine(x1,y1,x2,y2);
        x1 += 90;
        x2 +=90;
    }

    x1 = 124;
    y1 = 395;
    x2 = 1017;
    y2 = 395;

    for(int i = 0; i < 7; i++)
    {
        qp->drawLine(x1,y1,x2,y2);
        y1 += 35;
        y2 += 35;
    }

    //draw border line com4
    qp->drawLine(725,48,1017,48);
    qp->drawLine(725,48,725,132);
    qp->drawLine(1017,48,1017,132);
    qp->drawLine(725,132,1017,132);

    qp->drawLine(798,48,798,132);
    qp->drawLine(871,48,871,132);
    qp->drawLine(944,48,944,132);

    // draw text main content
    QPen TextColor((QColor(255,153,0)),1);
    qp->setPen(TextColor);
    x1 = 130;
    y1 = 425;
    for(int i = 0; i < 7; i++)
    {
        for(int j = 0; j < 11; j++)
        {
             qp->drawText(x1,y1,QString::number(text));
             x1+= 90;
             text += 1000;
        }
        x1 = 130;
        y1 += 35;
    }

    // draw background color of line in com4
    space = 729;
    for(int i =0; i< 40; i++)
    {
        qp->drawPixmap(space, 60, com4backImg);
        space += 7;
        if((i+1) % 10 ==0 && i != 0)
        {
            space += 3;
        }
    }

    //draw line image of main content, status line, line image of com4
    space = 170;
    for(int i =0; i< 10; i++)
    {
//        qp->drawPixmap(space, 163, com4lineImg);
        space += 90;
    }

    space = 135;
    int x;
    int y =1;
    int z = 1;
    int spaceLineColor = 170;
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
//            qp->drawPixmap(space,185,arrayLineImage[x].GetStatusLine());
            space += 90;

            // draw Line Color of main content
            QRect rec(0,0,32,y);
//            pixmaptmp = arrayLineImage[x].GetBigLineColor().copy(rec);
//            qp->drawPixmap(spaceLineColor,(180 + (215 -y)),  pixmaptmp);
            spaceLineColor += 90;
        }
        z = (y *63/209);
        QRect rec1(0,0,3,z);
        // draw Line color of com4
        pixmaptmp = arrayLineImage[x].GetSmallLineColor().copy(rec1);
        qp->drawPixmap(spaceLineColorCom4, 123 - z, pixmaptmp); // 140 = 77 + 63
        spaceLineColorCom4 += 7;
        if( (i + 1) % 10 == 0 && i != 0)
        {
            spaceLineColorCom4 +=3;
        }
    }
}

void Integration::LoadImages()
{
    bool bRes = false;
    bRes = pixmap.load(":/Images/Icon_Capsule_5.bmp");

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
    bRes = pixmap1.load(":/Images/bargraph_w32_red_.bmp");
    bRes = pixmap2.load(":/Images/bargraph_w3h61_red_.bmp");
    bRes = pixmap3.load(":/Images/Icon_w28h28_mNG.png");
    LineImage arrayElem1(pixmap1, pixmap2, pixmap3);
    arrayLineImage[0] = arrayElem1;
    bRes = pixmap4.load(":/Images/bargraph_w32_Orange_.bmp");
    bRes = pixmap5.load(":/Images/bargraph_w3h61_orange_.bmp");
    bRes = pixmap6.load(":/Images/Icon_w28h28_pNG.png");
    LineImage arrayElem2(pixmap4, pixmap5, pixmap6);
    arrayLineImage[1] = arrayElem2;
    bRes = pixmap7.load(":/Images/bargraph_w32_green_.bmp");
    bRes = pixmap8.load(":/Images/bargraph_w3h61_green_.bmp");
    bRes = pixmap9.load(":/Images/Not_Exist.bmp");
    LineImage arrayElem3(pixmap7, pixmap8, pixmap9);
    arrayLineImage[2] = arrayElem3;

    bRes = com4backImg.load(":/Images/bargraph_w3h61_.bmp");
    bRes = com4lineImg.load(":/Images/bargraph_w32_.bmp");

}

void Integration::updateDraw()
{
//    if(checkUpdate)
//    {
//        this->update();
//    }
}

void Integration::updateTime()
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

void Integration::SetMyParent(QWindow*)
{

}

QList<int> Integration::GetLogDrawingTime()
{
    QList<int> aa;
    return aa;
}

int Integration::GetLoadingTime()
{
    return nLoadTime;
}


void Integration::showEvent(QShowEvent *)
{
    nLoadTime = startLoadTimer.elapsed();
    //((ToolStart*)myParent)->SetIntegrationLoadTime(nLoadTime);
}
