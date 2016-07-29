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
#include "search.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    StarterModel stModel;

    CheckoutModel chkModel;

    DesertModel desModel;

    MainCourseModel mcModel;

    SearchModel mySearchModel;

   // QFile file("menu.json");
    //QFile file("/home/sandeep/FoodApp/menu.json");
    QFile file("/storage/emulated/legacy/foodAppData/menu.json");
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    QByteArray jsonData = file.readAll();
    file.close();


    QJsonDocument document = QJsonDocument::fromJson(jsonData);

    QJsonObject object = document.object();

    QJsonValue tempID;
    QJsonValue tempItem;
    QJsonValue tempPrice;
    bool iFlag=false;
    int i=0;

    /*Reading Starter Data*/
    QJsonValue starterObject = object.value("Starter");
    QJsonArray starterArray=starterObject.toArray();

    QJsonObject starterValue;



    while (iFlag!=true)
    {

        starterValue=starterArray.at(i).toObject();
        tempID=starterValue.value("id");
        tempItem=starterValue.value("item");
        tempPrice=starterValue.value("price");
        if(tempID.isUndefined()||tempItem.isUndefined()||tempPrice.isUndefined())
        {
            iFlag=true;
            qWarning()<<"data Over";

        }
        else {
            qWarning()<<tempID.toString()<<"  "<<tempItem.toString()<<"  "<<tempPrice.toString();
            stModel.addStarterItem(Starter(tempID.toString(),tempItem.toString(), tempPrice.toString()));
            i++;
        }


    }
    /*End of reading Starter Data*/



    /*Reading MainCourse Data*/

    QJsonValue mainCourseObject = object.value("MainCourse");
    QJsonArray mainCourseArray=mainCourseObject.toArray();

    QJsonObject mainCourseValue;

    iFlag=false;
    i=0;

    while (iFlag!=true)
    {

        mainCourseValue=mainCourseArray.at(i).toObject();
        tempID=mainCourseValue.value("id");
        tempItem=mainCourseValue.value("item");
        tempPrice=mainCourseValue.value("price");
        if(tempID.isUndefined()||tempItem.isUndefined()||tempPrice.isUndefined())
        {
            iFlag=true;
            qWarning()<<"data Over";

        }
        else {
            qWarning()<<tempID.toString()<<"  "<<tempItem.toString()<<"  "<<tempPrice.toString();
            mcModel.addMainCourseItem(MainCourse(tempID.toString(),tempItem.toString(), tempPrice.toString()));
            i++;
        }


    }
    /*End of reading MainCourse Data*/



    /*Reading Desert Data*/

    QJsonValue desertObject = object.value("Desert");
    QJsonArray desertArray=desertObject.toArray();

    QJsonObject desertValue;

    iFlag=false;
    i=0;

    while (iFlag!=true)
    {

        desertValue=desertArray.at(i).toObject();
        tempID=desertValue.value("id");
        tempItem=desertValue.value("item");
        tempPrice=desertValue.value("price");
        if(tempID.isUndefined()||tempItem.isUndefined()||tempPrice.isUndefined())
        {
            iFlag=true;
            qWarning()<<"data Over";

        }
        else {
            qWarning()<<tempID.toString()<<"  "<<tempItem.toString()<<"  "<<tempPrice.toString();
            desModel.addDesertItem(Desert(tempID.toString(),tempItem.toString(), tempPrice.toString()));
            i++;
        }


    }
    /*End of reading desert Data*/


    //qWarning()<<"testing"<<stModel.rowCount()<<" search = "<<mySearchModel.search("it");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    engine.rootContext()->setContextProperty("stModel",&stModel);
    engine.rootContext()->setContextProperty("chkModel",&chkModel);
    engine.rootContext()->setContextProperty("desertModel",&desModel);
    engine.rootContext()->setContextProperty("mainCourseModel",&mcModel);
    engine.rootContext()->setContextProperty("mySearchModel",&mySearchModel);


    return app.exec();
}
