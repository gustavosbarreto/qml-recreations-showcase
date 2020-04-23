import QtQuick 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: root

    width: 400
    height: 800
    color: "#82269E"

    FontLoader {
        source: "materialicons.ttf"
    }

    Item {
        height: 480
        width: parent.width
        anchors.centerIn: parent

        Header {
            id: header
        }

        Menu {
            id: menu
            z: 2

            anchors {
                top: header.bottom
                topMargin: 20
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
        }

        Tabs {
            active: menu.active
            z: 1
            anchors.top: parent.bottom
            anchors.bottomMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20
        }
    }
}
