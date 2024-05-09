import Qt3D.Core 2.0
import Qt3D.Render 2.0

Material {
    id: root

    property real opacity: 1.0
    property color maincolor: Qt.rgba(0.3, 0.5, 0.9, 1.0)

    parameters: [
        Parameter {
            name: "maincolor"
//            value: Qt.vector3d(root.maincolor.r, root.maincolor.g, root.maincolor.b)
            value: Qt.vector3d(0.5, 0.8, 0.7)
        },
        Parameter {
            name: "diffuseTexture"
            value: Texture2D {
                id: texture
                TextureImage {
                    source: "qrc:/texture.png"
                }
            }
        }
//        Parameter {
//            name: "diffuseTexture"
//            value: Texture2D {
//                id: texture
//                textureImages: [
//                    TextureImage {
//                        source: "qrc:/texture.png"
////                        source: "qrc:/heatmap.png"
////                        source: "qrc:/heatmap_uc.png"
////                        source: "data:image/png;base64," + model.imageData
//                        // @up - see: https://stackoverflow.com/a/6753165/492221
////                        source: "image://heatmap/yellow"
//                        // @up - not working, as "QTextureImage only supports local url"
//                    }
//                ]
//            }
//        }
//        ,
//        Parameter {
//            name: "diffuseValues[0]"
//            value: [0.0, 0.5, 0.2, 1.0]
//        }
    ]

    // https://doc.qt.io/qt-5/qml-qt3d-render-effect.html
    effect: Effect {

        property string vertex: "qrc:/shaders/gl3/simpleColor.vert"
        property string fragment: "qrc:/shaders/gl3/simpleColor.frag"
        property string vertexES: "qrc:/shaders/es2/simpleColor.vert"
        property string fragmentES: "qrc:/shaders/es2/simpleColor.frag"

        FilterKey {
            id: forward
            name: "renderingStyle"
            value: "forward"
        }

        // https://doc.qt.io/qt-5/qml-qtquick3d-effects-effect.html
//        import QtQuick3D 1.15
//
//        Shader {
//            id: vertical
//            stage: Shader.Vertex
//            shader: "shaders/blurvertical.vert"
//        }
//        Shader {
//            id: horizontal
//            stage: Shader.Vertex
//            shader: "shaders/blurhorizontal.vert"
//        }

        ShaderProgram {
            id: gl3Shader
            vertexShaderCode: loadSource(parent.vertex)
            fragmentShaderCode: loadSource(parent.fragment)
        }
        ShaderProgram {
            id: es2Shader
            vertexShaderCode: loadSource(parent.vertexES)
            fragmentShaderCode: loadSource(parent.fragmentES)
        }

        techniques: [
            // OpenGL 3.1
            Technique {
                filterKeys: [forward]
                parameters: [
                    // https://doc.qt.io/qt-5/qml-qt3d-render-parameter.html
                    Parameter {
                        name: "ourColor"
                        value: "blue"
                    }
//                    Parameter {
//                        name: "diffuseTexture"
//                        value: Texture2D {
//                            id: texture
//                            TextureImage {
//                                source: "qrc:/man.png"
//                            }
//                        }
//                    }
//                    Parameter {
//                        name: "diffuseValues[0]"
//                        value: [0.0, 1.0. 2.0, 3.0, 4.0, 883.0, 1340.0, 1584.0]
//                    }
                ]
                graphicsApiFilter {
                    api: GraphicsApiFilter.OpenGL
                    profile: GraphicsApiFilter.CoreProfile
                    majorVersion: 3
                    minorVersion: 1
                }
                // https://doc.qt.io/qt-6/qml-qt3d-render-renderpass.html
                renderPasses: RenderPass {
                    shaderProgram: gl3Shader
                }
            },
            // OpenGL 2.0
            Technique {
                filterKeys: [forward]
                graphicsApiFilter {
                    api: GraphicsApiFilter.OpenGL
                    profile: GraphicsApiFilter.NoProfile
                    majorVersion: 2
                    minorVersion: 0
                }
                renderPasses: RenderPass {
                    shaderProgram: es2Shader
                }
            },
            // ES 2.0
            Technique {
                filterKeys: [forward]
                graphicsApiFilter {
                    api: GraphicsApiFilter.OpenGLES
                    profile: GraphicsApiFilter.CoreProfile
                    majorVersion: 2
                    minorVersion: 0
                }
                renderPasses: RenderPass {
                    shaderProgram: es2Shader
                }
            }
        ]
    }
}


