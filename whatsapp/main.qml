import QtQuick 2.12
import QtQuick.Controls 2.12 as Controls
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.4

Rectangle {
    width: 400
    height: 800

    Rectangle {
        id: header

        color: "#075E54"
        anchors.left: parent.left
        anchors.right: parent.right
        height: 110

        Text {
            text: "WhatsApp"
            font.family: "Roboto"
            font.pixelSize: 22
            font.weight: Font.DemiBold
            color: "#fff"
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
        }

        Controls.TabBar {
            id: tabBar
            height: 40
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            background: Rectangle {
                color: "transparent"
            }

            TabButton {
                id: tab
                text: "CONVERSAS"

                contentItem: Text {
                    text: tab.text
                    font.family: "Roboto"
                    font.pixelSize: 15
                    font.weight: Font.Bold
                    horizontalAlignment: Text.AlignHCenter
                    color: tab.checked ? "#fff" : "#A5BAB7"
                }

                background: Rectangle {
                    color: "#fff"
                    width: parent.width
                    height: 3
                    visible: tab.checked
                    anchors.bottom: parent.bottom
                }
            }

            TabButton {
                text: "STATUS"
            }

            TabButton {
                text: "CHAMADAS"
            }
        }
    }

    Controls.SwipeView {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        currentIndex: tabBar.currentIndex
        onCurrentIndexChanged: tabBar.currentIndex = currentIndex

        Item {
            ListView {
                clip: true
                anchors.fill: parent
                anchors.leftMargin: 15
                anchors.rightMargin: 15

                model: MessagesModel{}

                delegate: ListViewDelegate{
                }
            }
        }

        Rectangle {
            color: "blue"
        }

        Rectangle {
            color: "green"
        }
    }

    DropShadow {
        anchors.fill: header
        verticalOffset: 2
        radius: 10
        samples: 21
        color: "#80000000"
        source: header
    }
}
