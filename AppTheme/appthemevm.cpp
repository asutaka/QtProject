#include "appthemevm.h"
#include "screenmng.h"
#include <QDebug>

AppThemeVM::AppThemeVM(QObject *parent) : QObject(parent)
{

}
void AppThemeVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMainPage;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMainPage);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
