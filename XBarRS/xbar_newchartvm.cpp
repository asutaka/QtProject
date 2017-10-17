#include "xbar_newchartvm.h"
#include "screenmng.h"
#include <QDebug>
XBar_NewChartVM::XBar_NewChartVM(QObject *parent) : QObject(parent)
{

}
void XBar_NewChartVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMainPage;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMainPage);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
