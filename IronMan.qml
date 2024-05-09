import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
    id: root

    property real x: 0
    property real y: 0
    property real z: 0
    property real scale: 1.0

    Texture2D{
        id: texture
        TextureImage {
            source: "qrc:/texture.png"
        }
    }

    RenderableEntity{
        id: chest
//        source: "qrc:/man.obj"
        source: "qrc:/grid_moved.obj"
        position: Qt.vector3d(root.x, root.y, root.z)
        scale:  root.scale

        material : SimpleMaterial {
            id: material
        }
//        material : PhongMaterial { }
//        material: DiffuseMapMaterial {
//            id: material
//            diffuse:  texture
//            specular: Qt.rgba( 0.2, 0.2, 0.2, 1.0 )
//            shininess: 2.0
//        }
    }
}
