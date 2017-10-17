#include "zoomlinevm.h"
#include "screenmng.h"
#include <QDebug>
ZoomLineVM::ZoomLineVM(QObject *parent) : QObject(parent)
{

}
void ZoomLineVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMainPage;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMainPage);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
