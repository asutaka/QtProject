#include "mainproductionver2vm.h"
#include <AppTheme/themescreen.h>
#include <QDir>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include "startwindow.h"
#include "globals.h"
#include "mainwindow.h"

MainProductionVer2VM::MainProductionVer2VM()
{
    LoadImage();
}
MainProductionVer2VM::~MainProductionVer2VM()
{

}

// Property
QString MainProductionVer2VM::getMeasureValue()
{
    return m_MeasureValue;
}
void MainProductionVer2VM::setMeasureValue(QString &value)
{
    m_MeasureValue=value;
}
QString MainProductionVer2VM::getMeasureUnit()
{
    return m_MeasureUnit;
}
void MainProductionVer2VM::setMeasureUnit(QString &value)
{
    m_MeasureUnit=value;
}
//qreal MainProductionVer2VM:: getMeasureValueXbar()
//{
//    return m_MeasureValueXbar;
//}

//void MainProductionVer2VM::setMeasureValueXbar(qreal &value)
//{
//    m_MeasureValueXbar=value;
//}

QList<QPixmap> MainProductionVer2VM::getArrPixmapLineNo()
{
    return m_arrPixmapLineNo;
}

void MainProductionVer2VM::setArrPixmapLineNo(QList<QPixmap> &value)
{
    m_arrPixmapLineNo=value;
}

QList<QPixmap> MainProductionVer2VM::getArrMassbarBargraph()
{
    return m_arrMassbarBargraph;
}

void MainProductionVer2VM::setArrMassbarBargraph(QList<QPixmap> &value)
{
    m_arrMassbarBargraph = value;
}

QList<QPixmap> MainProductionVer2VM::getArrStatusLineNo()
{
    return m_arrStatusLineNo;
}

void MainProductionVer2VM::setArrStatusLineNo(QList<QPixmap> &value)
{
    m_arrStatusLineNo =value;
}

void MainProductionVer2VM::updateImgtoProduct()
{

}

QColor MainProductionVer2VM::getBackgroundColor()
{
    return m_BackgroundColor;
}

void MainProductionVer2VM::setBackgroundColor(QColor &value)
{
    m_BackgroundColor = value;
}

bool MainProductionVer2VM::isXBar()
{
    return m_IsXbar;
}

void MainProductionVer2VM::setIsXBar(bool &value)
{
    m_IsXbar = value;
}

int MainProductionVer2VM::getInterval()
{
    return m_Interval;
}
//SwitchButton
QString MainProductionVer2VM::txtProd()
{
    return m_txtProd;
}
void MainProductionVer2VM::txtProd(QString &value)
{
    m_txtProd=value;

}

QString MainProductionVer2VM::txtXbar()
{
    return m_txtXbar;
}
void MainProductionVer2VM::txtXbar(QString &value)
{
    m_txtXbar=value;
}

void MainProductionVer2VM::LoadImage()
{
    QPixmap img;

    img.load(":/Images/Number_w48h48_01.png");
    m_arrPixmapLineNo.append(img);
    img.load(":/Images/Number_w48h48_02.png");
    m_arrPixmapLineNo.append(img);
    img.load(":/Images/Number_w48h48_03.png");
    m_arrPixmapLineNo.append(img);
    img.load(":/Images/Number_w48h48_04.png");
    m_arrPixmapLineNo.append(img);
    img.load(":/Images/Number_w48h48_05.png");
    m_arrPixmapLineNo.append(img);
    img.load(":/Images/Number_w48h48_06.png");
    m_arrPixmapLineNo.append(img);
    img.load(":/Images/Number_w48h48_07.png");
    m_arrPixmapLineNo.append(img);
    img.load(":/Images/Number_w48h48_08.png");
    m_arrPixmapLineNo.append(img);
    img.load(":/Images/Number_w48h48_09.png");
    m_arrPixmapLineNo.append(img);
    img.load(":/Images/Number_w48h48_10.png");
    m_arrPixmapLineNo.append(img);
    img.load(":/Images/Number_w48h48_11.png");
    m_arrPixmapLineNo.append(img);
    img.load(":/Images/Number_w48h48_12.png");
    m_arrPixmapLineNo.append(img);

    //MassBarGraph
    img.load(":/Images/Massbar_bargraph_avg.png");
    m_arrMassbarBargraph.append(img);
    img.load(":/Images/Massbar_bargraph_pass.png");
    m_arrMassbarBargraph.append(img);
    img.load(":/Images/Massbar_bargraph_minusng.png");
    m_arrMassbarBargraph.append(img);
    img.load(":/Images/Massbar_bargraph_plusng.png");
    m_arrMassbarBargraph.append(img);

     //StatusLineNoNG
    img.load (""); //(":/Images/cw_eval_pass.png");
    m_arrStatusLineNo.append(img);
    img.load(":/Images/cw_eval_plusng.png");
    m_arrStatusLineNo.append(img);
    img.load(":/Images/cw_eval_minus.png");
    m_arrStatusLineNo.append(img);
    img.load(":/Images/cw_eval_exng2.png");
    m_arrStatusLineNo.append(img);
    img.load(":/Images/cw_eval_md_dblprod.png");
    m_arrStatusLineNo.append(img);
    img.load(":/Images/cw_eval_mdng_en.png");
    m_arrStatusLineNo.append(img);

}

