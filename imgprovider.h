#ifndef IMGPROVIDER_H
#define IMGPROVIDER_H
#include <QQuickImageProvider>
#define IMAGE_EXT "*.png"

class ImgProvider : public QQuickImageProvider
{
private:
    QMap<QString,QImage> dictionary;
    QList<QString> replaceItems;
public:
    static ImgProvider* GetInstance();
    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize);
    int UpdateReplaceFolder();
    int CleanImageProvider();
private:
    static ImgProvider* _instance;
    ImgProvider(ImageType type, Flags flags = 0);
    int clearReplaceItems();
};

#endif // IMGPROVIDER_H
