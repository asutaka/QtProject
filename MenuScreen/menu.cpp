#include "menu.h"
#include "QDebug"
#include <QDir>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include "startwindow.h"
#include "globals.h"
#include "mainwindow.h"
#include "screenmng.h"

Menu::Menu(QObject*parent): QObject(parent)
{
}

QString Menu::txtAdjustRegisteredProduct() {
    return m_txtAdjustRegisteredProduct;
}

void Menu::setTxtAdjustRegisteredProduct(QString &value) {
    m_txtAdjustRegisteredProduct = value;
}

QString Menu::txtControlPanel() {
    return m_txtControlPanel;
}

void Menu::setTxtControlPanel(QString &value){
    m_txtControlPanel = value;
}

QString Menu::txtDisplayProductList() {
    return m_txtDisplayProductList;
}

void Menu::setTxtDisplayProductList(QString &value) {
    m_txtDisplayProductList = value;
}

QString Menu::txtHistory() {
    return m_txtHistory;
}

void Menu::setTxtHistory(QString &value) {
    m_txtHistory = value;
}

QString Menu::txtLanguage() {
    return m_txtLanguage;
}

void Menu::setTxtLanguage(QString &value) {
    m_txtLanguage = value;
}

QString Menu::txtMaintAndSetting() {
    return m_txtMaintAndSetting;
}

void Menu::setTxtMaintAndSetting(QString &value) {
    m_txtMaintAndSetting = value;
}

QString Menu::txtOpeCheck() {
    return m_txtOpeCheck;
}

void Menu::setTxtOpeCheck(QString &value) {
    m_txtOpeCheck = value;
}

QString Menu::txtStatsControl() {
    return m_txtStatsControl;
}

void Menu::setTxtStatsControl(QString &value) {
    m_txtStatsControl = value;
}

QString Menu::txtRegisterNewProduct() {
    return m_txtRegisterNewProduct;
}

void Menu::setTxtRegisterNewProduct(QString &value) {
    m_txtRegisterNewProduct = value;
}

QString Menu::txtUsbMemory() {
    return m_txtUsbMemory;
}

void Menu::setTxtUsbMemory(QString &value) {
    m_txtUsbMemory = value;
}

int Menu::OnLoad() {
    ScreenMng* screenMng = ScreenMng::GetInstance();
    qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMenu;
    screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMenu);
    return 0;
}

int Menu::OnChangeLanguage(){
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

