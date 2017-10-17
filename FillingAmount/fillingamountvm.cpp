#include "fillingamountvm.h"
#include "screenmng.h"
#include <QDebug>

FillingAmountVM::FillingAmountVM(QObject *parent) : QObject(parent)
{

}
void FillingAmountVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMainPage;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMainPage);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
