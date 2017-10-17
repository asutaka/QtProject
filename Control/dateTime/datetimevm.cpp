#include "datetimevm.h"
#include "screenmng.h"
#include <QDebug>

DateTimeVM::DateTimeVM(QObject *parent) : QObject(parent)
{

}
void DateTimeVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMenu;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMenu);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
