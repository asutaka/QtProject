#ifndef FONTFACTORY_H
#define FONTFACTORY_H
#include <QFontDatabase>
#include <QMap>

class FontFactory : public QObject
{
    Q_OBJECT
public:
    enum class FontStyleId
    {
        None = 0,
        FNT_S1,
        FNT_S2,
        FNT_S3,
        FNT_M1,
        FNT_M2,
        FNT_M3,
        FNT_M4,
        FNT_M5,
        FNT_M6,
        FNT_M7,
        FNT_M8,
        FNT_L1,
        FNT_L2,
        FNT_L3,
        FNT_XL1,
        FNT_XL2,
        FNT_XL3,
    };
    Q_ENUM(FontStyleId)

private:
    static FontFactory* instance;
    QMap<FontStyleId, QFont> mListFontStyle;
    QFontDatabase fontDb;
    QMap<QString, int> mListFont;

public:
    static FontFactory* GetInstance();
    QFont getFontStyle(FontStyleId fontStyleID);
    int getFont(QString);
    Q_INVOKABLE QString getFontFamily(FontStyleId fontStyleID);
    Q_INVOKABLE int getFontSize(FontStyleId fontStyleID);

private:
    FontFactory();

};

#endif // FONTFACTORY_H
