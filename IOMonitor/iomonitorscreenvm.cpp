#include "iomonitorscreenvm.h"
#include "screenmng.h"
#include "lang.h"
#include "mainwindow.h"

#include <QDebug>

IOMonitorScreenVM::IOMonitorScreenVM()
{

}

QString IOMonitorScreenVM::txtSampCycleTitle()
{
    return m_TxtSampCycleTitle;
}

void IOMonitorScreenVM::setTxtSampCycleTitle(QString &value)
{
    m_TxtSampCycleTitle = value;
}

QString IOMonitorScreenVM::txtSampCycleUnit()
{
    return m_TxtSampCycleUnit;
}

void IOMonitorScreenVM::setTxtSampCycleUnit(QString &value)
{
    m_TxtSampCycleUnit = value;
}

QString IOMonitorScreenVM::txtStart()
{
    return m_TxtStart;
}

void IOMonitorScreenVM::setTxtStart(QString &value)
{
    m_TxtStart = value;
}

QString IOMonitorScreenVM::txtStop()
{
    return m_TxtStop;
}

void IOMonitorScreenVM::setTxtStop(QString &value)
{
    m_TxtStop = value;
}

QString IOMonitorScreenVM::txtTrigerConditionTitle()
{
    return m_TxtTrigerConditionTitle;
}

void IOMonitorScreenVM::setTxtTrigerConditionTitle(QString &value)
{
    m_TxtTrigerConditionTitle = value;
}

QString IOMonitorScreenVM::txtTrigerNoTitle()
{
    return m_TxtTrigerNoTitle;
}

void IOMonitorScreenVM::setTxtTrigerNoTitle(QString &value)
{
    m_TxtTrigerNoTitle = value;
}

QString IOMonitorScreenVM::txtDisplayTitle()
{
    return m_TxtDisplayTitle;
}

void IOMonitorScreenVM::setTxtDisplayTitle(QString &value)
{
    m_TxtDisplayTitle = value;
}

QString IOMonitorScreenVM::txtSMPCYCTitle()
{
    return m_TxtSMPCYCTitle;
}

void IOMonitorScreenVM::setTxtSMPCYCTitle(QString &value)
{
    m_TxtSMPCYCTitle = value;
}



QString IOMonitorScreenVM::txtSignalTypeTitle()
{
    return m_TxtSignalTypeTitle;
}

void IOMonitorScreenVM::setTxtSignalTypeTitle(QString &value)
{
    m_TxtSignalTypeTitle = value;
}

QString IOMonitorScreenVM::txtSignalSelectTitle()
{
    return m_TxtSignalSelectTitle;
}

void IOMonitorScreenVM::setTxtSignalSelectTitle(QString &value)
{
    m_TxtSignalSelectTitle = value;
}

QString IOMonitorScreenVM::txtInputName()
{
    return m_TxtInputName;
}

void IOMonitorScreenVM::setTxtInputName(QString &value)
{
    m_TxtInputName = value;
}

QString IOMonitorScreenVM::txtOutputName()
{
    return m_TxtOutputName;
}

void IOMonitorScreenVM::setTxtOutputName(QString &value)
{
    m_TxtOutputName = value;
}

QString IOMonitorScreenVM::txtInternalName()
{
    return m_TxtInternalName;
}

void IOMonitorScreenVM::setTxtInternalName(QString &value)
{
    m_TxtInternalName = value;
}

QString IOMonitorScreenVM::txtNoneName()
{
    return m_TxtNoneName;
}

void IOMonitorScreenVM::setTxtNoneName(QString &value)
{
    m_TxtNoneName = value;
}

QString IOMonitorScreenVM::txtBtnOKName()
{
    return m_TxtBtnOKName;
}

void IOMonitorScreenVM::setTxtBtnOKName(QString &value)
{
    m_TxtBtnOKName = value;
}

QString IOMonitorScreenVM::txtBtnCancelName()
{
    return m_TxtBtnCancelName;
}

void IOMonitorScreenVM::setTxtBtnCancelName(QString &value)
{
    m_TxtBtnCancelName = value;
}

QStringList IOMonitorScreenVM::listSMPCYC()
{
    return m_ListSMPCYC;
}

void IOMonitorScreenVM::setListSMPCYC(QStringList &value)
{
    m_ListSMPCYC = value;
}

QStringList IOMonitorScreenVM::listDisplay()
{
    return m_ListDisplay;
}

void IOMonitorScreenVM::setListDisplay(QStringList &value)
{
    m_ListDisplay = value;
}

QStringList IOMonitorScreenVM::listTrigerCondition()
{
    return m_ListTrigerCondition;
}

void IOMonitorScreenVM::setListTrigerCondition(QStringList &value)
{
    m_ListTrigerCondition = value;
}

