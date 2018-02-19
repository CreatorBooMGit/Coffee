import QtQuick 2.7
import QtQuick.Controls.Material 2.2
import "qrc:/parameters.js" as Parameters

Rectangle {
    id: rectangle

    property bool parentActive: false
    property string goodPositionNameValue: ""
    property string goodPositionPriceValue: ""

    anchors.left: parent.left
    anchors.right: parent.right

    color: parentActive ? Parameters.OrderPositionActiveColor : Parameters.OrderPositionColor
    height: 30

    Text {
        id: goodPositionName
        y: 8
        text: goodPositionNameValue
        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 16
    }

    Text {
        id: goodPositionPrice

        anchors {
            right: parent.right
            rightMargin: 10
            verticalCenter: parent.verticalCenter
        }

        text: goodPositionPriceValue
        font.pixelSize: 16
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
    }
}
