#include "menubarsubcontrolvm.h"

MenuBarSubControlVM::MenuBarSubControlVM(QObject *parent)
    : QObject(parent) {
    langInstance = Lang::GetInstance();
}

void MenuBarSubControlVM::setTxtAddress1(const QString &arg) {
    m_txtAddress1 = arg;
}

QString MenuBarSubControlVM::txtAddress1() const {
    return m_txtAddress1;
}

void MenuBarSubControlVM::setTxtAddress2(const QString &arg) {
    m_txtAddress2 = arg;
}

QString MenuBarSubControlVM::txtAddress2() const {
    return m_txtAddress2;
}

void MenuBarSubControlVM::setTxtAddress3(const QString &arg) {
    m_txtAddress3 = arg;
}

QString MenuBarSubControlVM::txtAddress3() const {
    return m_txtAddress3;
}

void MenuBarSubControlVM::setTxtAddress4(const QString &arg) {
    m_txtAddress4 = arg;
}

QString MenuBarSubControlVM::txtAddress4() const {
    return m_txtAddress4;
}

void MenuBarSubControlVM::setFontSizeDefault(const float &arg) {
    m_fontSizeDefault = arg;
}

float MenuBarSubControlVM::fontSizeDefault() const {
    return m_fontSizeDefault;
}

void MenuBarSubControlVM::setFontNameDefault(const QString &arg) {
    m_fontNameDefault = arg;
}

QString MenuBarSubControlVM::fontNameDefault() const {
    return m_fontNameDefault;
}

void MenuBarSubControlVM::setFontColorDefault(const QString &arg) {
    m_fontColorDefault = arg;
}

QString MenuBarSubControlVM::fontColorDefault() const {
    return m_fontColorDefault;
}

int MenuBarSubControlVM::onUpdateLang() {
    m_txtAddress1 = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_VIEW_MENU, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtAddress2 = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_ADJPROD, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtAddress3 = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_MENU_SETPROD, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtAddress4 = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_MENU_SETPRODINFO, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_fontNameDefault = "MS Gothic";
    m_fontSizeDefault = 14;
    m_fontColorDefault = "#fff";
    return 0;
}
