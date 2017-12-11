import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    ListView {
        id: gridView1
        anchors.fill: parent

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onClicked: {
                if (mouse.button === Qt.RightButton)
                    contextMenu.popup()
            }

            Menu {
                id: contextMenu
                MenuItem { text: "Cut" }
                MenuItem { text: "Copy" }
                MenuItem { text: "Paste" }
            }
        }

    }
}
