#include "parametersettingvm.h"
#include "screenmng.h"

ParameterSettingVM::ParameterSettingVM(QObject *parent)
    : QObject(parent) {
    langInstance = Lang::GetInstance();
}

ParameterSettingVM::~ParameterSettingVM() {

}

void ParameterSettingVM::setTxtHSerial(const QString &arg) {
    m_txtHSerial = arg;
}

QString ParameterSettingVM::txtHSerial() const {
    return m_txtHSerial;
}

void ParameterSettingVM::setTxtHType(const QString &arg) {
    m_txtHType = arg;
}

QString ParameterSettingVM::txtHType() const {
    return m_txtHType;
}

void ParameterSettingVM::setTxtHParam(const QString &arg) {
    m_txtHParameter = arg;
}

QString ParameterSettingVM::txtHParam() const {
    return m_txtHParameter;
}

void ParameterSettingVM::setTxtHValue(const QString &arg) {
    m_txtHValue = arg;
}

QString ParameterSettingVM::txtHValue() const {
    return m_txtHValue;
}

void ParameterSettingVM::setTxtCSerial(const QString &arg) {
    m_txtCSerial = arg;
}

QString ParameterSettingVM::txtCSerial() const {
    return m_txtCSerial;
}

void ParameterSettingVM::setTxtCParam(const QString &arg) {
    m_txtCParam = arg;
}

QString ParameterSettingVM::txtCParam() const {
    return m_txtCParam;
}

void ParameterSettingVM::setTxtCValue(const QString &arg) {
    m_txtCValue = arg;
}

QString ParameterSettingVM::txtCValue() const {
    return m_txtCValue;
}

int ParameterSettingVM::getR1SerialTitle() const {
    return m_txtR1SerialTitle;
}

int ParameterSettingVM::getR2SerialTitle() const {
    return m_txtR2SerialTitle;
}

int ParameterSettingVM::getR3SerialTitle() const {
    return m_txtR3SerialTitle;
}

int ParameterSettingVM::getR4SerialTitle() const {
    return m_txtR4SerialTitle;
}

int ParameterSettingVM::getR5SerialTitle() const {
    return m_txtR5SerialTitle;
}

int ParameterSettingVM::getR6SerialTitle() const {
    return m_txtR6SerialTitle;
}

QString ParameterSettingVM::getR1ParameterTitle() const {
    return m_txtR1ParameterTitle;
}

QString ParameterSettingVM::getR2ParameterTitle() const {
    return m_txtR2ParameterTitle;
}

QString ParameterSettingVM::getR3ParameterTitle() const {
    return m_txtR3ParameterTitle;
}

QString ParameterSettingVM::getR4ParameterTitle() const {
    return m_txtR4ParameterTitle;
}

QString ParameterSettingVM::getR5ParameterTitle() const {
    return m_txtR5ParameterTitle;
}

QString ParameterSettingVM::getR6ParameterTitle() const {
    return m_txtR6ParameterTitle;
}

QString ParameterSettingVM::getR1ValueTitle() const {
    return m_txtR1ValueTitle;
}

QString ParameterSettingVM::getR2ValueTitle() const {
    return m_txtR2ValueTitle;
}

QString ParameterSettingVM::getR3ValueTitle() const {
    return m_txtR3ValueTitle;
}

QString ParameterSettingVM::getR4ValueTitle() const {
    return m_txtR4ValueTitle;
}

QString ParameterSettingVM::getR5ValueTitle() const {
    return m_txtR5ValueTitle;
}

QString ParameterSettingVM::getR6ValueTitle() const {
    return m_txtR6ValueTitle;
}

QString ParameterSettingVM::getR1InfoTitle() const {
    return m_txtR1InfoTitle;
}

QString ParameterSettingVM::getR2InfoTitle() const {
    return m_txtR2InfoTitle;
}

QString ParameterSettingVM::getR3InfoTitle() const {
    return m_txtR3InfoTitle;
}

