import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import "qrc:/order.js" as OrderLogic

Item {
    id: order
    height: OrderLogic.calcHeight()

    Component.onCompleted: {
        OrderLogic.setOrder(order)
        OrderLogic.setOrderPositionsList(orderPositionsList)
    }

    Rectangle {
        id: rectOrderTop

        height: 30
        color: "#800000e9"
        z: 1

        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                OrderLogic.addOrderPosition();
            }
        }

        Text {
            id: text2
            y: 6

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 5
            }

            fontSizeMode: Text.FixedSize
            font.pixelSize: 12
            text: qsTr("№000000")
        }

        ColumnLayout {
            id: columnLayout

            anchors.top: parent.top
            anchors.topMargin: 1
            anchors.right: parent.right
            anchors.rightMargin: 3
            spacing: 0

            Text {
                id: text3
                text: qsTr("01/01/2018")
                Layout.fillWidth: false
                Layout.alignment: Qt.AlignRight | Qt.AlignBottom
                visible: true
            }

            Text {
                id: text4
                x: 0
                y: 0

                text: qsTr("00:00")
                Layout.rowSpan: 1
                Layout.alignment: Qt.AlignRight | Qt.AlignTop

                font.pixelSize: 12
            }
        }
    }

    Rectangle {
        id: rectOrderBottom

        height: 20
        color: "#800000e9"
        z: 1

        anchors {
            top: orderPositionsList.bottom
            left: parent.left
            right: parent.right
        }

        Text {
            id: text1

            anchors {
                left: parent.left
                leftMargin: 5
                bottom: parent.bottom
                bottomMargin: 3
                top: parent.top
                topMargin: 3
            }

            font.pixelSize: 12
            text: qsTr("Text")
        }
    }

    ColumnLayout {
        id: orderPositionsList
        spacing: 0
        clip: true

        anchors {
            top: rectOrderTop.bottom
            left: parent.left
            right: parent.right
        }
    }

}

