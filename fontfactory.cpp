#include "fontfactory.h"
#include <QDebug>

FontFactory* FontFactory::instance = 0;
FontFactory::FontFactory()
{
}

FontFactory* FontFactory::GetInstance(){
    if (!instance) {
        instance = new FontFactory();
    }
    return instance;
}

QString FontFactory::getFontFamily(FontStyleId fontStyleID) {
    return getFontStyle(fontStyleID).family();
}

int FontFactory::getFontSize(FontStyleId fontStyleID) {
    return getFontStyle(fontStyleID).pixelSize();
}

int FontFactory::getFont(QString fontNameFile) {
    if (!mListFont.contains(fontNameFile)) {
        int id = fontDb.addApplicationFont("qrc:/Fonts/" + fontNameFile + ".ttf");
        if (id != -1) {
            mListFont.insert(fontNameFile,id);
        } else {
            return id;
        }
    }
    return mListFont[fontNameFile];
}

QFont FontFactory::getFontStyle(FontStyleId fontStyleID)
{
    if (!mListFontStyle.contains(fontStyleID)) {
        QFont tmp;
        if (fontStyleID == FontStyleId::FNT_L1
                && fontStyleID == FontStyleId::FNT_L2
                && fontStyleID == FontStyleId::FNT_L3
                && fontStyleID == FontStyleId::FNT_M1
                && fontStyleID == FontStyleId::FNT_M2
                && fontStyleID == FontStyleId::FNT_M3
                && fontStyleID == FontStyleId::FNT_S1
                && fontStyleID == FontStyleId::FNT_S2
                && fontStyleID == FontStyleId::FNT_S3) {
            int id = getFont("NotoSans-Regular");
            if (id != -1) {
                tmp.setFamily(fontDb.applicationFontFamilies(id).at(0));
            } else {
                //set default font
                tmp.setStyleHint(tmp.System);
            }
        }
        switch(fontStyleID) {
            case FontStyleId::FNT_XL1:
                tmp.setPixelSize(38);
                break;
            case FontStyleId::FNT_XL2:
                tmp.setPixelSize(39);
                break;
            case FontStyleId::FNT_XL3:
                tmp.setPixelSize(40);
                break;
            case FontStyleId::FNT_L1:
                tmp.setPixelSize(21);
                break;
            case FontStyleId::FNT_L2:
                tmp.setPixelSize(23);
                break;
            case FontStyleId::FNT_L3:
                tmp.setPixelSize(25);
                break;
            case FontStyleId::FNT_M1:
                tmp.setPixelSize(13);
                break;
            case FontStyleId::FNT_M2:
                tmp.setPixelSize(14);
                break;
            case FontStyleId::FNT_M3:
                tmp.setPixelSize(15);
                break;
            case FontStyleId::FNT_M4:
                tmp.setPixelSize(16);
                break;
            case FontStyleId::FNT_M5:
                tmp.setPixelSize(17);
                break;
            case FontStyleId::FNT_M6:
                tmp.setPixelSize(18);
                break;
            case FontStyleId::FNT_M7:
                tmp.setPixelSize(19);
                break;
            case FontStyleId::FNT_M8:
                tmp.setPixelSize(20);
                break;
            case FontStyleId::FNT_S1:
                tmp.setPixelSize(8);
                break;
            case FontStyleId::FNT_S2:
                tmp.setPixelSize(9);
                break;
            case FontStyleId::FNT_S3:
            default:
                tmp.setPixelSize(10);
                break;
        }

        mListFontStyle[fontStyleID] = tmp;
    }

    return mListFontStyle[fontStyleID];
}
