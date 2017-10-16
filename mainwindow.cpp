#include "mainwindow.h"
#include "globals.h"
#include "screenmng.h"
#include "AppTheme/appthememanager.h"

MainWindow *MainWindow::mainWindow = 0;

MainWindow* MainWindow::GetInstance(){
    if (!mainWindow) {
        mainWindow = new MainWindow();
    }
    return mainWindow;
}

MainWindow::MainWindow()
{
    langCode = (EnumControl::LangCode)globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt();
    statusMachine = EnumControl::StatusMachine::STATUS_STOP;
    connect(this, SIGNAL(guiEvent(int)), this, SLOT(OnGuiEvent(int)));
}

EnumControl::LangCode MainWindow::language() {
    return langCode;
}

void MainWindow::setLanguage(EnumControl::LangCode lang) {
    langCode = lang;
    globals::settingsApp->setValue(LANGUAGE_ID_TAG,(int)langCode);
    AppThemeManager::GetInstance()->UpdateTheme();
}

EnumControl::StatusMachine MainWindow::getStatusMachine(){
    return statusMachine;
}

void MainWindow::setStatusMachine(EnumControl::StatusMachine value) {
    statusMachine = value;
}

void MainWindow::InnerChangeScreen(int id) {
    qDebug() << "InnerChangeScreen id: " << id;
    ScreenMng* screenMng = ScreenMng::GetInstance();
    screenMng->ChangeScreen((ScreenMng::ScreenId)id);
}

void MainWindow::GoBackScreen() {
    qDebug() << "GoBackScreen";
    ScreenMng* screenMng = ScreenMng::GetInstance();
    screenMng->TrackBackScreen(1);
}

void MainWindow::OnGuiEvent(int eventId) {
    switch ((EnumControl::EventId)eventId) {
    case EnumControl::EventId::START:
        statusMachine = EnumControl::StatusMachine::STATUS_START;
        break;
    case EnumControl::EventId::STOP:
        statusMachine = EnumControl::StatusMachine::STATUS_STOP;
        break;
    default:
        break;
    }
}
