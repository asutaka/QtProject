#include "screeninfo.h"

ScreenInfo::ScreenInfo()
{
    mScreen = 0;
    mNextScreen = 0;
    mIndex = 0;
    mType = 0;
}
ScreenInfo::ScreenInfo(const int &_mScreen,const int &_mNextScreen,const int &_mIndex,const int &_mType)
{
    mScreen = _mScreen;
    mNextScreen = _mNextScreen;
    mIndex = _mIndex;
    mType = _mType;
}
