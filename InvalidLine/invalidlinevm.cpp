#include "invalidlinevm.h"
#include "screenmng.h"
#include <QDebug>

InvalidLineVM::InvalidLineVM(QObject *parent) : QObject(parent)
{

}
void InvalidLineVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarInvalid;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarInvalid);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
