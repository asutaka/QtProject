#include "productionscreenvm_ver3.h"
#include "screenmng.h"
#include "mainwindow.h"

ProductionScreenVM_ver3::ProductionScreenVM_ver3()
{
#ifdef STUP_DISPLAY_DATA
    int maxLine = 12;
    setMaxLine(maxLine);
    m_Timer = new QTimer();
    connect(m_Timer, SIGNAL(timeout()), this, SLOT(connectWithTimer()));
    m_Timer->setInterval(200);
#endif

    LoadImages();
}

void ProductionScreenVM_ver3::LoadImages()
{
    QSize* size = 0;
    QSize requestSize;
    QPixmap image;

    image.convertFromImage(ImgProvider::GetInstance()->requestImage("MassBar.png", size, requestSize));
    massbarBargraphList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("MassBar_OK.png", size, requestSize));
    massbarBargraphList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("MassBar_PNG.png", size, requestSize));
    massbarBargraphList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("MassBar_MNG.png", size, requestSize));
    massbarBargraphList.append(image);

    image.convertFromImage(ImgProvider::GetInstance()->requestImage("Integration_CW_Bar_Limit.png", size, requestSize));
    averageBarLimitList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("Integration_Average_01.png", size, requestSize));
    averageBarLimitList.append(image);

    image.convertFromImage(ImgProvider::GetInstance()->requestImage("rectangle_gray.png", size, requestSize));
    lineList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("rectangle_green.png", size, requestSize));
    lineList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("rectangle_red.png", size, requestSize));
    lineList.append(image);

    image.convertFromImage(ImgProvider::GetInstance()->requestImage("Icon_w28h28_mNG.png", size, requestSize));
    productReasonList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("Icon_w28h28_pNG.png", size, requestSize));
    productReasonList.append(image);

    image.convertFromImage(ImgProvider::GetInstance()->requestImage("NG1.png", size, requestSize));
    imgDetectList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("NG2.png", size, requestSize));
    imgDetectList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("NG3.png", size, requestSize));
    imgDetectList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("NG4.png", size, requestSize));
    imgDetectList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("NG5.png", size, requestSize));
    imgDetectList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("NG6.png", size, requestSize));
    imgDetectList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("NG7.png", size, requestSize));
    imgDetectList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("NG8.png", size, requestSize));
    imgDetectList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("NG9.png", size, requestSize));
    imgDetectList.append(image);

    image.convertFromImage(ImgProvider::GetInstance()->requestImage("ProductResult_OK.png", size, requestSize));
    imgProductResultList.append(image);
    image.convertFromImage(ImgProvider::GetInstance()->requestImage("ProductResult_NG.png", size, requestSize));
    imgProductResultList.append(image);
}

QString ProductionScreenVM_ver3::txtTotalATitle()
{
    return m_TotalATitle;
}

void ProductionScreenVM_ver3::setTxtTotalATitle(QString &value)
{
    m_TotalATitle = value;
}

QString ProductionScreenVM_ver3::txtFeTitle()
{
    return m_FeTitle;
}

void ProductionScreenVM_ver3::setTxtFeTitle(QString &value)
{
    m_FeTitle = value;
}

QString ProductionScreenVM_ver3::txtSUSTitle()
{
    return m_SUSTitle;
}

void ProductionScreenVM_ver3::setTxtSUSTitle(QString &value)
{
    m_SUSTitle = value;
}

QString ProductionScreenVM_ver3::txtTotalAValue()
{
    return m_TotalAValue;
}

void ProductionScreenVM_ver3::setTxtTotalAValue(QString &value)
{
    m_TotalAValue = value;
}

QString ProductionScreenVM_ver3::txtFeValue()
{
    return m_FeValue;
}

void ProductionScreenVM_ver3::setTxtFeValue(QString &value)
{
    m_FeValue = value;
}

QString ProductionScreenVM_ver3::txtSUSValue()
{
    return m_SUSValue;
}

void ProductionScreenVM_ver3::setTxtSUSValue(QString &value)
{
    m_SUSValue = value;
}

QPixmap ProductionScreenVM_ver3::imgMassBarGraphBgk()
{
    return m_MassBarGraphBgk;
}

void ProductionScreenVM_ver3::setImgMassBarGraphBgk(QPixmap &value)
{
    m_MassBarGraphBgk = value;
}

QPixmap ProductionScreenVM_ver3::imgMassBarGraph()
{
    return m_MassBarGraph;
}

