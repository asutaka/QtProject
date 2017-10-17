#include "adjusttimingver4_vm.h"
#include <QDir>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include "startwindow.h"
#include "globals.h"
#include "mainwindow.h"
#include "screenmng.h"
#include <AppTheme/themescreen.h>


AdjustTimingVer4_VM::AdjustTimingVer4_VM()
{
    onChangeLanguage();
}
AdjustTimingVer4_VM::~AdjustTimingVer4_VM()
{

}

// Property

QString AdjustTimingVer4_VM::txtProdName ()
{
    return m_TxtProdName;
}

void AdjustTimingVer4_VM::setTxtProdName(QString &value)
{
    m_TxtProdName=value;
}

QString AdjustTimingVer4_VM::txtSample ()
{
    return m_TxtSample;
}

void AdjustTimingVer4_VM::setTxtSample(QString &value)
{
    m_TxtSample  = value;
}

QString AdjustTimingVer4_VM::txtWeight()
{
    return m_TxtWeight;
}

void AdjustTimingVer4_VM::setTxtWeight(QString &value)
{
    m_TxtWeight=value;
}

QString AdjustTimingVer4_VM::txtRefValue()
{
    return m_TxtRefValue;
}

void AdjustTimingVer4_VM::setTxtRefValue(QString &value)
{
    m_TxtRefValue=value;
}

QString AdjustTimingVer4_VM:: txtProdLen()
{
    return m_TxtProdLen;
}

void AdjustTimingVer4_VM::setTxtProdLen(QString &value)
{
    m_TxtProdLen=value;
}

QString AdjustTimingVer4_VM:: txtT1()
{
    return m_TxtT1;
}

void AdjustTimingVer4_VM::setTxtT1(QString &value)
{
    m_TxtT1=value;
}

QString AdjustTimingVer4_VM:: txtT2()
{
    return m_TxtT2;
}

void AdjustTimingVer4_VM::setTxtT2(QString &value)
{
    m_TxtT2=value;
}
QString AdjustTimingVer4_VM:: txtT3()
{
    return m_TxtT3;
}

void AdjustTimingVer4_VM::setTxtT3(QString &value)
{
    m_TxtT3=value;
}
QString AdjustTimingVer4_VM:: txtT4()
{
    return m_TxtT4;
}

void AdjustTimingVer4_VM::setTxtT4(QString &value)
{
    m_TxtT4=value;
}
QString AdjustTimingVer4_VM:: txtT7()
{
    return m_TxtT7;
}

void AdjustTimingVer4_VM::setTxtT7(QString &value)
{
    m_TxtT7=value;
}
QString AdjustTimingVer4_VM:: txtT9()
{
    return m_TxtT9;
}

void AdjustTimingVer4_VM::setTxtT9(QString &value)
{
    m_TxtT9=value;
}
QString  AdjustTimingVer4_VM::txtFilterTime()
{
    return m_TxtFilterTime;
}

void AdjustTimingVer4_VM::setTxtFilterTime(QString &value)
{
    m_TxtFilterTime=value;
}

QString AdjustTimingVer4_VM::txtUnitY()
{
    return m_TxtUnitY;
}

void AdjustTimingVer4_VM::setTxtUnitY(QString &value)
{
    m_TxtUnitY= value;
}

QString AdjustTimingVer4_VM:: txtUnitT()
{
    return m_TxtUnitT;
}

void AdjustTimingVer4_VM::setTxtUnitT(QString &value)
{
    m_TxtUnitT= value;
}
QString AdjustTimingVer4_VM:: txtUnitG()
{
    return m_TxtUnitG;
}

void AdjustTimingVer4_VM::setTxtUnitG(QString &value)
{
    m_TxtUnitG= value;
}

QString AdjustTimingVer4_VM::txtUnitMS ()
{
    return m_TxtUnitMS;
}

void AdjustTimingVer4_VM::setTxtUnitMS(QString &value)
{
    m_TxtUnitMS=value;
}
QString AdjustTimingVer4_VM::txtUnitMM ()
{
    return m_TxtUnitMM;
}

void AdjustTimingVer4_VM::setTxtUnitMM(QString &value)
{
    m_TxtUnitMM=value;
}

QString AdjustTimingVer4_VM::txtUnitDIV ()
{
    return m_TxtUnitDIV;
}

void AdjustTimingVer4_VM::setTxtUnitDIV(QString &value)
{
    m_TxtUnitDIV= value;
}
// get/set value

qreal AdjustTimingVer4_VM::valueProdNo()
{
    return m_ValueProdNo;
}

void AdjustTimingVer4_VM::setValueProdNo(qreal &value)
{
    m_ValueProdNo= value;
}
qreal AdjustTimingVer4_VM::valueRefVal()
{
    return m_ValueRefValue;
}

void AdjustTimingVer4_VM::setValueRefVal(qreal &value)
{
    m_ValueRefValue= value;
}

qreal AdjustTimingVer4_VM::valueProdLen()
{
    return m_ValueProdLen;
}

void AdjustTimingVer4_VM::setValueProdLen(qreal &value)
{
    m_ValueProdLen = value;
}

