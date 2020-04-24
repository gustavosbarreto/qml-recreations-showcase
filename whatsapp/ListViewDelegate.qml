import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.4

Item {
    width: parent.width
    height: 90

    RowLayout {
        anchors.fill: parent

        Item {
            width: 60
            height: width

            Image {
                id: profilePic
                source: model.image
                anchors.fill: parent
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: mask
                }
            }

            Rectangle {
                id: mask
                anchors.fill: parent
                radius: width / 2
                visible: false
            }
        }

        RowLayout {
            Layout.leftMargin: 10

            ColumnLayout {
                Text {
                    text: model.name
                    font.family: "Roboto"
                    font.pixelSize: 18
                    font.weight: Font.DemiBold
                }

                Text {
                    text: model.lastMessage
                    font.family: "Roboto"
                    font.pixelSize: 15
                    color: "#7E7E7E"
                    elide: Text.ElideRight
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width
                }
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignRight

                Text {
                    text: model.lastActivity
                    font.family: "Roboto"
                    font.pixelSize: 14
                    color: model.newMessages > 0 ? "#25D366" : "#7E7E7E"
                }

                Rectangle {
                    width: 24
                    height: 24
                    radius: width / 2
                    color: "#25D366"
                    Layout.alignment: Qt.AlignHCenter
                    opacity: model.newMessages > 0 ? 1 : 0

                    Text {
                        font.family: "Roboto"
                        font.pixelSize: 12
                        font.weight: Font.Bold
                        text: model.newMessages
                        color: "#fff"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill: parent
                    }
                }
            }
        }
    }

    Rectangle {
        anchors.left: parent.left
        anchors.leftMargin: 80
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 1
        color: index + 1 === parent.ListView.view.count ? "transparent" : "#E1E1E1"
    }
}
