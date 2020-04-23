import QtQuick 2.0

Item {
    height: 100

    property bool active: true

    ListView {
        orientation: Qt.Horizontal
        spacing: 10
        clip: true
        anchors.fill: parent
        enabled: !parent.active

        model: ListModel {
            ListElement {
                name: "Indicar amigos"
                icon: "\ue7fe"
            }

            ListElement {
                name: "Cobrar"
                icon: "\ue0cb"
            }

            ListElement {
                name: "Depositar"
                icon: "\ue5db"
            }

            ListElement {
                name: "Transferir"
                icon: "\ue5d8"
            }

            ListElement {
                name: "Bloquear cartão"
                icon: "\ue897"
            }
        }

        delegate: Rectangle {
            width: 100
            height: 100
            color: Qt.rgba(255, 255, 255, 0.2)
            radius: 3

            Text {
                font.family: "Material Icons"
                font.pixelSize: 22
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                text: model.icon
                color: "#fff"
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                text: model.name
                color: "#fff"
                font.pixelSize: 13
                wrapMode: Text.WordWrap
            }
        }
    }
}
