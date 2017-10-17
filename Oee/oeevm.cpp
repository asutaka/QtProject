#include "oeevm.h"
#include "screenmng.h"
#include <QDebug>

OeeVM::OeeVM(QObject *parent) : QObject(parent)
{

}
void OeeVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMainPage;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMainPage);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
