#include <QGuiApplication>
#include <QQuickView>
#include <QOpenGLContext>

// [PK]
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <iostream>

void setSurfaceFormat()
{
    QSurfaceFormat format;
#ifdef QT_OPENGL_ES_2
    throw std::runtime_error("ES2 not supported!");
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

    QQuickView viewer;

    viewer.resize(800, 800);
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.show();
    return app.exec();
}
