#include "iomonitorstatusbarvm.h"
#include "lang.h"
#include "mainwindow.h"

IOMonitorStatusBarVM::IOMonitorStatusBarVM(QObject *parent)
{

}

QString IOMonitorStatusBarVM::txtTrigerConditionTitle()
{
    return m_TxtTrigerConditionTitle;
}

void IOMonitorStatusBarVM::setTxtTrigerConditionTitle(QString &value)
{
    m_TxtTrigerConditionTitle = value;
}

QString IOMonitorStatusBarVM::txtTrigerNoTitle()
{
    return m_TxtTrigerNoTitle;
}

void IOMonitorStatusBarVM::setTxtTrigerNoTitle(QString &value)
{
    m_TxtTrigerNoTitle = value;
}

QString IOMonitorStatusBarVM::txtDisplayTitle()
{
    return m_TxtDisplayTitle;
}

void IOMonitorStatusBarVM::setTxtDisplayTitle(QString &value)
{
    m_TxtDisplayTitle = value;
}

QString IOMonitorStatusBarVM::txtSignalTypeTitle()
{
    return m_TxtSignalTypeTitle;
}

void IOMonitorStatusBarVM::setTxtSignalTypeTitle(QString &value)
{
    m_TxtSignalTypeTitle = value;
}

QString IOMonitorStatusBarVM::txtScreenName2()
{
    return m_TxtScreenName2;
}

void IOMonitorStatusBarVM::setTxtScreenName2(QString &value)
{
    m_TxtScreenName2 = value;
}

QString IOMonitorStatusBarVM::txtScreenName()
{
    return m_TxtScreenName;
}

void IOMonitorStatusBarVM::setTxtScreenName(QString &value)
{
    m_TxtScreenName = value;
}

QString IOMonitorStatusBarVM::txtStart()
{
    return m_TxtStart;
}

void IOMonitorStatusBarVM::setTxtStart(QString &value)
{
    m_TxtStart = value;
}

QString IOMonitorStatusBarVM::txtStop()
{
    return m_TxtStop;
}

void IOMonitorStatusBarVM::setTxtStop(QString &value)
{
    m_TxtStop = value;
}

void IOMonitorStatusBarVM::onLoad()
{
    onChangeLanguage();
}

QString IOMonitorStatusBarVM::valueDisplay() {
    return m_ValueDisplay;
}

void IOMonitorStatusBarVM::setValueDisplay(QString &value) {
    m_ValueDisplay = value;
}

QString IOMonitorStatusBarVM::valueTrigerCondition(){
    return m_ValueTrigerCondition;
}

void IOMonitorStatusBarVM::setValueTrigerCondition(QString &value){
    m_ValueTrigerCondition = value;
}

QString IOMonitorStatusBarVM::valueTrigerNo(){
    return m_ValueTrigerNo;
}

void IOMonitorStatusBarVM::setValueTrigerNo(QString &value){
    m_ValueTrigerNo = value;
}

QString IOMonitorStatusBarVM::valueSignalType(){
    return m_ValueSignalType;
}

void IOMonitorStatusBarVM::setValueSignalType(QString &value){
    m_ValueSignalType = value;
}

int IOMonitorStatusBarVM::onChangeLanguage() {
    Lang* langInstance = Lang::GetInstance();
    int langCode = (int)MainWindow::GetInstance()->language();
    QString strDisplayTitle = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_PN_TRIGGERDISP, langCode);
    QString strTrigerConditionTitle = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_PN_TRIGGERCOND, langCode);
    QString strTrigerNoTitle = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_PN_TRIGGERNO, langCode);
    QString strSignalTypeTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_COM_SIGNALKIND, langCode);
    QString strScreenName = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_VIEW_CCP_EXINPULSE, langCode);
    QString strStart = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_MODE_OPERATE, langCode);
    QString strStop = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_MODE_STOP, langCode);

#ifdef STUP_DISPLAY_DATA
    QString strScreenName2 = "(信号取込中)";
    QString valueDisplay = "ループa";
    valueDisplay.replace("a", "");
    QString valueTrigerCondition = "Down";
    QString valueTrigerNo = "CH1";
    QString valueSignalType = "実信号";

#endif
    setTxtDisplayTitle(strDisplayTitle);
    setTxtTrigerConditionTitle(strTrigerConditionTitle);
    setTxtTrigerNoTitle(strTrigerNoTitle);
    setTxtSignalTypeTitle(strSignalTypeTitle);
    setTxtScreenName(strScreenName);
    setTxtScreenName2(strScreenName2);
    setTxtStart(strStart);
    setTxtStop(strStop);
    setValueDisplay(valueDisplay);
    setValueTrigerCondition(valueTrigerCondition);
    setValueTrigerNo(valueTrigerNo);
    setValueSignalType(valueSignalType);
    return 0;
}
