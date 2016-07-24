TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    checkout.cpp \
    starter.cpp \
    desert.cpp \
    maincourse.cpp \
    search.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    checkout.h \
    starter.h \
    desert.h \
    maincourse.h \
    search.h

DISTFILES += \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle \
    menu.json \
    images/icon-left-arrow.png

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