//Method
void MainProductionVer2VM::updateMeasureValue()
{
    qreal randVal = (rand()%4) + (float(rand()%4/5.0));
    //qreal valXbar = (rand()%3) + (float(rand()%4/5.0));
    QString val = QString::number(randVal);
    QString strUnit="g";

    QColor bkgColor = AppThemeManager::GetInstance()->theme()->colorBackGround();
    setMeasureValue(val);
    setBackgroundColor(bkgColor);
    setMeasureUnit(strUnit);
    //setMeasureValueXbar(valXbar);

}

void MainProductionVer2VM::setIndexTheme()
{
    AppTheme::Theme theme;
    switch(indexTheme){
    case 1: theme = AppTheme:: AppThemeBlueCerulean; break;
    case 2: theme = AppTheme:: AppThemeDark; break;
    case 3: theme = AppTheme:: AppThemeBrownSand; break;
    case 4: theme = AppTheme:: AppThemeBlueNcs; break;
    case 5: theme = AppTheme:: AppThemeHighContrast; break;
    case 6: theme = AppTheme:: AppThemeBlueIcy; break;
    case 7: theme = AppTheme:: AppThemeQt; break;
    default : theme = AppTheme:: AppThemeBlack; break;
    }
    AppThemeManager::GetInstance()->setTheme(theme);
}

// Create random array.
QList<int> MainProductionVer2VM::setValueToDraw()
{
    QList<int> listValue;
    for (int i = 0; i < 2500; i++)
    {
        int j= qrand()% 100;
        listValue.append(j);

    }
    return listValue;
}
QList <QString> MainProductionVer2VM::setLineColor()
{
    QString color[12]={"#FF0000","#FFFF00","#008B45","#0000FF","#00BFFF","#FF6A6A","#FF7F24","#CD1076","#FFFFFF","#8B4726","#00FF00","#848385"};
    QList<QString> listColor;
    for(int i=0; i<=11; i++){
        listColor.append(color[i]);
    }
    return listColor;
}

void MainProductionVer2VM::onChangeLanguage()
{
    ProductScreenBaseVM::onChangeLanguage();

    QString refValue = "12.0";
    QString lowLmtValue = "-5.0";
    QString upLmtValue = "5.0";
    QString noValue = "000";
    int valueOK = rand() % 800;
    int valueNG = rand() % 200;
    int valueTotal = valueOK + valueNG;
    QString strValueOK = QString::number(valueOK);
    QString strValueNG = QString::number(valueNG);
    QString strValueTotal = QString::number(valueTotal);

    setTxtRefValue(refValue);
    setTxtLowLmtValue(lowLmtValue);
    setTxtUpLmtValue(upLmtValue);
    setTxtNoValue(noValue);
    setTxtTotalValue(strValueTotal);
    setTxtOKValue(strValueOK);
    setTxtNGValue(strValueNG);

    Lang* langInstance = Lang::GetInstance();
    m_txtProd = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COM_INDIV,globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtXbar = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COM_XBAR,globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
}

