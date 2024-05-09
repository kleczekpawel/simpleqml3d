import Qt3D.Core 2.0
import Qt3D.Render 2.0

Material {
    id: root

    parameters: [
        Parameter {
            name: "diffuseTexture"
            value: Texture2D {
                id: texture
                TextureImage {
                    source: "qrc:/heatmap.png"
                }
            }
        }
    ]

    // https://doc.qt.io/qt-5/qml-qt3d-render-effect.html
    effect: Effect {

        property string vertex: "qrc:/shaders/gl3/simpleColor.vert"
        property string fragment: "qrc:/shaders/gl3/simpleColor.frag"

        FilterKey {
            id: forward
            name: "renderingStyle"
            value: "forward"
        }

        ShaderProgram {
            id: gl3Shader
            vertexShaderCode: loadSource(parent.vertex)
            fragmentShaderCode: loadSource(parent.fragment)
        }

        techniques: [
            // OpenGL 3.1
            Technique {
                filterKeys: [forward]
                // https://doc.qt.io/qt-5/qml-qt3d-render-parameter.html
                parameters: []
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
            }
        ]
    }
}