void ProductionScreenVM_ver3::setImgMassBarGraph(QPixmap &value)
{
    m_MassBarGraph = value;
}

QPixmap ProductionScreenVM_ver3::imgBarLimit()
{
    return m_BarLimit;
}

void ProductionScreenVM_ver3::setImgBarLimit(QPixmap &value)
{
    m_BarLimit = value;
}

QPixmap ProductionScreenVM_ver3::imgAverage()
{
    return m_Average;
}

void ProductionScreenVM_ver3::setImgAverage(QPixmap &value)
{
    m_Average = value;
}

QPixmap ProductionScreenVM_ver3::imgDetect()
{
    return m_ImgDetect;
}

void ProductionScreenVM_ver3::setImgDetect(QPixmap &value)
{
    m_ImgDetect = value;
}

QPixmap ProductionScreenVM_ver3::imgLineBkg()
{
    return m_LineBkg;
}

void ProductionScreenVM_ver3::setImgLineBkg(QPixmap &value)
{
    m_LineBkg = value;
}

QList<QPixmap> ProductionScreenVM_ver3::imgLineResult()
{
    return m_LineResult;
}

void ProductionScreenVM_ver3::setImgLineResult(QList<QPixmap> &value)
{
    m_LineResult = value;
}

QList<QPixmap> ProductionScreenVM_ver3::imgProductReason()
{
    return m_ImgProductReason;
}

void ProductionScreenVM_ver3::setImgProductReason(QList<QPixmap> &value)
{
    m_ImgProductReason = value;
}

QString ProductionScreenVM_ver3::txtMeasureUnit()
{
    return m_MeasureUnit;
}

void ProductionScreenVM_ver3::setTxtMeasureUnit(QString &value)
{
    m_MeasureUnit = value;
}

QString ProductionScreenVM_ver3::txtMeasureValue()
{
    return m_MeasureValue;
}

void ProductionScreenVM_ver3::setTxtMeasureValue(QString &value)
{
    m_MeasureValue = value;
}

QString ProductionScreenVM_ver3::txtZero()
{
    return m_Zero;
}

void ProductionScreenVM_ver3::setTxtZero(QString &value)
{
    m_Zero = value;
}

QString ProductionScreenVM_ver3::txtLineTitle()
{
    return m_LineTitle;
}

int ProductionScreenVM_ver3::maxLine()
{
    return m_MaxLine;
}

void ProductionScreenVM_ver3::setMaxLine(int &value)
{
    m_MaxLine = value;
}

void ProductionScreenVM_ver3::setTxtLineTitle(QString &value)
{
    m_LineTitle = value;
}

int ProductionScreenVM_ver3::prodResult()
{
    return m_ProductResult;
}

void ProductionScreenVM_ver3::setProdResult(int &value)
{
    m_ProductResult = value;
}

QPixmap ProductionScreenVM_ver3::imgProductResult()
{
    return m_ImgProductResult;
}

void ProductionScreenVM_ver3::setImgProductResult(QPixmap &value)
{
    m_ImgProductResult = value;
}

int ProductionScreenVM_ver3::widtMassBarResult()
{
    return m_WidthMassBarResult;
}

void ProductionScreenVM_ver3::setWidtMassBarResult(int &value)
{
    m_WidthMassBarResult = value;
}

int ProductionScreenVM_ver3::widtMassBar()
{
    return WIDTH_MASSBAR;
}

QFont ProductionScreenVM_ver3::fontText()
{
    return m_FontText;
}

void ProductionScreenVM_ver3::setFontText(QFont &value)
{
    m_FontText = value;
}

QColor ProductionScreenVM_ver3::colorTxtZero()
{
    return m_ColorTxtZero;
}

void ProductionScreenVM_ver3::setColorTxtZero(QColor &value)
{
    m_ColorTxtZero = value;
}

int ProductionScreenVM_ver3::onLoad()
{
    updateProductionContent();
    connect(MainWindow::GetInstance(), SIGNAL(guiEvent(int)), this, SLOT(OnGuiEvent(int)));
    ScreenMng* screenMng = ScreenMng::GetInstance();
    qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMainPage;
    screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
    screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMainPage);
    if(MainWindow::GetInstance()->getStatusMachine() == EnumControl::StatusMachine::STATUS_START) {
        m_Timer->start();
    }
    return 0;
}

