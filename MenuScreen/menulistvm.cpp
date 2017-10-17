#include "menulistvm.h"
#include "screenmng.h"
#include <QDebug>

MenuListVM::MenuListVM(QObject *parent) : QObject(parent)
{

}
void MenuListVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMenuList;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMenuList);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
