#include "themescreen.h"

ThemeScreen::ThemeScreen(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    LoadImages();
    timerDrawing = new QTimer(this);
    connect(timerDrawing, SIGNAL(timeout()), this, SLOT(updateDraw()));
    timerDrawing->start(300);
}
ThemeScreen ::~ThemeScreen(){}
void ThemeScreen::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 640, AppThemeManager::GetInstance()->theme()->colorBackGround());
    DrawCom1(painter);
    DrawCom2(painter);
    DrawCom3(painter);
    DrawMainContent(painter);
}
void ThemeScreen:: setTheme(int indexTheme){
    AppTheme::Theme theme;
    switch(indexTheme){
    case AppTheme:: AppThemeBlueCerulean: theme = AppTheme:: AppThemeBlueCerulean; break;
    case 2: theme = AppTheme:: AppThemeDark; break;
    case 3: theme = AppTheme:: AppThemeBrownSand; break;
    case 4: theme = AppTheme:: AppThemeBlueNcs; break;
    case 5: theme = AppTheme:: AppThemeHighContrast; break;
    case 6: theme = AppTheme:: AppThemeBlueIcy; break;
    case 7: theme = AppTheme:: AppThemeQt; break;
    default : theme = AppTheme:: AppThemeBlack; break;
    }
    AppThemeManager::GetInstance()->setTheme(theme);
    this->update();
}

int ThemeScreen:: getTheme(){
    return AppThemeManager::GetInstance()->theme()->id();
}

void ThemeScreen :: updateDraw(){
    this->update();
}
void ThemeScreen::DrawMainContent(QPainter *qp)
{
    int upperValue= 100;
    int lowerValue =1;
    bool isRelVal = true;
    bool isIndiv = false;
    int z = 0;
    int weight = 0;
    int weightTemp =0;
    float scale = float(469/(float(upperValue)));

    QFont font(":/fonts/MS Gothic.ttf", 20, QFont::Normal);
    font.setPixelSize(20);
    qp->setFont(font);

    //draw line main content
    QPen LineColor((QColor(132,131,133)),1);
    qp->setPen(LineColor);
    int x1 = 0;
    int y1 = 240;
    int x2 = 1024;
    int y2 = 240;
    int lineNumber = 1;
    z = rand() % (upperValue- lowerValue);
    weight = z+ lowerValue ;
    z = int(((float(z))*scale));
    QRect rec1(0,12,z,23);
    QRect rec(0,12,469,23);
    for(int i = 0; i < 12; i++)
    {
        pen = AppThemeManager::GetInstance()->theme()->labelPen();
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
        pen = AppThemeManager::GetInstance()->theme()->linePen();
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
        pen = AppThemeManager::GetInstance()->theme()->valuePen();
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
}

void ThemeScreen::LoadImages()
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
void ThemeScreen::DrawCom1(QPainter *qp)
{
    pen = AppThemeManager::GetInstance()->theme()->labelPen();
    qp->setPen(pen);
    font.setFamily(":/Images/MS Gothic.ttf");
    font.setPixelSize(20);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);
    qp->setFont(font);

    // draw text
    qp->drawText(15,85,"Prod");
    qp->drawText(15,170,"LotNo name.");
    qp->drawText(195,170,"Anritsu");

    font.setPixelSize(40);
    qp->setFont(font);
    pen = AppThemeManager::GetInstance()->theme()->valuePen();
    qp->setPen(pen);

    qp->drawText(195,115,"001");

    font.setPixelSize(23);
    qp->setFont(font);
    qp->drawText(15,120,"Sample");

    //draw border line com1

    pen = AppThemeManager::GetInstance()->theme()->borderPen();
    qp->setPen(pen);

    qp->drawRoundedRect(QRect(10, 60, 315, 80), 5, 5);
    qp->drawRoundedRect(QRect(10, 145, 315, 45), 5, 5);
}
void ThemeScreen::DrawCom2(QPainter *qp)
{
    pen = AppThemeManager::GetInstance()->theme()->labelPen();
    qp->setPen(pen);
    font.setPixelSize(20);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);
    qp->setFont(font);

    // draw text
    qp->drawText(335,85,"基準値");
    qp->drawText(335,110,"下限値");
    qp->drawText(335,140,"上限値");
    qp->drawText(335,170,"号数");

    qp->drawText(530,85,"g");
    qp->drawText(530,110,"g");
    qp->drawText(530,140,"g");
    pen = AppThemeManager::GetInstance()->theme()->valuePen();
    qp->setPen(pen);

    qp->drawText(430,85,"12.0");
    qp->drawText(430,110,"-5.0");
    qp->drawText(430,140,"5.0");
    qp->drawText(430,170,"000号");

    //draw border line com2
    pen = AppThemeManager::GetInstance()->theme()->borderPen();
    qp->setPen(pen);

    qp->drawRoundedRect(QRect(330, 60, 225, 130), 5, 5);
}
void ThemeScreen::DrawCom3(QPainter *qp)
{
    font.setPixelSize(20);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);
    qp->setFont(font);
    pen = AppThemeManager::GetInstance()->theme()->labelPen();
    qp->setPen(pen);

    // draw text com3_1
    qp->drawText(565,85, "総数");
    qp->drawText(565,110, "OK");
    qp->drawText(565,140, "NG");

    // draw text com3_2
    pen = AppThemeManager::GetInstance()->theme()->valuePen();
    qp->setPen(pen);

    int number = rand()% 1000 + 0;
    qp->drawText(655,85, QString::number(number));
    qp->drawText(655,110, QString::number(number));
    qp->drawText(655,140, QString::number(number));

    //draw border line com3
    pen = AppThemeManager::GetInstance()->theme()->borderPen();
    qp->setPen(pen);

    qp->drawRoundedRect(QRect(560, 60, 160, 130), 5, 5);
}


