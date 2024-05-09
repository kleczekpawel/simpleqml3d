import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
    id: root

    property real x: 0
    property real y: 0
    property real z: 0
    property real scale: 1.0

    RenderableEntity{
        id: chest
        source: "qrc:/grid_moved_heat.obj"
        position: Qt.vector3d(root.x, root.y, root.z)
        scale:  root.scale

        material : HeatmapMaterial {
            id: material
        }
    }
}
