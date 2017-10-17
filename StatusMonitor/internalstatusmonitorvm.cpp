#include "internalstatusmonitorvm.h"
#include "screenmng.h"
#include <QDebug>

InternalStatusMonitorVM::InternalStatusMonitorVM(QObject *parent) : QObject(parent)
{

}
void InternalStatusMonitorVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarInternalStatusMonitor;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarInternalStatusMonitor);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
