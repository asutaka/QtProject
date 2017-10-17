#include "erroralarmvm.h"
#include "screenmng.h"
#include <QDebug>

ErrorAlarmVM::ErrorAlarmVM(QObject *parent) : QObject(parent)
{

}
void ErrorAlarmVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::ErrorStatusBar);
}