QString ParameterSettingVM::getR4InfoTitle() const {
    return m_txtR4InfoTitle;
}

QString ParameterSettingVM::getR5InfoTitle() const {
    return m_txtR5InfoTitle;
}

QString ParameterSettingVM::getR6InfoTitle() const {
    return m_txtR6InfoTitle;
}

int ParameterSettingVM::getR1TypeTitle() const {
    return m_txtR1TypeTitle;
}

int ParameterSettingVM::getR2TypeTitle() const {
    return m_txtR2TypeTitle;
}

int ParameterSettingVM::getR3TypeTitle() const {
    return m_txtR3TypeTitle;
}

int ParameterSettingVM::getR4TypeTitle() const {
    return m_txtR4TypeTitle;
}

int ParameterSettingVM::getR5TypeTitle() const {
    return m_txtR5TypeTitle;
}

int ParameterSettingVM::getR6TypeTitle() const {
    return m_txtR6TypeTitle;
}

void ParameterSettingVM::setTxtForline(const QString &arg) {
    m_txtForLine = arg;
}

QString ParameterSettingVM::txtForline() const {
    return m_txtForLine;
}

int ParameterSettingVM::onUpdateLang() {
    m_txtHSerial = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COL_NO, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtHParameter = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COL_PARAM, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtHValue = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COM_SETVALUE, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtForLine = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COM_INDIVLINE, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    return 0;
}

int ParameterSettingVM::onUpdateColumnName() {
    m_txtCSerial = SERIAL_COLUMN_NAME;
    m_txtCParam = PARAM_COLUMN_NAME;
    m_txtCValue = VALUE_COLUMN_NAME;
    return 0;
}

void ParameterSettingVM::UpdateLangParam() {
    m_txtR1SerialTitle = 1;
    m_txtR2SerialTitle = 2;
    m_txtR3SerialTitle = 3;
    m_txtR4SerialTitle = 4;
    m_txtR5SerialTitle = 5;
    m_txtR6SerialTitle = 6;
    m_txtR1ParameterTitle = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COM_PRODNAME, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtR2ParameterTitle = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_PN_PRODNAME2, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtR3ParameterTitle = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_PN_LOTNO, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtR4ParameterTitle = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_VIEW_PRODLENGTH, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtR5ParameterTitle = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_PN_PRODWIZARDPRODWIDTH, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtR6ParameterTitle = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COM_PRODHEIGHT, globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_txtR1ValueTitle = QString("あああa").replace("a", "");
    m_txtR2ValueTitle = "";
    m_txtR3ValueTitle = "";
    m_txtR4ValueTitle = "100";
    m_txtR5ValueTitle = "30";
    m_txtR6ValueTitle = "10";


    QFile file(":/Data/byteArray2.data");
    file.open(QIODevice::ReadOnly);
    QByteArray temp = file.readAll();
    m_txtR1InfoTitle = QString(temp);

    m_txtR2InfoTitle = QString("『製品情報入力』画面の表示タイプ1 と同じです。");
    m_txtR3InfoTitle = QString("『製品情報入力』画面の表示タイプ1 と同じです。");
    m_txtR4InfoTitle = QString("『製品情報入力』画面の表示タイプ1 と同じです。");
    m_txtR5InfoTitle = QString("『製品情報入力』画面の表示タイプ1 と同じです。");
    m_txtR6InfoTitle = QString("『製品情報入力』画面の表示タイプ1 と同じです。");
    m_txtR1TypeTitle = 1;
    m_txtR2TypeTitle = 2;
    m_txtR3TypeTitle = 2;
    m_txtR4TypeTitle = 2;
    m_txtR5TypeTitle = 2;
    m_txtR6TypeTitle = 2;
}

void ParameterSettingVM::OnLoad() {
    ScreenMng* screenMng = ScreenMng::GetInstance();
    qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarParamSetting;
    screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarParamSetting);
    screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
}
