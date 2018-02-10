import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Rectangle {
    ListView {
        contentHeight: 1600
        layoutDirection: Qt.LeftToRight
        clip: true
        anchors.fill: parent
        spacing: 5

        delegate: Order {
            anchors.right: parent.right
            anchors.left: parent.left
        }

        model: ListModel {
            ListElement {

            }

            ListElement {

            }
        }
    }
}
