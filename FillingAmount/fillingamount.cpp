#include "fillingamount.h"

FillingAmount::FillingAmount(QQuickItem *parent)
    : DrawControlBase(parent)
{
    LoadImages();
}

FillingAmount::~FillingAmount()
{

}
void FillingAmount::paint(QPainter *painter)
{
    DrawControlBase::paint(painter);
    DrawMainContent(painter);
}
void FillingAmount::DrawMainContent(QPainter *qp)
{
    int z = 0;
    int weight = 0;
    int weightTemp =0;
    float scale = float(469/(float(upperValue)));

    QFont font(":/fonts/MS Gothic.ttf", 20, QFont::Normal);
    font.setPixelSize(20);
    qp->setFont(font);
    pen.setColor(QColor(255,255,255));
    qp->setPen(pen);
    qp->drawText(220,590, "g");
    qp->drawText(220,625, "g");
    qp->drawPixmap(45,575,upper_AvgAlm);
    qp->drawPixmap(45,610,lower_AvgAlm);

    //draw line main content
    QPen LineColor((QColor(132,131,133)),1);
    qp->setPen(LineColor);
    int x1 = 0;
    int y1 = 180;
    int x2 = 1024;
    int y2 = 180;
    int lineNumber = 1;
    z = rand() % (upperValue- lowerValue);
    weight = z+ lowerValue ;
    z = int(((float(z))*scale));
    QRect rec1(0,12,z,23);
    QRect rec(0,12,469,23);
    for(int i = 0; i < 12; i++)
    {
        pen.setColor(QColor(255,255,255));
        qp->setPen(pen);
        qp->drawText(960,y1-10, "g");
        if(weight <= (lowerValue + int(float(upperValue)/float(6)))){
            lineNumber =1;
        }
        else if(weight <= (lowerValue + (int(float(5)*(float(upperValue)/float(6)))))){
            lineNumber =3;
        }
        else{
            lineNumber =2;
        }
        pen.setColor(QColor(132,131,133));
        qp->setPen(pen);
        qp->drawLine(x1,y1,x2,y2);
        qp->drawPixmap(80,y1-33,arrayPixmapLineNo[i]);
        qp->drawPixmap(670,y1-30,arrayLineImage[lineNumber-1].GetStatusLine());
        qp->drawPixmap(228,y1-32,barLimit);
        qp->drawPixmap(540,y1-32,barLimit);
        qp->drawPixmap(613,y1-36,upper_AvgAlm_S);
        qp->drawPixmap(150,y1-35,lower_AvgAlm_S);
        if(isIndiv){
            qp->drawPixmap(150,y1-25,bgLineInDiv.copy(rec));
            if(isRelVal){
                weightTemp = weight -(upperValue- lowerValue)/2;
                if(lineNumber==1){
                    qp->drawPixmap(150,y1-25, arrayLineImage1[lineNumber-1].GetBigLineColor().copy(QRect(0,12,234,23)));
                }
                else if(lineNumber ==2){
                    qp->drawPixmap(384,y1-25, arrayLineImage1[lineNumber-1].GetBigLineColor().copy(QRect(0,12,234,23)));
                }
                else{
                    int widthGraph = int((float(weightTemp))*scale);
                    if(weightTemp <0){
                        qp->drawPixmap(384+widthGraph,y1-25, arrayLineImage1[lineNumber-1].GetBigLineColor().copy(QRect(0,12,0-widthGraph,23)));
                    }
                    else{
                        qp->drawPixmap(384,y1-25, arrayLineImage1[lineNumber-1].GetBigLineColor().copy(QRect(0,12,widthGraph,23)));
                    }
                }
            }
            else{
                qp->drawPixmap(150,y1-25, arrayLineImage1[lineNumber-1].GetBigLineColor().copy(rec1));
            }
        }
        else{
            qp->drawPixmap(150,y1-25,bgLine.copy(rec));
            if(isRelVal){
                weightTemp = weight -(upperValue- lowerValue)/2;
                if(lineNumber==1){
                    qp->drawPixmap(150,y1-25, arrayLineImage[lineNumber-1].GetBigLineColor().copy(QRect(0,12,234,23)));
                }
                else if(lineNumber ==2){
                    qp->drawPixmap(384,y1-25, arrayLineImage[lineNumber-1].GetBigLineColor().copy(QRect(0,12,234,23)));
                }
                else{
                    int widthGraph = int((float(weightTemp))*scale);
                    if(weightTemp <0){
                        qp->drawPixmap(384+widthGraph,y1-25, arrayLineImage[lineNumber-1].GetBigLineColor().copy(QRect(0,12,0-widthGraph,23)));
                    }
                    else{
                        qp->drawPixmap(384,y1-25, arrayLineImage[lineNumber-1].GetBigLineColor().copy(QRect(0,12,widthGraph,23)));
                    }
                }
            }
            else{
                qp->drawPixmap(150,y1-25, arrayLineImage[lineNumber-1].GetBigLineColor().copy(rec1));
            }
        }
        pen.setColor(QColor(255,217,187));
        qp->setPen(pen);
        if(isRelVal){
            qp->drawText(900,y1-10, "+"+QString::number(weightTemp));
        }
        else{
            qp->drawText(900,y1-10, "+"+QString::number(weight));
        }
        y1 += 35;
        y2 +=35;
    }

    //draw rectangle
    pen.setColor(QColor(132,131,133));
    qp->setPen(pen);
}

