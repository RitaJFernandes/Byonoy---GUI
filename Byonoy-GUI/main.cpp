#include "interface.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Settings to be saved across runs
    app.setOrganizationName("Byonoy GmbH");
    app.setOrganizationDomain("byonoy.com");
    app.setApplicationName("FireflyGUI");

    // Setting QtQuick.controls Style
    qputenv("QT_QUICK_CONTROLS_STYLE", "Material");
    qputenv("QT_QUICK_CONTROLS_MATERIAL_VARIANT", "Dense");
    qputenv("QT_QUICK_CONTROLS_MATERIAL_THEME", "Dark");

    QQmlApplicationEngine engine;

    // Setting an Interface obj as a Context Property
    Interface myInterface;
    engine.rootContext()->setContextProperty("myInterface", &myInterface);

    const QUrl url(u"qrc:/Byonoy-GUI/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
