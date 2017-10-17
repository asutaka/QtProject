#include "menu.h"
#include "mainwindow.h"
#include "screenmng.h"

MenuV1::MenuV1(QObject*parent): QObject(parent)
{
}

QString MenuV1::txtAdjustRegisteredProduct() {
    return m_txtAdjustRegisteredProduct;
}

void MenuV1::setTxtAdjustRegisteredProduct(QString &value) {
    m_txtAdjustRegisteredProduct = value;
}

QString MenuV1::txtControlPanel() {
    return m_txtControlPanel;
}

void MenuV1::setTxtControlPanel(QString &value){
    m_txtControlPanel = value;
}

QString MenuV1::txtDisplayProductList() {
    return m_txtDisplayProductList;
}

void MenuV1::setTxtDisplayProductList(QString &value) {
    m_txtDisplayProductList = value;
}

QString MenuV1::txtHistory() {
    return m_txtHistory;
}

void MenuV1::setTxtHistory(QString &value) {
    m_txtHistory = value;
}

QString MenuV1::txtLanguage() {
    return m_txtLanguage;
}

void MenuV1::setTxtLanguage(QString &value) {
    m_txtLanguage = value;
}

QString MenuV1::txtMaintAndSetting() {
    return m_txtMaintAndSetting;
}

void MenuV1::setTxtMaintAndSetting(QString &value) {
    m_txtMaintAndSetting = value;
}

QString MenuV1::txtOpeCheck() {
    return m_txtOpeCheck;
}

void MenuV1::setTxtOpeCheck(QString &value) {
    m_txtOpeCheck = value;
}

QString MenuV1::txtStatsControl() {
    return m_txtStatsControl;
}

void MenuV1::setTxtStatsControl(QString &value) {
    m_txtStatsControl = value;
}

QString MenuV1::txtRegisterNewProduct() {
    return m_txtRegisterNewProduct;
}

void MenuV1::setTxtRegisterNewProduct(QString &value) {
    m_txtRegisterNewProduct = value;
}

QString MenuV1::txtUsbMemory() {
    return m_txtUsbMemory;
}

void MenuV1::setTxtUsbMemory(QString &value) {
    m_txtUsbMemory = value;
}

int MenuV1::OnLoad() {
    OnChangeLanguage();
    ScreenMng* screenMng = ScreenMng::GetInstance();
    screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
    screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMenu);
    return 0;
}

int MenuV1::OnChangeLanguage(){
    Lang* langInstance = Lang::GetInstance();
    int langCode = (int)MainWindow::GetInstance()->language();
    m_txtAdjustRegisteredProduct = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_ADJPROD,langCode);
    m_txtControlPanel = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_MENU_CTRLPANEL,langCode);
    m_txtDisplayProductList = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_DISPPRODTABLE,langCode);
    m_txtHistory = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_GRP_LOG,langCode);
    m_txtLanguage = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_PAGE_LANGUAGE,langCode);
    m_txtMaintAndSetting = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_MAINTANDSET,langCode);
    m_txtOpeCheck = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COM_OPECHK,langCode);
    m_txtStatsControl = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_MENU_STATS,langCode);
    m_txtRegisterNewProduct = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_SETPROD,langCode);
    m_txtUsbMemory = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_CATE_USBMEMORY,langCode);
    return 0;
}

