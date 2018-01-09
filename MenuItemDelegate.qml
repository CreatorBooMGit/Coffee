import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import com.coffee.main 1.0

Component {
    id: menuItemDelegate
    
    Rectangle {
        width: 180
        height: 40

        anchors {
            right: parent.right
            left: parent.left
        }

        Text {
            id: contentField
            text: contentFieldText
            
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.right
                
                topMargin: 10
                bottomMargin: 10
                leftMargin: 20
            }
            
            verticalAlignment: Qt.AlignVCenter
            font.pixelSize: 16
        }
        
//        color: menuItemMouseArea.pressed ? "red" : "white"
        
        MouseArea {
            id: menuItemMouseArea
            anchors.fill: parent
            hoverEnabled: true
            
            onClicked: {
                console.log("click")
                drawer.close()
            }
            
//            onEntered: {
//                parent.color = "#F0F0F0"
//            }
            
//            onExited: {
//                parent.color = "white"
//            }
        }
    }
}
