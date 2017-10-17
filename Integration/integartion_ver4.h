#ifndef INTEGARTION_VER4_H
#define INTEGARTION_VER4_H

#include <QtQuick/QQuickPaintedItem>
#include <QtQuick/QQuickItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include "Control/drawControlBase/drawcontrolbase_ver7.h"
#include "Control/lineImage/lineimage.h"
#include <Control/bufferedGraphicsPanel/bufferedgraphicspanel.h>

class Integartion_ver4 : public DrawControlBase_ver7
{
    Q_OBJECT
public:
    Integartion_ver4();
    ~Integartion_ver4();

    Q_INVOKABLE void connectToBufferedGraphicsPanel(BufferedGraphicsPanel *buffered);
private:
    QPixmap arrayPixmapLineNo[12];
    QPixmap imgBarGraph;
    QPixmap imgAve;
    LineImage arrayLineImage[3];

    void LoadImages();

public slots:
    void DrawControl(QPainter *painter);
};

#endif // INTEGARTION_VER4_H
