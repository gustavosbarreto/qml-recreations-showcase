import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.2

Item {
    id: menu

    property bool active: false

    onActiveChanged: {
        if (active) {
            menu.state = "anchor-bottom";
        } else {
            menu.state = "anchor.top";
        }
    }

    states: [
        State {
            name: "anchor-top"
            AnchorChanges {
                target: rect
                anchors.top: list.top
            }
        },

        State {
            name: "anchor-bottom"
            AnchorChanges {
                target: rect
                anchors.top: menu.bottom
            }
        },

        State {
            when: dragArea.drag.active
            AnchorChanges {
                target: rect
                anchors.top: undefined
            }
        }
    ]

    transitions: Transition {
        AnchorAnimation {
            duration: 400
        }
    }

    ListView {
        id: list

        height: contentHeight
        opacity: rect.y / menu.height

        anchors {
            top: parent.top
            bottom: parent.bottom
            bottomMargin: 60
            left: parent.left
            leftMargin: 20
            rightMargin: 20
            right: parent.right
        }

        model: ListModel {
            ListElement {
                name: "Me ajuda"
                icon: "\ue8fd"
            }

            ListElement {
                name: "Perfil"
                icon: "\ue7ff"
            }

            ListElement {
                name: "Configurar cartão"
                icon: "\ue870"

            }

            ListElement {
                name: "Configurações do app"
                icon: "\ue32c"
            }
        }

        delegate: Item {
            width: parent.width
            height: 60

            Rectangle {
                anchors.top: parent.top
                width: parent.width
                height: 1
                color: "#fff"
                opacity: 0.2
                visible: index == 0
            }

            RowLayout {
                height: parent.height
                spacing: 10

                Text {
                    font.family: "Material Icons"
                    font.pixelSize: 22
                    color: "#fff"
                    text: model.icon
                }

                Text {
                    text: model.name
                    color: "#fff"
                    font.pixelSize: 14
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                anchors.top: parent.bottom
                width: parent.width
                height: 1
                color: "#fff"
                opacity: 0.2
            }
        }
    }

    Rectangle {
        color: "red"
        width: 100
        anchors.top: list.bottom
    }

    Rectangle {
        id: button
        border.color: Qt.rgba(255, 255, 255, 0.2)
        border.width: 1
        height: 40
        radius: 4
        color: "transparent"

        anchors {
            bottom: parent.bottom
            bottomMargin: 20
            left: parent.left
            leftMargin: 20
            right: parent.right
            rightMargin: 20
        }

        Text {
            font.weight: Font.Bold
            anchors.centerIn: parent
            text: "SAIR DO APP"
            color: "#fff"
        }
    }

    Rectangle {
        id: rect
        color: "#fff"
        height: list.height + button.height
        radius: 8
        width: parent.width

        anchors {
            left: parent.left
            leftMargin: 20
            right: parent.right
            rightMargin: 20
        }

        Drag.active: dragArea.drag.active

        MouseArea {
            id: dragArea
            anchors.fill: parent

            property bool dragActive: drag.active
            property int lastY: 0

            drag.target: parent
            drag.minimumY: list.y
            drag.maximumY: list.height + button.height + button.anchors.bottomMargin

            onReleased: {
                if (rect.y > list.y + 50 && !menu.active) {
                    menu.active = true
                } else {
                    menu.state = "anchor-top"
                    menu.active = false
                }
            }
        }

        Item {
            anchors.fill: parent
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: parent
            }

            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.right: parent.right
                anchors.rightMargin: 20

                Text {
                    text: "\ue227"
                    color: "#666"
                    font.family: "Material Icons"
                    font.pixelSize: 28
                }

                Text {
                    text: "\ue8f5"
                    color: "#666"
                    font.family: "Material Icons"
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignRight
                    Layout.alignment: Layout.Right
                    Layout.fillWidth: true
                }
            }

            Column {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.right: parent.right

                Text {
                    text: "Saldo disponível"
                    font.pixelSize: 13
                    font.family: "Helvetica"
                    color: "#999"
                }
                Text {
                    text: "R$ 1.983,00"
                    font.pixelSize: 32
                    font.family: "Helvetica"
                    color: "#333"
                }
            }

            Rectangle {
                width: parent.width
                height: 80
                anchors.bottom: parent.bottom
                color: "#eee"

                Text {
                    text: "Transferência de R$13,00 recebida de Luis Gustavo Barreto hoje às 08:00h"
                    wrapMode: Text.WordWrap
                    color: "#333"
                    font.pixelSize: 13
                    font.family: "Helvetica"
                    anchors.fill: parent
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }
}
