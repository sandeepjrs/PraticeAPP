#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

#include "starter.h"
#include "checkout.h"
#include "desert.h"
#include "maincourse.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    StarterModel stModel;

    CheckoutModel chkModel;

    DesertModel desModel;

    MainCourseModel mcModel;


    QFile file("/home/sandeep/FoodApp/menu.json");
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    QByteArray jsonData = file.readAll();
    file.close();

    //qWarning()<<jsonData;

    QJsonDocument document = QJsonDocument::fromJson(jsonData);

    QJsonObject object = document.object();
    QJsonValue value = object.value("employees");
    QJsonArray arrayOUT=value.toArray();

    QJsonObject arrayIn;
    QJsonValue value2;

    for(int i=0;i<5;i++)
    {

        arrayIn=arrayOUT.at(i).toObject();
        value2=arrayIn.value("firstName");
        qWarning()<<value2;
    }









    //    foreach (const QJsonValue & v, array)
    //        qWarning() << v.toObject().value("item") <<"i am run";






    //    QJsonArray jarray = rawJson.array();
    //    //QJsonObject sett2 = rawJson.object();
    //    //QJsonValue value = jarray.
    //    qWarning() << jarray;





    //    stModel.addStarterItem(Starter("01","Fried Chicken", "26"));
    //    stModel.addStarterItem(Starter("01","Rost Chicken", "28"));
    //    stModel.addStarterItem(Starter("01","Shake", "23"));
    //    stModel.addStarterItem(Starter("01","Tmt", "52"));
    //    stModel.addStarterItem(Starter("01","Fr Chk", "26"));
    //    stModel.addStarterItem(Starter("01","Rost", "28"));
    //    stModel.addStarterItem(Starter("01","Shake", "23"));
    //    stModel.addStarterItem(Starter("01","Tmt", "52"));
    //    stModel.addStarterItem(Starter("01","Fr Chk", "26"));
    //    stModel.addStarterItem(Starter("01","Rost", "28"));
    //    stModel.addStarterItem(Starter("01","Shake", "23"));
    //    stModel.addStarterItem(Starter("01","Tmt", "52"));

    //    desModel.addDesertItem(Desert("desert Item","100"));
    //    desModel.addDesertItem(Desert("desert Item","100"));


    //    mcModel.addMainCourseItem(MainCourse("main co","55"));
    //    mcModel.addMainCourseItem(MainCourse("main co","55"));



    //chkModel.addRawItem("sandeep", 20);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    engine.rootContext()->setContextProperty("stModel",&stModel);
    engine.rootContext()->setContextProperty("chkModel",&chkModel);
    engine.rootContext()->setContextProperty("desertModel",&desModel);
    engine.rootContext()->setContextProperty("mainCourseModel",&mcModel);


    return app.exec();
}
