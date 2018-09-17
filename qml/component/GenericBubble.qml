import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import Spectral.Settings 0.1

Control {
    property bool highlighted: false
    property bool colored: false

    readonly property bool darkBackground: highlighted  ? true : MSettings.darkTheme
    readonly property color backgroundColor: MSettings.darkTheme ? "#242424" : "lightgrey"

    padding: 12

    AutoMouseArea {
        anchors.fill: parent

        onSecondaryClicked: {
            messageContextMenu.row = messageRow
            messageContextMenu.model = model
            messageContextMenu.popup()
        }
    }

    background: Rectangle { color: colored ? Material.accent : highlighted ? Material.primary : backgroundColor }
}