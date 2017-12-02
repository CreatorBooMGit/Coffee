import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 640
    title: qsTr("Coffee House")

    GridView {
        id: gridView1
        anchors.fill: parent

        property int countInRow: 4

        cellWidth: width / countInRow
        cellHeight: cellWidth

        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }

            ListElement {
                name: "Green1"
                colorCode: "green2"
            }

            ListElement {
                name: "Green2"
                colorCode: "green"
            }

            ListElement {
                name: "Green3"
                colorCode: "green"
            }

            ListElement {
                name: "blue"
                colorCode: "blue"
            }
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }

            ListElement {
                name: "Green1"
                colorCode: "green2"
            }

            ListElement {
                name: "Green2"
                colorCode: "green"
            }

            ListElement {
                name: "Green3"
                colorCode: "green"
            }

            ListElement {
                name: "blue"
                colorCode: "blue"
            }
        }

        delegate: GoodItem
        {
            width: gridView1.cellWidth
            height: gridView1.cellHeight
        }
    }
}
