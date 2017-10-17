#include "testvm.h"
#include "screenmng.h"
#include <QDebug>

TestVM::TestVM(QObject *parent) : QObject(parent)
{

}
void TestVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMenu;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMenu);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
