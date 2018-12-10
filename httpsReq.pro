#-------------------------------------------------
#
# Project created by QtCreator 2018-12-07T00:50:43
#
#-------------------------------------------------

QT       += core gui network
#x86 Linux desktop
#LIBS +="-L/home/febef/Documentos/Qt/lib/openssl1.0.2"
# arm-arch
LIBS="-L/home/febef/Documentos/Qt/lib/arm-arch-openssl-1.0.2q/"
# x86 android
#LIBS="-L/home/febef/Documentos/Qt/lib/x86_openssl-1.0.2q -llibssl -llibcrypto"

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = httpsReq
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11

SOURCES += \
  main.cpp \
  mainwindow.cpp

HEADERS += \
  mainwindow.h \
  mainwindow.h

FORMS += \
  mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
  android-sources/AndroidManifest.xml

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/../lib/x86_openssl-1.0.2q/libcrypto.so \
        $$PWD/../lib/x86_openssl-1.0.2q/libssl.so
}

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/../lib/arm-arch-openssl-1.0.2q/libcrypto.so \
        $$PWD/../lib/arm-arch-openssl-1.0.2q/libssl.so
}