void ProductionScreenVM_ver3::OnGuiEvent(int eventId){
    switch ((EnumControl::EventId)eventId) {
    case EnumControl::EventId::START:
        if (m_Timer && !m_Timer->isActive()) {
            m_Timer->start();
        }
        break;
    case EnumControl::EventId::STOP:
        if (m_Timer && m_Timer->isActive()) {
            m_Timer->stop();
        }
        break;
    default:
        break;
    }
}

void ProductionScreenVM_ver3::updateProductionContent()
{
    setImgMassBarGraphBgk(massbarBargraphList[0]);
    setImgBarLimit(averageBarLimitList[0]);
    setImgAverage(averageBarLimitList[1]);
    setImgLineBkg(lineList[0]);

#ifdef STUP_DISPLAY_DATA
    QString strProductNo = "050";
    QString strProductName = "Sample";
    QString strLotNoValue = "Anritsu";
    QString refValue = "12.0";
    QString lowLmtValue = "-5.0";
    QString upLmtValue = "5.0";
    QString noValue = "000";
    int valueFe = rand() % 1000;
    int valueSUS = rand() % 1000;
    QString strValueFe = QString::number(valueFe);
    QString strValueSUS = QString::number(valueSUS);
    int valueOK = rand() % 1000;
    int valueNG = rand() % 1000;
    int valueTotal = valueOK + valueNG;
    QString strValueOK = QString::number(valueOK);
    QString strValueNG = QString::number(valueNG);
    QString strValueTotal = QString::number(valueTotal);
    int index = rand() % 4;
    QString measureValue = "123456.7";
    int indexImgDetect = rand() % 9;
    int indexProdResult = rand() % 2;
    QList<QPixmap> listLineResult;
    QList<QPixmap> listProdReason;
    int widthMassBarResult = rand() % WIDTH_MASSBAR;

    for (int i = 0; i < m_MaxLine; i++)
    {
        int indexLineResult = rand() % 3;
        listLineResult.append(lineList[indexLineResult]);
    }
    for (int i = 0; i < productReasonList.count(); i++)
    {
        listProdReason.append(productReasonList[i]);
    }
#endif
    int valueMassBarResult = (widthMassBarResult * WIDTH_MASSBAR) / m_MassBarGraphBgk.width();

    setImgMassBarGraph(massbarBargraphList[index]);
    setTxtMeasureValue(measureValue);
    setImgLineResult(listLineResult);
    setImgDetect(imgDetectList[indexImgDetect]);
    setImgProductResult(imgProductResultList[indexProdResult]);
    setImgProductReason(listProdReason);
    setProdResult(indexProdResult);
    setTxtRefValue(refValue);
    setTxtLowLmtValue(lowLmtValue);
    setTxtUpLmtValue(upLmtValue);
    setTxtNoValue(noValue);
    setTxtFeValue(strValueFe);
    setTxtSUSValue(strValueSUS);
    setTxtTotalValue(strValueTotal);
    setTxtOKValue(strValueOK);
    setTxtNGValue(strValueNG);
    setTxtProductNo(strProductNo);
    setTxtProductName(strProductName);
    setTxtLotNoValue(strLotNoValue);
    setWidtMassBarResult(valueMassBarResult);

    emit updateValue();
}

void ProductionScreenVM_ver3::onChangeLanguage()
{
    ProductScreenBaseVM::onChangeLanguage();

    int langCode = (int)MainWindow::GetInstance()->language();
    QString zero = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_STR_ZERO, langCode);
    QString totalATitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_DETECT_LIMIT, langCode);
    QString lineTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_DETECT_LEVEL, langCode);
    QString feTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_COM_FE, langCode);
    QString susTitle = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_COM_SUS, langCode);

#ifdef STUP_DISPLAY_DATA
    QString measureUnit = Lang::GetInstance()->GetLanguage(Lang::GetLangIdMng()->IDS_UNIT_G, langCode);
    QFont fntText;
    fntText.setFamily("MS Gothic");
    fntText.setPixelSize(27);
    QColor colorZero;
    colorZero.setRgb(255, 255, 255);
#endif

    setTxtMeasureUnit(measureUnit);
    setTxtZero(zero);
    setTxtTotalATitle(totalATitle);
    setTxtFeTitle(feTitle);
    setTxtSUSTitle(susTitle);
    setTxtLineTitle(lineTitle);
    setFontText(fntText);
    setColorTxtZero(colorZero);
}

void ProductionScreenVM_ver3::connectWithTimer()
{
    updateProductionContent();
}


