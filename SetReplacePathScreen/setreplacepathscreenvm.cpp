#include "setreplacepathscreenvm.h"
#include "screenmng.h"
#include <QDebug>

SetReplacePathScreenVM::SetReplacePathScreenVM(QObject *parent) : QObject(parent)
{

}
void SetReplacePathScreenVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMenu;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMenu);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
