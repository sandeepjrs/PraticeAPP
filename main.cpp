#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "starter.h"
#include "checkout.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    StarterModel stModel;

    CheckoutModel chkModel;

    stModel.addStarterItem(Starter("Fr Chk Rs", "26"));
    stModel.addStarterItem(Starter("Rost Rs", "28"));
    stModel.addStarterItem(Starter("Shake Rs", "23"));
    stModel.addStarterItem(Starter("Tmt Rs", "52"));
    stModel.addStarterItem(Starter("Fr Chk Rs", "26"));
    stModel.addStarterItem(Starter("Rost Rs", "28"));
    stModel.addStarterItem(Starter("Shake Rs", "23"));
    stModel.addStarterItem(Starter("Tmt Rs", "52"));
    stModel.addStarterItem(Starter("Fr Chk Rs", "26"));
    stModel.addStarterItem(Starter("Rost Rs", "28"));
    stModel.addStarterItem(Starter("Shake Rs", "23"));
    stModel.addStarterItem(Starter("Tmt Rs", "52"));

    //chkModel.addRawItem("sandeep", 20);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    engine.rootContext()->setContextProperty("stModel",&stModel);
    engine.rootContext()->setContextProperty("chkModel",&chkModel);


    return app.exec();
}
