#include "bottombariomonitorvm.h"
#include "mainwindow.h"
#include "lang.h"

BottomBarIOMonitorVM::BottomBarIOMonitorVM(QObject *parent)
{

}

QString BottomBarIOMonitorVM::txtClear()
{
    return m_TxtClear;
}

void BottomBarIOMonitorVM::setTxtClear(QString &value)
{
    m_TxtClear = value;
}

QString BottomBarIOMonitorVM::txtStartImport()
{
    return m_TxtStartImport;
}

void BottomBarIOMonitorVM::setTxtStartImport(QString &value)
{
    m_TxtStartImport = value;
}

QString BottomBarIOMonitorVM::txtStopImport()
{
    return m_TxtStopImport;
}

void BottomBarIOMonitorVM::setTxtStopImport(QString &value)
{
    m_TxtStopImport = value;
}

QString BottomBarIOMonitorVM::txtSignalSelection()
{
    return m_TxtSignalSelection;
}

void BottomBarIOMonitorVM::setTxtSignalSelection(QString &value)
{
    m_TxtSignalSelection = value;
}

QString BottomBarIOMonitorVM::txtSignalCondition()
{
    return m_TxtSignalCondition;
}

void BottomBarIOMonitorVM::setTxtSignalCondition(QString &value)
{
    m_TxtSignalCondition = value;
}

QString BottomBarIOMonitorVM::txtBack()
{
    return m_TxtBack;
}

void BottomBarIOMonitorVM::setTxtBack(QString &value)
{
    m_TxtBack = value;
}

void BottomBarIOMonitorVM::onLoad()
{
    onChangeLanguage();
}

int BottomBarIOMonitorVM::onChangeLanguage() {
    Lang* langInstance = Lang::GetInstance();
    int langCode = (int)MainWindow::GetInstance()->language();
    QString strClear = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_BSC_CLR, langCode);
    QString strStartImport = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_INPUT_START,langCode);
    QString strStopImport = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_INPUT_STOP, langCode);
    QString strSignalSelection = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_PN_IOMONSELECTSIG, langCode);
    QString strBack = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_BACK, langCode);
#ifdef STUP_DISPLAY_DATA
    QString strSignalCondition = "信号調整";
#endif
    setTxtClear(strClear);
    setTxtStartImport(strStartImport);
    setTxtStopImport(strStopImport);
    setTxtSignalSelection(strSignalSelection);
    setTxtSignalCondition(strSignalCondition);
    setTxtBack(strBack);
    return 0;
}
