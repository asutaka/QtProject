#ifndef SCREENINFO_H
#define SCREENINFO_H


class ScreenInfo
{
public:
    ScreenInfo();
    ScreenInfo(const int &_mScreen,const int &_mNextScreen,const int &_mIndex,const int &_mType);
public:
    int mScreen;
    int mNextScreen;
    int mIndex;
    int mType;
};

#endif // SCREENINFO_H
