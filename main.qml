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

        property int countInRow: 6

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

        delegate: Item {
            width: gridView1.cellWidth
            height: gridView1.cellHeight

            Rectangle {
                anchors {
                    top: parent.top;
                    bottom: parent.bottom;
                    right: parent.right;
                    left: parent.left;
                    topMargin: 5;
                    bottomMargin: 5;
                    leftMargin: 5;
                    rightMargin: 5;
                }

                border.color: "#000000"
                border.width: 1
                radius: 10

                Rectangle {
                    id: itemImage
//                    width: parent.parent.width - 30
//                    height: parent.parent.height - 30

                    anchors {
                        top: parent.top
                        topMargin: 10
                        bottom: itemText.top
                        bottomMargin: 5
                        horizontalCenter: parent.horizontalCenter
                    }

                    width: height
                    radius: 5

                    color: colorCode
                }

                Text {
                    id: itemText

                    height: 20
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: "goodName"
                    font.pixelSize: 16
                }
            }

        }
    }
}
