import QtQuick 2.0
import com.coffee.main 1.0
import "qrc:/goodItem.js" as GoodItemLogic

Item {
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

        //        Rectangle {
        //            id: itemImage
        //            //                    width: parent.parent.width - 30
        //            //                    height: parent.parent.height - 30

        //            anchors {
        //                top: parent.top
        //                topMargin: 10
        //                bottom: itemText.top
        //                bottomMargin: 5
        //                horizontalCenter: parent.horizontalCenter
        //            }

        //            width: height
        //            radius: 5

        //            color: "red"
        //        }

        Image {
            id: itemImage

            anchors {
                top: parent.top
                topMargin: 10
                bottom: itemText.top
                bottomMargin: 5
                horizontalCenter: parent.horizontalCenter
            }

            width: height
            source: image_name
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: itemText

            height: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter

            text: name
            font.pixelSize: 16
        }
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
        }
    }

}
