#include "integartionvm.h"
#include "screenmng.h"
#include "QDebug"
#include "imgprovider.h"

IntegartionVM::IntegartionVM(QObject *parent) : QObject(parent)
{
    m_NumberLine =10;
}
void IntegartionVM::onLoad(){
    ScreenMng* screenMng = ScreenMng::GetInstance();
    qDebug() << "menu load BottomBarId: " << ScreenMng::BottomBarId::BottomBarMainPage;
    screenMng->ChangeBottomBar(ScreenMng::BottomBarId::BottomBarMainPage);
    screenMng->ChangeStatusBar(ScreenMng::StatusBarId::NormalStatusBar);
    onUpdateData();

}
void IntegartionVM::onUpdateData()
{
    QSize* size = 0;
    QSize requestSize;
    QImage imageFromImageProvider;
    QPixmap img;
    img.convertFromImage(ImgProvider::GetInstance()->requestImage("bargraph_w32_", size, requestSize));
    QRect rectBackgroundImage(0, 0, 32, 209);
    QRect rectForcegroundImage;
    img=img.copy(rectBackgroundImage);

    if (m_ListSourceBackgroundImage.count() == 0) {
        for (int i = 0; i < m_NumberLine; i++) {
            m_ListSourceBackgroundImage.append(img);
        }
    }

    m_ListColumnType.clear();
    for (int i = 0; i < m_NumberLine; i++) {
        m_ListColumnType.append(ColumnGraphTypeId::BOTTOMTOTOP);
    }

    m_ListSourceImage.clear();
    for(int i = 0; i< m_NumberLine; i++) {
        int ranNumber = rand();
        int heightColumn = ranNumber%rectBackgroundImage.height();
        if(ranNumber%3 == 0){
            imageFromImageProvider = ImgProvider::GetInstance()->requestImage("bargraph_w32_red_", size, requestSize);
        }else if(ranNumber%3 == 1){
            imageFromImageProvider = ImgProvider::GetInstance()->requestImage("bargraph_w32_Orange_", size, requestSize);
        }else {
            imageFromImageProvider = ImgProvider::GetInstance()->requestImage("bargraph_w32_green_", size, requestSize);
        }
        img.convertFromImage(imageFromImageProvider);
        rectForcegroundImage.setRect(rectBackgroundImage.x(), rectBackgroundImage.y() + rectBackgroundImage.height() - heightColumn, rectBackgroundImage.width(), heightColumn);
        img = img.copy(rectForcegroundImage);
        m_ListSourceImage.append(img);
    }

}

QList<QPixmap> IntegartionVM::listSourceImage() {
    return m_ListSourceImage;
}

void IntegartionVM::setListSourceImage(QList<QPixmap> &value) {
    m_ListSourceImage = value;
}

QList<QPixmap> IntegartionVM::listSourceBackgroundImage() {
    return m_ListSourceBackgroundImage;
}

void IntegartionVM::setListSourceBackgroundImage(QList<QPixmap> &value) {
    m_ListSourceBackgroundImage = value;
}

QList<int> IntegartionVM::listColumnType() {
    return m_ListColumnType;
}

void IntegartionVM::setListColumnType(QList<int> &value) {
    m_ListColumnType = value;
}