qreal AdjustTimingVer4_VM::valueT1()
{
    return m_ValueT1;
}

void AdjustTimingVer4_VM::setValueT1(qreal &value)
{
    m_ValueT1= value;
}

qreal AdjustTimingVer4_VM::valueT2()
{
    return m_ValueT2;
}

void AdjustTimingVer4_VM::setValueT2(qreal &value)
{
    m_ValueT2= value;
}
qreal AdjustTimingVer4_VM::valueT3()
{
    return m_ValueT3;

}

void AdjustTimingVer4_VM::setValueT3(qreal &value)
{
    m_ValueT3= value;
}

qreal AdjustTimingVer4_VM::valueT4()
{
    return m_ValueT4;

}
void AdjustTimingVer4_VM::setValueT4(qreal &value)
{
    m_ValueT4= value;
}

qreal AdjustTimingVer4_VM::valueT7()
{
    return m_ValueT7;

}

void AdjustTimingVer4_VM::setValueT7(qreal &value)
{
    m_ValueT7= value;
}

qreal AdjustTimingVer4_VM::valueT9()
{
    return m_ValueT9;
}

void AdjustTimingVer4_VM::setValueT9(qreal &value)
{
    m_ValueT7= value;
}

qreal AdjustTimingVer4_VM::valueWeight()
{
    return m_ValueWeight;
}

void AdjustTimingVer4_VM::setValueWeight(qreal &value)
{
    m_ValueWeight= value;
}

qreal AdjustTimingVer4_VM::valueT()
{
    return m_ValueUnitT;
}

void AdjustTimingVer4_VM::setValueT(qreal &value)
{
    m_ValueUnitT = value;
}

qreal AdjustTimingVer4_VM::valueY()
{
    return m_ValueUnitY;
}

void AdjustTimingVer4_VM::setValueY(qreal &value)
{
    m_ValueUnitT = value;
}
qreal AdjustTimingVer4_VM::valueFilterTime()
{
    return m_ValueFilterTime;
}

void AdjustTimingVer4_VM::setValueFilterTime(qreal &value)
{
    m_ValueFilterTime= value;
}
QList <int> AdjustTimingVer4_VM::genDataWeight()
{
    QList<int> listValue;
    for (int i = 0; i < 144; i++)
    {
        int j= 3+ qrand()% 3;
        listValue.append(j);

    }
    return listValue;
}

QString AdjustTimingVer4_VM::getBackGColor()
{
    //    QPen  pen;
    //    pen = AppThemeManager::GetInstance()->theme()->colorBackGround();
    //    pen.color();
    //    return pen.color().name();
    return "transparent";
}

QString AdjustTimingVer4_VM::getTextColor()
{
    QPen  pen;
    pen = AppThemeManager::GetInstance()->theme()->labelPen();
    pen.color();
    return pen.color().name();
}

QString AdjustTimingVer4_VM::getLineColor()
{
    QPen pen;
    pen=AppThemeManager::GetInstance()->theme()->linePen();
    return pen.color().name();

}
QString AdjustTimingVer4_VM::getValueColor()
{
    //    QPen pen;
    //    pen =AppThemeManager::GetInstance()->theme()->valuePen();
    //    return pen.color().name();
    return "#95B3D7";
}

QString AdjustTimingVer4_VM::getWeightValueColor() {
    return "#FFD9BB";
}

void AdjustTimingVer4_VM::OnLoad() {
    ScreenMng* screenMng = ScreenMng::GetInstance();
    qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarAdjustTiming;
    screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarAdjustTiming);
    screenMng->ChangeStatusBar(ScreenMng::StatusBarId::AdjustTimingStatusBar);
}


void AdjustTimingVer4_VM::onChangeLanguage()
{
    Lang* langInstance = Lang::GetInstance();
    int langCode = (int)MainWindow::GetInstance()->language();
    m_TxtProdName = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COM_PROD,langCode);
    m_TxtSample = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COM_SAMPLE,langCode);
    m_TxtRefValue = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_PN_REFVAL,langCode);
    m_TxtProdLen = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_PN_WORKLENGTH,langCode);
    m_TxtFilterTime = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_PN_FILTERTIMESTD,langCode);
    m_TxtWeight = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COM_WEIGHT,langCode);

    m_TxtT1 ="T1";
    m_TxtT2 ="T2";
    m_TxtT3 ="T3";
    m_TxtT4 ="T4";
    m_TxtT7 ="T7";
    m_TxtT9 ="T9";
    m_TxtUnitY ="y";
    m_TxtUnitT ="t";
    m_TxtUnitG ="g";
    m_TxtUnitMS ="ms";
    m_TxtUnitMM ="mm";
    m_TxtUnitDIV ="div";

    m_ValueProdNo = 60;
    m_ValueRefValue= 6;
    m_ValueProdLen =160;
    m_ValueT1 = 2;
    m_ValueT2 = 2;
    m_ValueT3 = 2;
    m_ValueT4 = 2;
    m_ValueT7 = 2;
    m_ValueFilterTime =600;

    m_ValueWeight  = 3.25;
    m_ValueUnitY  = 20.00;
    m_ValueUnitT  =100;

}
