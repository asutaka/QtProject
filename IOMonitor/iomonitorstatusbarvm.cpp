#include "iomonitorstatusbarvm.h"
#include "mainwindow.h"
#include "lang.h"

IOMonitorStatusBarVM::IOMonitorStatusBarVM()
{

}

QFont IOMonitorStatusBarVM::fontText()
{
    return m_FontText;
}

void IOMonitorStatusBarVM::setFontText(QFont &value)
{
    m_FontText = value;
}

QColor IOMonitorStatusBarVM::colorText()
{
    return m_ColorText;
}

void IOMonitorStatusBarVM::setColorText(QColor &value)
{
    m_ColorText = value;
}

QString IOMonitorStatusBarVM::txtDisplayTitle()
{
    return m_TxtDisplayTitle;
}

void IOMonitorStatusBarVM::setTxtDisplayTitle(QString &value)
{
    m_TxtDisplayTitle = value;
}

QString IOMonitorStatusBarVM::btnSourceBkg()
{
    return m_BtnSourceBkg;
}

void IOMonitorStatusBarVM::setBtnSourceBkg(QString &value)
{
    m_BtnSourceBkg = value;
}

QString IOMonitorStatusBarVM::btnSourceActive()
{
    return m_BtnSourceActive;
}

void IOMonitorStatusBarVM::setBtnSourceActive(QString &value)
{
    m_BtnSourceActive = value;
}

void IOMonitorStatusBarVM::loadImage()
{
    QString strBtnSourceBkg = "image://MyProvider/statbtn_off_120_62.png";
    QString strBtnSourceActive = "image://MyProvider/statbtn_on_120_62.png";

    setBtnSourceBkg(strBtnSourceBkg);
    setBtnSourceActive(strBtnSourceActive);
}

void IOMonitorStatusBarVM::onChangeLanguage()
{
#ifdef STUP_DISPLAY_DATA
    QFont fntText;
    fntText.setFamily("MS Gothic");
    fntText.setPixelSize(25);
    QColor colText;
    colText.setRgb(0, 0, 0);
#endif

    int langCode = (int)MainWindow::GetInstance()->language();
    QString strDisplayTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_PN_TRIGGERDISP, langCode);

    setFontText(fntText);
    setColorText(colText);
    setTxtDisplayTitle(strDisplayTitle);
}
