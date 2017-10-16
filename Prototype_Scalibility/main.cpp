#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "UIScreen/Production/production.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Production::qmlRegisterType();

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    return app.exec();
}
