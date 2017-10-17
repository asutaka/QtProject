#include "evalrjvm.h"
#include "screenmng.h"
#include <QDebug>

EvalRJVM::EvalRJVM(QObject *parent) : QObject(parent)
{

}
void EvalRJVM::onLoad(){
  ScreenMng* screenMng = ScreenMng::GetInstance();
  qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarWizard;
  screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarWizard);
  screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