void FillingAmount::LoadImages()
{
    bool bRes = false;
    bRes = pixmap.load(":/Images/Icon_Capsule_5.bmp");

    bRes = arrayPixmapLineNo[0].load(":/Images/Number_w21h27_01.png");
    bRes = arrayPixmapLineNo[1].load(":/Images/Number_w21h27_02.png");
    bRes = arrayPixmapLineNo[2].load(":/Images/Number_w21h27_03.png");
    bRes = arrayPixmapLineNo[3].load(":/Images/Number_w21h27_04.png");
    bRes = arrayPixmapLineNo[4].load(":/Images/Number_w21h27_05.png");
    bRes = arrayPixmapLineNo[5].load(":/Images/Number_w21h27_06.png");
    bRes = arrayPixmapLineNo[6].load(":/Images/Number_w21h27_07.png");
    bRes = arrayPixmapLineNo[7].load(":/Images/Number_w21h27_08.png");
    bRes = arrayPixmapLineNo[8].load(":/Images/Number_w21h27_09.png");
    bRes = arrayPixmapLineNo[9].load(":/Images/Number_w21h27_10.png");
    bRes = arrayPixmapLineNo[10].load(":/Images/Number_w21h27_11.png");
    bRes = arrayPixmapLineNo[11].load(":/Images/Number_w21h27_12.png");

    QPixmap pixmap1,pixmap2,pixmap3,pixmap4,pixmap5,pixmap6, pixmap7,pixmap8,pixmap9;
    QPixmap pixmap10,pixmap11,pixmap12,pixmap13,pixmap14,pixmap15, pixmap16,pixmap17,pixmap18;

    bRes = pixmap1.load(":/Images/Massbar_bargraph_minusavg.png");
    bRes = pixmap2.load(":/Images/bargraph_w3h61_red_.bmp");
    bRes = pixmap3.load(":/Images/Icon_w28h28_mNG.png");
    LineImage arrayElem1(pixmap1, pixmap2, pixmap3);

    bRes = pixmap10.load(":/Images/Massbar_bargraph_minusng.png");
    bRes = pixmap11.load(":/Images/bargraph_w3h61_red_.bmp");
    bRes = pixmap12.load(":/Images/Icon_w28h28_mNG.png");
    LineImage arrayElem11(pixmap10, pixmap11, pixmap12);

    arrayLineImage[0] = arrayElem1;
    arrayLineImage1[0] = arrayElem11;

    bRes = pixmap4.load(":/Images/Massbar_bargraph_plusavg.png");
    bRes = pixmap5.load(":/Images/bargraph_w3h61_orange_.bmp");
    bRes = pixmap6.load(":/Images/Icon_w28h28_pNG.png");
    LineImage arrayElem2(pixmap4, pixmap5, pixmap6);

    bRes = pixmap13.load(":/Images/Massbar_bargraph_plusng.png");
    bRes = pixmap14.load(":/Images/bargraph_w3h61_orange_.bmp");
    bRes = pixmap15.load(":/Images/Icon_w28h28_pNG.png");
    LineImage arrayElem12(pixmap13, pixmap14, pixmap15);

    arrayLineImage1[1] = arrayElem12;
    arrayLineImage[1] = arrayElem2;

    bRes = pixmap7.load(":/Images/Massbar_bargraph_passavg.png");
    bRes = pixmap8.load(":/Images/bargraph_w3h61_green_.bmp");
    bRes = pixmap9.load(":/Images/cw_eval_pass_w28h28.png");
    LineImage arrayElem3(pixmap7, pixmap8, pixmap9);
    arrayLineImage[2] = arrayElem3;

    bRes = pixmap16.load(":/Images/Massbar_bargraph_pass.png");
    bRes = pixmap17.load(":/Images/bargraph_w3h61_green_.bmp");
    bRes = pixmap18.load(":/Images/cw_eval_pass_w28h28.png");
    LineImage arrayElem13(pixmap16, pixmap17, pixmap18);
    arrayLineImage1[2] = arrayElem13;

    bRes = com4backImg.load(":/Images/bargraph_w3h61_.bmp");
    bRes = com4lineImg.load(":/Images/bargraph_w32_.bmp");

    barLimit.load(":/Images/Integration_CW_Bar_Limit_S.png");
    bgLine.load(":/Images/Massbar_bargraph_avg.png");
    bgLineInDiv.load(":/Images/Massbar_bargraph.png");
    upper_AvgAlm.load(":/Images/Upper_AvgAlm.png");
    upper_AvgAlm_S.load(":/Images/Upper_AvgAlm_S.png");
    lower_AvgAlm.load(":/Images/Lower_AvgAlm.png");
    lower_AvgAlm_S.load(":/Images/Lower_AvgAlm_s.png");

}


