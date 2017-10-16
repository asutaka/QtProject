#include "productscreenbasevm.h"

ProductScreenBaseVM::ProductScreenBaseVM()
{

}

QString ProductScreenBaseVM::txtProductTitle()
{
    return m_ProductTitle;
}

void ProductScreenBaseVM::setTxtProductTitle(QString &value)
{
    m_ProductTitle = value;
}

QString ProductScreenBaseVM::txtLotNoTitle()
{
    return m_LotNoTitle;
}

void ProductScreenBaseVM::setTxtLotNoTitle(QString &value)
{
    m_LotNoTitle = value;
}

QString ProductScreenBaseVM::txtProductNo()
{
    return m_ProductNo;
}

void ProductScreenBaseVM::setTxtProductNo(QString &value)
{
    m_ProductNo = value;
}

QString ProductScreenBaseVM::txtProductName()
{
    return m_ProductName;
}

void ProductScreenBaseVM::setTxtProductName(QString &value)
{
    m_ProductName = value;
}

QString ProductScreenBaseVM::txtLotNoValue()
{
    return m_LotNoValue;
}

void ProductScreenBaseVM::setTxtLotNoValue(QString &value)
{
    m_LotNoValue = value;
}

QString ProductScreenBaseVM::txtRefTitle()
{
    return m_RefTitle;
}

void ProductScreenBaseVM::setTxtRefTitle(QString &value)
{
    m_RefTitle = value;
}

QString ProductScreenBaseVM::txtLowLmtTitle()
{
    return m_LowLmtTitle;
}

void ProductScreenBaseVM::setTxtLowLmtTitle(QString &value)
{
    m_LowLmtTitle = value;
}

QString ProductScreenBaseVM::txtUpLmtTitle()
{
    return m_UpLmtTitle;
}

void ProductScreenBaseVM::setTxtUpLmtTitle(QString &value)
{
    m_UpLmtTitle = value;
}

QString ProductScreenBaseVM::txtNoTitle()
{
    return m_NoTitle;
}

void ProductScreenBaseVM::setTxtNoTitle(QString &value)
{
    m_NoTitle = value;
}

QString ProductScreenBaseVM::txtRefUnit()
{
    return m_RefUnit;
}

void ProductScreenBaseVM::setTxtRefUnit(QString &value)
{
    m_RefUnit = value;
}

QString ProductScreenBaseVM::txtLowLmtUnit()
{
    return m_LowLmtUnit;
}

void ProductScreenBaseVM::setTxtLowLmtUnit(QString &value)
{
    m_LowLmtUnit = value;
}

QString ProductScreenBaseVM::txtUpLmtUnit()
{
    return m_UpLmtUnit;
}

void ProductScreenBaseVM::setTxtUpLmtUnit(QString &value)
{
    m_UpLmtUnit = value;
}

QString ProductScreenBaseVM::txtNoUnit()
{
    return m_NoUnit;
}

void ProductScreenBaseVM::setTxtNoUnit(QString &value)
{
    m_NoUnit = value;
}

QString ProductScreenBaseVM::txtRefValue()
{
    return m_RefValue;
}

void ProductScreenBaseVM::setTxtRefValue(QString &value)
{
    m_RefValue = value;
}

QString ProductScreenBaseVM::txtLowLmtValue()
{
    return m_LowLmtValue;
}

void ProductScreenBaseVM::setTxtLowLmtValue(QString &value)
{
    m_LowLmtValue = value;
}

QString ProductScreenBaseVM::txtUpLmtValue()
{
    return m_UpLmtValue;
}

void ProductScreenBaseVM::setTxtUpLmtValue(QString &value)
{
    m_UpLmtValue = value;
}

QString ProductScreenBaseVM::txtNoValue()
{
    return m_NoValue;
}

void ProductScreenBaseVM::setTxtNoValue(QString &value)
{
    m_NoValue = value;
}

QString ProductScreenBaseVM::txtTotalTitle()
{
    return m_TotalTitle;
}

void ProductScreenBaseVM::setTxtTotalTitle(QString &value)
{
    m_TotalTitle = value;
}

QString ProductScreenBaseVM::txtOKTitle()
{
    return m_OKTitle;
}

void ProductScreenBaseVM::setTxtOKTitle(QString &value)
{
    m_OKTitle = value;
}

QString ProductScreenBaseVM::txtNGTitle()
{
    return m_NGTitle;
}

void ProductScreenBaseVM::setTxtNGTitle(QString &value)
{
    m_NGTitle = value;
}

QString ProductScreenBaseVM::txtTotalValue()
{
    return m_TotalValue;
}

void ProductScreenBaseVM::setTxtTotalValue(QString &value)
{
    m_TotalValue = value;
}

QString ProductScreenBaseVM::txtOKValue()
{
    return m_OKValue;
}

void ProductScreenBaseVM::setTxtOKValue(QString &value)
{
    m_OKValue = value;
}

QString ProductScreenBaseVM::txtNGValue()
{
    return m_NGValue;
}

void ProductScreenBaseVM::setTxtNGValue(QString &value)
{
    m_NGValue = value;
}

int ProductScreenBaseVM::onChangeLanguage()
{
    int langCode = (int)MainWindow::GetInstance()->language();
    m_ProductTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_COM_PRODKIND, langCode);
    m_LotNoTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_PN_LOTNO, langCode);
    m_RefTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_COM_REFVAL, langCode);
    m_LowLmtTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_PN_LWLMT1STD, langCode);
    m_UpLmtTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_PN_UPLMT1STD, langCode);
    m_NoTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_PN_TAREWEIGHT, langCode);
    m_TotalTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_COM_TOTALCNT, langCode);
    m_OKTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_COM_PASS, langCode);
    m_NGTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_COM_NG, langCode);

#ifdef STUP_DISPLAY_DATA
    m_RefUnit = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_UNIT_G, langCode);
    m_LowLmtUnit = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_UNIT_G, langCode);
    m_UpLmtUnit = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_UNIT_G, langCode);
    m_NoUnit = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_UNIT_G, langCode);
#endif

    return 0;
}
