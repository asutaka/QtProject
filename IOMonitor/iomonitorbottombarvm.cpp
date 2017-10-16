#include "iomonitorbottombarvm.h"
#include "mainwindow.h"
#include "lang.h"

IOMonitorBottomBarVM::IOMonitorBottomBarVM()
{
    loadImage();
}

QString IOMonitorBottomBarVM::txtBack()
{
    return m_TxtBack;
}

void IOMonitorBottomBarVM::setTxtBack(QString &value)
{
    m_TxtBack = value;
}

QString IOMonitorBottomBarVM::txtClear()
{
    return m_TxtClear;
}

void IOMonitorBottomBarVM::setTxtClear(QString &value)
{
    m_TxtClear = value;
}

QString IOMonitorBottomBarVM::txtStartImport()
{
    return m_TxtStartImport;
}

void IOMonitorBottomBarVM::setTxtStartImport(QString &value)
{
    m_TxtStartImport = value;
}

QString IOMonitorBottomBarVM::txtStopImport()
{
    return m_TxtStopImport;
}

void IOMonitorBottomBarVM::setTxtStopImport(QString &value)
{
    m_TxtStopImport = value;
}

QString IOMonitorBottomBarVM::txtSignalSelection()
{
    return m_TxtSignalSelection;
}

void IOMonitorBottomBarVM::setTxtSignalSelection(QString &value)
{
    m_TxtSignalSelection = value;
}

QString IOMonitorBottomBarVM::txtSignalCondition()
{
    return m_TxtSignalCondition;
}

void IOMonitorBottomBarVM::setTxtSignalCondition(QString &value)
{
    m_TxtSignalCondition = value;
}

QString IOMonitorBottomBarVM::btnBackSourceBkg()
{
    return m_BtnBackSourceBkg;
}

void IOMonitorBottomBarVM::setBtnBackSourceBkg(QString &value)
{
    m_BtnBackSourceBkg = value;
}

QString IOMonitorBottomBarVM::btnBackSourceActive()
{
    return m_BtnBackSourceActive;
}

void IOMonitorBottomBarVM::setBtnBackSourceActive(QString &value)
{
    m_BtnBackSourceActive = value;
}

QString IOMonitorBottomBarVM::btnBackSourceIcon()
{
    return m_BtnBackSourceIcon;
}

void IOMonitorBottomBarVM::setBtnBackSourceIcon(QString &value)
{
    m_BtnBackSourceIcon = value;
}

QString IOMonitorBottomBarVM::btnSourceBkg()
{
    return m_BtnSourceBkg;
}

void IOMonitorBottomBarVM::setBtnSourceBkg(QString &value)
{
    m_BtnSourceBkg = value;
}

QString IOMonitorBottomBarVM::btnSourceActive()
{
    return m_BtnSourceActive;
}

void IOMonitorBottomBarVM::setBtnSourceActive(QString &value)
{
    m_BtnSourceActive = value;
}

QString IOMonitorBottomBarVM::btnClearSourceIcon()
{
    return m_BtnClearSourceIcon;
}

void IOMonitorBottomBarVM::setBtnClearSourceIcon(QString &value)
{
    m_BtnClearSourceIcon = value;
}

QString IOMonitorBottomBarVM::btnStartImportIcon()
{
    return m_BtnStartImportIcon;
}

void IOMonitorBottomBarVM::setBtnStartImportIcon(QString &value)
{
    m_BtnStartImportIcon = value;
}

QString IOMonitorBottomBarVM::btnStopImportIcon()
{
    return m_BtnStopImportIcon;
}

void IOMonitorBottomBarVM::setBtnStopImportIcon(QString &value)
{
    m_BtnStopImportIcon = value;
}

QString IOMonitorBottomBarVM::btnSignalSelectionIcon()
{
    return m_BtnSignalSelectionIcon;
}

void IOMonitorBottomBarVM::setBtnSignalSelectionIcon(QString &value)
{
    m_BtnSignalSelectionIcon = value;
}

QString IOMonitorBottomBarVM::btnSignalConditionIcon()
{
    return m_BtnSignalConditionIcon;
}

void IOMonitorBottomBarVM::setBtnSignalConditionIcon(QString &value)
{
    m_BtnSignalConditionIcon = value;
}

QFont IOMonitorBottomBarVM::fontText()
{
    return m_FontText;
}

void IOMonitorBottomBarVM::setFontText(QFont &value)
{
    m_FontText = value;
}

QColor IOMonitorBottomBarVM::colorText()
{
    return m_ColorText;
}

void IOMonitorBottomBarVM::setColorText(QColor &value)
{
    m_ColorText = value;
}

void IOMonitorBottomBarVM::loadImage()
{
    QString strBtnBackSourceBkg = "image://MyProvider/contbar_btn_104.png";
    QString strBtnBackSourceActive = "image://MyProvider/contbar_btn_touched_104.png";
    QString strBackSourceIcon = "image://MyProvider/contbar_icon_back.png";
    QString strBtnSourceBkg = "image://MyProvider/contbar_btn_168.png";
    QString strBtnSourceActive = "image://MyProvider/contbar_btn_touched_168.png";
    QString strClearSourceIcon = "image://MyProvider/contbar_icon_clear.png";

    QString strStartImportIcon = "image://MyProvider/contbar_icon_start.png";
    QString strStopImportIcon = "image://MyProvider/contbar_icon_end.png";
    QString strSignalSelectionIcon = "image://MyProvider/contbar_icon_select.png";
    QString strSignalConditionIcon = "image://MyProvider/contbar_icon_input.png";

    setBtnBackSourceBkg(strBtnBackSourceBkg);
    setBtnBackSourceActive(strBtnBackSourceActive);
    setBtnBackSourceIcon(strBackSourceIcon);
    setBtnSourceBkg(strBtnSourceBkg);
    setBtnSourceActive(strBtnSourceActive);
    setBtnClearSourceIcon(strClearSourceIcon);
    setBtnStartImportIcon(strStartImportIcon);
    setBtnStopImportIcon(strStopImportIcon);
    setBtnSignalSelectionIcon(strSignalSelectionIcon);
    setBtnSignalConditionIcon(strSignalConditionIcon);
}

void IOMonitorBottomBarVM::onChangeLanguage()
{
#ifdef STUP_DISPLAY_DATA
    QFont fntText;
    fntText.setFamily("MS Gothic");
    fntText.setPixelSize(27);
    QColor colText;
    colText.setRgb(255, 255, 255);

    QString strSignalCondition = "信号調整";

#endif

    int langCode = (int)MainWindow::GetInstance()->language();
    QString strBack = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_BACK, langCode);
    QString strClear = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_BSC_CLR, langCode);
    QString strStartImport = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_INPUT_START, langCode);
    QString strStopImport = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_INPUT_STOP, langCode);
    QString strSignalSelection = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_PN_IOMONSELECTSIG, langCode);

    setTxtBack(strBack);
    setTxtClear(strClear);
    setTxtStartImport(strStartImport);
    setTxtStopImport(strStopImport);
    setTxtSignalSelection(strSignalSelection);
    setTxtSignalCondition(strSignalCondition);
    setFontText(fntText);
    setColorText(colText);
}
