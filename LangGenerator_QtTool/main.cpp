#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <mainwindow.h>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
    MainWindow mainWin;
    context->setContextProperty("mainWindow",&mainWin);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    return app.exec();
}
