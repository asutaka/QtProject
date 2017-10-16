#include "bottombarparamsettingvm.h"

BottomBarParamSettingVM::BottomBarParamSettingVM() {
    langInstance = Lang::GetInstance();
}

void BottomBarParamSettingVM::setTxtBtnBack(const QString &arg) {
    m_txtBtnBack = arg;
}

QString BottomBarParamSettingVM::txtBtnBack() const {
    return m_txtBtnBack;
}

void BottomBarParamSettingVM::setTxtBtnSwitch(const QString &arg) {
    m_txtBtnSwitch = arg;
}

QString BottomBarParamSettingVM::txtBtnSwitch() const {
    return m_txtBtnSwitch;
}

void BottomBarParamSettingVM::setTxtBtnInfo(const QString &arg) {
    m_txtBtnInfo = arg;
}

QString BottomBarParamSettingVM::txtBtnInfo() const {
    return m_txtBtnInfo;
}

void BottomBarParamSettingVM::setTxtBtnInput(const QString &arg) {
    m_txtBtnInput = arg;
}

QString BottomBarParamSettingVM::txtBtnInput() const {
    return m_txtBtnInput;
}

int BottomBarParamSettingVM::onUpdateLang() {
    m_txtBtnBack = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_BACK, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtBtnSwitch = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_DISPLAY, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtBtnInfo = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_MENU_INFO, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtBtnInput = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_SELECT, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    return 0;
}
