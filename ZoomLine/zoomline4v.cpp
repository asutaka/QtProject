#include "zoomline4v.h"

ZoomLine4V::ZoomLine4V(QQuickItem *parent ):DrawControlBase(parent)
{
    LoadImage();
}
ZoomLine4V::~ZoomLine4V()
{

}
void ZoomLine4V::paint(QPainter *painter)
{
    DrawControlBase::paint(painter);
    DrawMiddleContent(painter);
    DrawBottomContent(painter);
}
void ZoomLine4V::DrawMiddleContent(QPainter *qp)
{
    font.setPixelSize(110);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);

    //draw rect
    pen.setColor(QColor(120,232,254));
    pen.setWidth(1);
    qp->setPen(pen);

    qp->drawRoundedRect(QRect(256, 279, 511, 151), 0, 0);
    qp->fillRect(QRect(257, 280, 510, 150), QColor(102,132,142));

    //draw text
    qp->setFont(font);
    pen.setColor(QColor(255,197,187));
    pen.setWidth(1);
    qp->setPen(pen);

    qp->drawText(QPoint(307 +(330- strWeight.length())/2,395),strWeight);

    font.setPixelSize(20);
    qp->setFont(font);
    qp->drawText(QPoint(535 +(330- strWeight.length())/2,425),strWeight);

    font.setPixelSize(50);
    qp->setFont(font);
    pen.setColor(QColor(255,255,255));
    qp->setPen(pen);

    qp->drawText(QPoint(715,395)," g");
    font.setPixelSize(20);
    qp->setFont(font);
    qp->drawText(QPoint(745,425)," g");
    //draw Massbar & Eval
    int weight = strWeight.toInt();
    int widthGraph= 0;

    qp->drawPixmap(136,195,arrMassbarBargraph[0]);
    if(weight== 0){
        widthGraph = 0;
        qp->drawPixmap(835,315,arrEval[2]);
    }
    else {
        widthGraph =(arrMassbarBargraph[0].width())*weight/100;
        QRect rect(0, 0, widthGraph, arrMassbarBargraph[0].height());
        if((weight >= 35)&&(weight<=70)){
            //OK
            qp->drawPixmap(835,295,arrEval[0]);
            qp->drawPixmap(136,195,arrMassbarBargraph[1].copy(rect));
        }
        else if(weight < 35){
            //-NG
            qp->drawPixmap(835,295,arrEval[2]);
            qp->drawPixmap(136,195,arrMassbarBargraph[3].copy(rect));
        }
        else{
            //+NG
            qp->drawPixmap(835,295,arrEval[1]);
            qp->drawPixmap(136,195,arrMassbarBargraph[2].copy(rect));
        }
    }
    //Draw Button
    qp->drawPixmap(252,235,arrButton[14]);
    qp->drawPixmap(252,183,arrButton[15]);
    qp->drawPixmap(762,183,arrButton[15]);

    qp->drawPixmap(259,282,arrButton[7]);

    //Draw Text
    pen.setColor(Qt::white);
    pen.setWidth(1);
    qp->setPen(pen);
    font.setPixelSize(20);
    qp->setFont(font);

    qp->drawText(QPoint(540,425),"Average Value");
}
// Draw Bottom Content
void ZoomLine4V:: DrawBottomContent(QPainter *qp)
{
    // draw line no
    int space = 41;
    int factor = 12/lineNo;

    space = 41*factor;


    for(int i = 0; i < lineNo; i++)
    {
        if(i == numSelect)
        {
            qp->drawPixmap(space,472,arrPixmapLineNoON[i]);
        }
        else
        {
            qp->drawPixmap(space,472,arrPixmapLineNo[i]);
        }

        space += 84*factor;
    }
    //Draw Dotted Line
    pen.setColor(QColor(132,131,133));
    pen.setWidth(1);
    pen.setStyle(Qt::DotLine);
    qp->setPen(pen);

    qp->drawLine(9,530,1015,530);
    qp->drawLine(9,610,1015,610);

    //draw border line & BarGraph
    int xSet=0;
    pen.setColor(QColor(120,232,254));
    pen.setStyle(Qt::SolidLine);
    qp->setPen(pen);

    qp->drawLine(9,500,1017,500);
    qp->drawLine(9,630,1017,630);
    for(int i=0;i<=lineNo;i++)
    {
        //Line
        qp->drawLine(9+xSet,500,9+xSet,630);
        //BarGraph
        if(factor==1)
        {
            qp->drawPixmap(30+xSet +9,510,arrBarGrap[0]);
        }
        else
        {
            qp->drawPixmap(30+xSet+9,510,arrBarGrap[0]);
        }
        //Icon Ave
        qp->drawPixmap(64*factor+xSet,627,pixmapAve);
        xSet+=84*factor;
    }
    //set value
    space = 135;
    int x;
    int y =1;
    int spaceLineColor = 0;
    QPixmap pixmaptmp;
    for(int i = 0; i < lineNo; i++)
    {
        x = rand()%15 ;
        if( x% 3 ==0 )
        {
            x = 1;
        }
        else if(x % 2 == 0)
        {
            x =2;
        }
        else
        {
            x = 3;
        }
        y = rand()%arrBarGrap[x].height() +4;
        if(i==numSelect)
        {
            //strWeight=rand()*(arrBarGrap[0].height() -y)*70/arrBarGrap[0].height();
            //strWeight=rand()*(arrBarGrap[0].height() -y)*70;
        }
        if(i < lineNo)
        {
            // draw Line Color of main content
            QRect rec(0,0,arrBarGrap[x].width(), y);
            pixmaptmp = arrBarGrap[x].copy(rec);
            if(factor==1)
            {
                qp->drawPixmap(30+spaceLineColor+9,(510 + (arrBarGrap[0].height() -y)),  pixmaptmp);
            }
            else
            {
                qp->drawPixmap(30+spaceLineColor+9,(510 + (arrBarGrap[0].height() -y)),  pixmaptmp);
            }

            spaceLineColor += 84*factor;
        }
    }
}
// Load Images
void ZoomLine4V::LoadImage()
{
    bool bRes=false;

    //LineNo
    bRes = arrPixmapLineNo[0].load(":/Images/Number_w21h27_01.png");
    bRes = arrPixmapLineNo[1].load(":/Images/Number_w21h27_02.png");
    bRes = arrPixmapLineNo[2].load(":/Images/Number_w21h27_03.png");
    bRes = arrPixmapLineNo[3].load(":/Images/Number_w21h27_04.png");
    bRes = arrPixmapLineNo[4].load(":/Images/Number_w21h27_05.png");
    bRes = arrPixmapLineNo[5].load(":/Images/Number_w21h27_06.png");
    bRes = arrPixmapLineNo[6].load(":/Images/Number_w21h27_07.png");
    bRes = arrPixmapLineNo[7].load(":/Images/Number_w21h27_08.png");
    bRes = arrPixmapLineNo[8].load(":/Images/Number_w21h27_09.png");
    bRes = arrPixmapLineNo[9].load(":/Images/Number_w21h27_10.png");
    bRes = arrPixmapLineNo[10].load(":/Images/Number_w21h27_11.png");
    bRes = arrPixmapLineNo[11].load(":/Images/Number_w21h27_12.png");
    //LineNoOn
    bRes = arrPixmapLineNoON[0].load(":/Images/Number_w21h27_01_On.png");
    bRes = arrPixmapLineNoON[1].load(":/Images/Number_w21h27_02_On.png");
    bRes = arrPixmapLineNoON[2].load(":/Images/Number_w21h27_03_On.png");
    bRes = arrPixmapLineNoON[3].load(":/Images/Number_w21h27_04_On.png");
    bRes = arrPixmapLineNoON[4].load(":/Images/Number_w21h27_05_On.png");
    bRes = arrPixmapLineNoON[5].load(":/Images/Number_w21h27_06_On.png");
    bRes = arrPixmapLineNoON[6].load(":/Images/Number_w21h27_07_On.png");
    bRes = arrPixmapLineNoON[7].load(":/Images/Number_w21h27_08_On.png");
    bRes = arrPixmapLineNoON[8].load(":/Images/Number_w21h27_09_On.png");
    bRes = arrPixmapLineNoON[9].load(":/Images/Number_w21h27_10_On.png");
    bRes = arrPixmapLineNoON[10].load(":/Images/Number_w21h27_11_On.png");
    bRes = arrPixmapLineNoON[11].load(":/Images/Number_w21h27_12_On.png");

    //MassBarGraph
    bRes = arrMassbarBargraph[0].load(":/Images/MassBar.png");
    bRes = arrMassbarBargraph[1].load(":/Images/MassBar_OK.png");
    bRes = arrMassbarBargraph[2].load(":/Images/MassBar_PNG.png");
    bRes = arrMassbarBargraph[3].load(":/Images/MassBar_MNG.png");

    //Eval
    bRes = arrEval[0].load(":/Images/cw_eval_pass.png");
    bRes = arrEval[1].load(":/Images/cw_eval_plusng.png");
    bRes = arrEval[2].load(":/Images/cw_eval_minus.png");
    //BarGraph
    bRes = arrBarGrap[0].load(":/Images/bargraph_w24_2.bmp");
    bRes = arrBarGrap[1].load(":/Images/bargraph_w24_green_2.bmp");
    bRes = arrBarGrap[2].load(":/Images/bargraph_w24_Orange_2.bmp");
    bRes = arrBarGrap[3].load(":/Images/bargraph_w24_red_2.bmp");

    //LineNo Button
    bRes = arrLineNoButton[0].load(":/Images/LineChange_No1.png");
    bRes = arrLineNoButton[1].load(":/Images/LineChange_No2.png");
    bRes = arrLineNoButton[2].load(":/Images/LineChange_No3.png");
    bRes = arrLineNoButton[3].load(":/Images/LineChange_No4.png");
    bRes = arrLineNoButton[4].load(":/Images/LineChange_No5.png");
    bRes = arrLineNoButton[5].load(":/Images/LineChange_No6.png");
    bRes = arrLineNoButton[6].load(":/Images/LineChange_No7.png");
    bRes = arrLineNoButton[7].load(":/Images/LineChange_No8.png");
    bRes = arrLineNoButton[8].load(":/Images/LineChange_No9.png");
    bRes = arrLineNoButton[9].load(":/Images/LineChange_No10.png");
    bRes = arrLineNoButton[10].load(":/Images/LineChange_No11.png");
    bRes = arrLineNoButton[11].load(":/Images/LineChange_No12.png");
    //Button
    bRes = arrButton[0].load(":/Images/capsulecw_Linechg_Left_OFF_79_48.png");
    bRes = arrButton[1].load(":/Images/capsulecw_Linechg_Left_ON_79_48.png");
    bRes = arrButton[2].load(":/Images/capsulecw_Linechg_right_OFF_79_48.png");
    bRes = arrButton[3].load(":/Images/capsulecw_Linechg_right_ON_79_48.png");
    bRes = arrButton[4].load(":/Images/Key_Zeroset_w86h40.png");
    bRes = arrButton[5].load(":/Images/Key_Zeroset_w86h40_p.png");
    bRes = arrButton[6].load(":/Images/zeroset_discrmark.png");
    bRes = arrButton[7].load(":/Images/zeroset_discrmark_allways.png");
    bRes = arrButton[8].load(":/Images/zeroset_off_92_54.png");
    bRes = arrButton[9].load(":/Images/zeroset_on_92_54.png");
    bRes = arrButton[10].load(":/Images/operation_start_on.png");
    bRes = arrButton[11].load(":/Images/operation_stop_off_01.png");
    bRes = arrButton[12].load(":/Images/operation_stop_on.png");
    bRes = arrButton[13].load(":/Images/operation_stop_on_01.png");
    bRes = arrButton[14].load(":/Images/Integration_Average_01.png");
    bRes = arrButton[15].load(":/Images/Integration_CW_Bar_Limit.png");
    //Other
    bRes = pixmapAve.load(":/Images/Icon_Ave_w5h7.png");

}

