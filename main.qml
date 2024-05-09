import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtQuick.Scene3D 2.0

ColumnLayout {

    Rectangle {
        id: scene
        Layout.fillHeight: true
        Layout.fillWidth: true
        color: "white"

        Scene3D {
            id: scene3d
            anchors.fill: parent
            anchors.margins: 10
            focus: true
            aspects: ["input", "logic"]
            cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

            //Loading ThreeDimensionalScene.qml for better code style
            ThreeDimensionalScene{}
        }
    }

    Item{
        Layout.fillWidth: true
        height: 50

    }


}
