#include <QGuiApplication>
#include <QQuickView>
#include <QOpenGLContext>

// [PK]
#include <QQmlApplicationEngine>
#include <QQmlContext>


//#include <QtWidgets/QApplication>
//#include <QtQuick/QQuickView>
//#include <QtQml/QQmlContext>
//#include <QtQml/QQmlEngine>
//#include <QUrl>

#include <iostream>

void setSurfaceFormat()
{
    QSurfaceFormat format;
#ifdef QT_OPENGL_ES_2
    std::cout << "Format: ES2" << std::endl;
    format.setRenderableType(QSurfaceFormat::OpenGLES);
#else
    std::cout << "Format: GL" << std::endl;
    if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGL) {
        format.setVersion(4, 3);
        format.setProfile(QSurfaceFormat::CoreProfile);
    }
#endif
    format.setDepthBufferSize(24);
    format.setSamples(4);
    format.setStencilBufferSize(8);
    QSurfaceFormat::setDefaultFormat(format);
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    setSurfaceFormat();

//    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
//    QApplication app(argc, argv);

    QQuickView viewer;

    /*
     * if you want you can create custom c++ backend and call slots of them from qml
     *
    viewer.setTitle(QStringLiteral("360Shop"));
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    BackEnd backend(viewer);
    viewer.rootContext()->setContextProperty("backEnd", &backend);
    QObject::connect(viewer.engine(), &QQmlEngine::quit, &viewer, &QWindow::close);
    */


    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.show();
    return app.exec();
}
