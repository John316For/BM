#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QFileSystemModel>
#include <QDateTime>
#include <QDesktopServices>
#include <QUrl>

#include <QApplication>

#include <Qt>
//#include <QDeclarative>

#include "main.h"



//преобразует число от 0 до 10*20 в номер ячейки массива (строка, с толбец)
// для Field.qml
int numInCage(int num) {
    div_t n;
    // 20 - колво ячеек в строке
    n = div(num,20);
    printf("Quotient and remainder: %d %d\n", n.quot, n.rem);
    return n.rem;
}

/*
Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    qmlRegisterType<MyObject>("com.cage", 1, 0, "MyObject");

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qrc:/main.qml")); //qml/tw_looptijden_berekenen/main.qml"));
    viewer.showExpanded();

    return app->exec();
}*/


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
   // engine.rootContext()->setContextProperty();
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}



/*class cField  {
    Q_OBJECT

    public: int array[20][10] = {{4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,9},
                                {4,5,9,9,9,3,9,9,2,1,2,9,9,9,9,2,9,5,4,9},
                                {4,9,4,9,4,2,4,9,4,9,4,9,4,9,4,9,4,9,4,9},
                                {4,2,2,9,9,9,9,2,9,9,2,9,9,9,9,9,2,9,4,9},
                                {4,9,4,9,4,2,4,9,4,2,4,9,4,9,4,9,4,9,4,9},
                                {4,9,9,2,9,9,9,9,9,5,9,2,9,9,2,2,9,2,4,9},
                                {4,9,4,9,4,9,4,2,4,9,4,9,4,9,4,9,4,9,4,9},
                                {4,2,9,2,9,9,9,9,9,2,9,9,9,9,9,9,2,9,4,9},
                                {4,9,4,9,4,2,4,9,4,9,4,9,4,9,4,2,4,9,4,9},
                                {4,5,9,2,9,9,9,9,9,2,9,9,9,2,9,2,9,5,4,9}};



    int getCageInfo(int a, int b) {
       return array[a][b];

    }
};*/

