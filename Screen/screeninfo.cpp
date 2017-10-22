#include "screeninfo.h"

ScreenInfo::ScreenInfo()
{
    mSerial = 0;
    mParam = "";
    mValue = "";
    mScreen = 0;
    mNextScreen = 0;
    mIndex = 0;
    mType = 0;
}
ScreenInfo::ScreenInfo(const int &_mSerial,const QString &_mParam,const QString &_mValue,const int &_mScreen,const int &_mNextScreen,const int &_mIndex,const int &_mType)
{
    mSerial = _mSerial;
    mParam = _mParam;
    mValue = _mValue;
    mScreen = _mScreen;
    mNextScreen = _mNextScreen;
    mIndex = _mIndex;
    mType = _mType;
}
void ScreenInfo::SetSerial(const int &arg){
    mSerial = arg;
}
int ScreenInfo::GetSerial() const {
    return mSerial;
}

void ScreenInfo::SetParameter(const QString &arg){
    mParam = arg;
}
QString ScreenInfo::GetParameter() const {
    return mParam;
}

void ScreenInfo::SetValue(const QString &arg){
    mValue = arg;
}
QString ScreenInfo::GetValue() const {
    return mValue;
}

void ScreenInfo::SetScreen(const int &arg){
    mScreen = arg;
}
int ScreenInfo::GetScreen() const {
    return mScreen;
}


void ScreenInfo::SetNextScreen(const int &arg){
    mNextScreen = arg;
}
int ScreenInfo::GetNextScreen() const {
    return mScreen;
}

void ScreenInfo::SetIndex(const int &arg){
    mIndex = arg;
}
int ScreenInfo::GetIndex() const {
    return mIndex;
}

void ScreenInfo::SetType(const int &arg){
    mType = arg;
}
int ScreenInfo::GetType() const {
    return mType;
}

