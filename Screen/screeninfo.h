#ifndef SCREENINFO_H
#define SCREENINFO_H
#include <QString>


class ScreenInfo
{
public:
    ScreenInfo();
    ScreenInfo(const int &_mSerial,const QString &_mParam,const QString &_mValue,const int &_mScreen,const int &_mNextScreen,const int &_mIndex,const int &_mType);
private:
    int mSerial;
    QString mParam;
    QString mValue;
    int mScreen;
    int mNextScreen;
    int mIndex;
    int mType;
public:
    void SetSerial(const int &arg);
    int GetSerial() const;

    void SetParameter(const QString &arg);
    QString GetParameter() const;

    void SetValue(const QString &arg);
    QString GetValue() const;

    void SetScreen(const int &arg);
    int GetScreen() const;

    void SetNextScreen(const int &arg);
    int GetNextScreen() const;

    void SetIndex(const int &arg);
    int GetIndex() const;

    void SetType(const int &arg);
    int GetType() const;
};

#endif // SCREENINFO_H