QStringList IOMonitorScreenVM::listTrigerNo()
{
    return m_ListTrigerNo;
}

void IOMonitorScreenVM::setListTrigerNo(QStringList &value)
{
    m_ListTrigerNo = value;
}

QStringList IOMonitorScreenVM::listSignalType()
{
    return m_ListSignalType;
}

void IOMonitorScreenVM::setListSignalType(QStringList &value)
{
    m_ListSignalType = value;
}

void IOMonitorScreenVM::onLoad()
{
    onChangeLanguage();
    ScreenMng* screenMng = ScreenMng::GetInstance();
    screenMng->ChangeStatusBar(ScreenMng::StatusBarId::IOMonitorStatusBar);
    screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarIOMonitor);
}

int IOMonitorScreenVM::onChangeLanguage()
{
    int langCode = (int)MainWindow::GetInstance()->language();
    QString strSampCycleTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_PN_SMPCYC, langCode);
    QString strStart = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_MODE_OPERATE, langCode);
    QString strStop = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_MODE_STOP, langCode);
    QString strSMPCYCTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_PN_SMPCYC, langCode);
    QString strSignalTypeTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_COM_SIGNALKIND, langCode);
    QString strSignalSelectTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_PN_IOMONSELECTSIG, langCode);
    QString strInputName = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_CATE_INPUTSIG,langCode);
    QString strOutputName = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_CATE_OUTPUTSIG, langCode);
    QString strInternalName = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_CATE_INTERNALMACHINESIG, langCode);
    QString strNoneName = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_CATE_PRODWIZARDCONVRANGENONE, langCode);
    QString strBtnOKName = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_OK, langCode);
    QString strBtnCancelName = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_CANCEL, langCode);

#ifdef STUP_DISPLAY_DATA
    QString strSampCycleUnit = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_UNIT_MS, langCode);

    QString strSignalCondition = "信号調整";

    QString strValue = "";
    QStringList strListSMPCYC;
    strValue = "5";
    strListSMPCYC.append(strValue);
    strValue = "10";
    strListSMPCYC.append(strValue);
    strValue = "20";
    strListSMPCYC.append(strValue);
    strValue = "50";
    strListSMPCYC.append(strValue);

    QStringList strListDisplay;
    strValue = "ループa";
    strValue.replace("a", "");
    strListDisplay.append(strValue);
    strValue = "静止";
    strListDisplay.append(strValue);

    QStringList strListTrigerCondition;
    strValue = "Down";
    strListTrigerCondition.append(strValue);
    strValue = "Up";
    strListTrigerCondition.append(strValue);
    strValue = "無しa";
    strValue.replace("a", "");
    strListTrigerCondition.append(strValue);

    QStringList strListTrigerNo;
    strValue = "CH1";
    strListTrigerNo.append(strValue);
    strValue = "CH2";
    strListTrigerNo.append(strValue);
    strValue = "CH3";
    strListTrigerNo.append(strValue);
    strValue = "CH4";
    strListTrigerNo.append(strValue);
    strValue = "CH5";
    strListTrigerNo.append(strValue);
    strValue = "CH6";
    strListTrigerNo.append(strValue);
    strValue = "CH7";
    strListTrigerNo.append(strValue);
    strValue = "CH8";
    strListTrigerNo.append(strValue);
    strValue = "CH9";
    strListTrigerNo.append(strValue);
    strValue = "CH10";
    strListTrigerNo.append(strValue);
    strValue = "CH11";
    strListTrigerNo.append(strValue);
    strValue = "CH12";
    strListTrigerNo.append(strValue);
    strValue = "CH13";
    strListTrigerNo.append(strValue);
    strValue = "CH14";
    strListTrigerNo.append(strValue);

    QStringList strListSignalType;
    strValue = "実信号";
    strListSignalType.append(strValue);
    strValue = "予測信号";
    strListSignalType.append(strValue);
#endif

    setTxtSampCycleTitle(strSampCycleTitle);
    setTxtSampCycleUnit(strSampCycleUnit);
    setTxtStart(strStart);
    setTxtStop(strStop);
    setTxtSMPCYCTitle(strSMPCYCTitle);
    setTxtSignalTypeTitle(strSignalTypeTitle);
    setListSMPCYC(strListSMPCYC);
    setListDisplay(strListDisplay);
    setListTrigerCondition(strListTrigerCondition);
    setListTrigerNo(strListTrigerNo);
    setListSignalType(strListSignalType);
    setTxtSignalSelectTitle(strSignalSelectTitle);
    setTxtInputName(strInputName);
    setTxtOutputName(strOutputName);
    setTxtInternalName(strInternalName);
    setTxtNoneName(strNoneName);
    setTxtBtnOKName(strBtnOKName);
    setTxtBtnCancelName(strBtnCancelName);
    return 0;
}
