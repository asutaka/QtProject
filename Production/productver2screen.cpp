#include "productver2screen.h"
#include "screenmng.h"
ProductVer2Screen::ProductVer2Screen(QQuickItem *parent): QQuickPaintedItem(parent)
{
}

ProductVer2Screen::~ProductVer2Screen()
{

}
QList<QPixmap> ProductVer2Screen::getArrPixmapLineNo()
{
    return m_arrPixmapLineNo;
}

void ProductVer2Screen::setArrPixmapLineNo(QList<QPixmap> &value)
{
    m_arrPixmapLineNo = value;
}

QList<QPixmap> ProductVer2Screen::getArrMassbarBargraph()
{
    return m_arrMassbarBargraph;
}

void ProductVer2Screen::setArrMassbarBargraph(QList<QPixmap> &value)
{
    m_arrMassbarBargraph = value;
}

QList<QPixmap> ProductVer2Screen::getArrStatusLineNo()
{
    return m_arrStatusLineNo;
}

void ProductVer2Screen::setArrStatusLineNo(QList<QPixmap> &value)
{
    m_arrStatusLineNo = value;
}
void ProductVer2Screen::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 1370, AppThemeManager::GetInstance()->theme()->colorBackGround());

    if (!m_IsXbar)
    {
        drawProd(painter);
    }
    else
    {
        drawXBar(painter);
    }
}

void ProductVer2Screen::drawProd(QPainter *qp)
{
    //Draw LineNo
    int space = 31;
    for(int i =0; i< m_LineNo; i++){
        qp->drawPixmap(30,space,m_arrPixmapLineNo[i]);
        space+=110;
    }

    //Draw MassBar Background
    int spaceMass=33;
    for (int i =0; i< m_LineNo; i++){
        qp->drawPixmap(108, spaceMass, m_arrMassbarBargraph[0]);
        spaceMass+=110;
    }
    //set value
    int x;
    int randWidth =1;
    int spaceLineColor = 33;
    int factor=12/m_LineNo;
    int statusImage;

    QPixmap pixmaptmp;
    QPixmap pixStatus;

    //Draw randValue
    pen = AppThemeManager::GetInstance()->theme()->valuePen();
    pen.setWidth(1);
    qp->setPen(pen);
    font.setPixelSize(50);
    font.setFamily("MS Gothic");
    qp->setFont(font);

    for(int i = 0; i < m_LineNo; i++)
    {

        randWidth = rand()%m_arrMassbarBargraph[0].width() +4;
        float randValue= randWidth/4.69;

        if(randValue>=0&&randValue<10){
            statusImage=2;
            x =2;
        }
        else if(randValue>=10&&randValue<15){
            statusImage=4;
            x =4;
        }
        else if(randValue>=15&&randValue<20){
            statusImage=5;
            x =4;
        }
        else if(randValue>=20&&randValue<30){
            statusImage=3;
            x = 4;
        }
        else if(randValue>=80&&randValue<100){
            statusImage=1;
            x = 3;
        }
        else
        {
            statusImage=0;
            x = 1;// pass, not display
        }

        if(i < m_LineNo)
        {
            // draw Line Color of main content
            QRect rec(0,0,randWidth,m_arrMassbarBargraph[x].height());
            QRect recStt(0,0,m_arrStatusLineNo[statusImage].width(), m_arrStatusLineNo[statusImage].height());

            pixmaptmp = m_arrMassbarBargraph[x].copy(rec);
            pixStatus = m_arrStatusLineNo[statusImage].copy(recStt);
            if(factor==1)
            {
                qp->drawPixmap((108 ),spaceLineColor,  pixmaptmp);
                qp->drawPixmap(600,spaceLineColor, pixStatus.scaled(44, 44, Qt::KeepAspectRatio));
                qp->drawText(780, spaceLineColor +40, "+"+ m_MeasureValue[i]);

            }
            else
            {
                qp->drawPixmap((108 ), spaceLineColor, pixmaptmp);
                qp->drawPixmap(600,spaceLineColor, pixStatus.scaled(44, 44, Qt::KeepAspectRatio));
                qp->drawText(780, spaceLineColor +40, "+" + m_MeasureValue[i]);
            }

            spaceLineColor += 110*factor;
        }
    }
    //Draw unit of measure
    pen = AppThemeManager::GetInstance()->theme()->labelPen();
    pen.setWidth(1);
    qp->setPen(pen);
    font.setPixelSize(50);
    font.setFamily("MS Gothic");
    qp->setFont(font);
    int spaceTxt =33;
    for (int i= 0; i<m_LineNo; i++ ){

        qp->drawText(935,spaceTxt +40, m_MeasureUnit);
        spaceTxt += 110;

    }
}

void ProductVer2Screen::drawXBar(QPainter *qp)
{
    //Draw LineNo
    int space = 31;
    for(int i =0; i< m_LineNo; i++){
        qp->drawPixmap(30,space,m_arrPixmapLineNo[i]);
        space+=110;
    }

    //Draw randValue
    pen = AppThemeManager::GetInstance()->theme()->valuePen();
    pen.setWidth(1);
    qp->setPen(pen);
    font.setPixelSize(50);
    font.setFamily("MS Gothic");
    qp->setFont(font);
    int spaceLine=33;
    for(int i = 0; i < m_LineNo; i++)
    {
        qp->drawText(780, spaceLine + 40, "+" +m_MeasureValue[i]);/*+QString::number(m_MeasureValueXbar));*/
        spaceLine += 110;
    }
    //Draw unit of measure
        pen = AppThemeManager::GetInstance()->theme()->labelPen();
        pen.setWidth(1);
        qp->setPen(pen);
        font.setPixelSize(50);
        font.setFamily("MS Gothic");
        qp->setFont(font);
        int spaceTxt =33;
        for (int i= 0; i<m_LineNo; i++ ){

            qp->drawText(935,spaceTxt +40, m_MeasureUnit);
            spaceTxt += 110;

        }
}

bool ProductVer2Screen::isXBar()
{
    return m_IsXbar;
}

void ProductVer2Screen::setIsXBar(bool &value)
{
    m_IsXbar = value;
}

QList<QString> ProductVer2Screen::getMeasureValue()
{
    return m_MeasureValue;
}

void ProductVer2Screen::setMeasureValue(QList<QString> &value)
{
    m_MeasureValue = value;
}

QString ProductVer2Screen::getMeasureUnit()
{
    return m_MeasureUnit;
}

void ProductVer2Screen::setMeasureUnit(QString &value)
{
    m_MeasureUnit = value;
}
//qreal MainProductionVer2VM::getMeasureValueXbar()
//{
//    return m_MeasureValueXbar;
//}

//void MainProductionVer2VM::setMeasureValueXbar(qreal &value)
//{
//    m_MeasureValueXbar=value;
//}

QString ProductVer2Screen::getBackGroundColorFromVM()
{
    QPen  pen;
    pen = AppThemeManager::GetInstance()->theme()->colorBackGround();
    pen.color();
    return pen.color().name();
}
void ProductVer2Screen::OnLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMainPage;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMainPage);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
