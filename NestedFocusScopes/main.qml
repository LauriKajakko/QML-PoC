import QtQuick 2.14

FocusScope {
    id: root
    width: 600
    height: 600
    focus: true
    Text {
        id: text
        anchors.centerIn: parent
        text: show()
    }
    function show() {
        return `
        r1: ${r1.focus} ${r1.activeFocus}
        r2: ${r2.focus} ${r2.activeFocus}
        rNested1: ${rNested1.focus} ${rNested1.activeFocus}
        rNested2: ${rNested2.focus} ${rNested2.activeFocus}
        rNested2_1: ${rNested2_1.focus} ${rNested2_1.activeFocus}
        `
    }
    Rectangle {
        id: r1
        color: activeFocus ? "red" : "black"
        border.color: "pink"
        border.width: 4
        width: 200
        height: 200
        MouseArea {
            anchors.fill: parent
            onClicked: {
                r1.focus = true
            }
        }
        Text {
            id: textSibling1
            anchors.centerIn: parent
            text: "Sibling1"
        }
    }
    FocusScope {
        id: r2
        width: 200
        height: 200
        anchors.left: r1.right
        MouseArea {
            anchors.fill: parent
            onClicked: {
                r2.focus = true
            }
        }
        Text {
            id: textSibling2
            anchors.centerIn: parent
            text: "Sibling2"
        }
        Rectangle {
            id: rNested1
            color: activeFocus ? "red" : "black"
            border.color: "pink"
            border.width: 4
            width: 200
            height: 100
            anchors.left: parent.right
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rNested1.focus = true
                }
            }
            Text {
                id: textChild1
                anchors.centerIn: parent
                text: "Child"
            }
        }
        FocusScope {
            id: rNested2
            width: 100
            height: 100
            anchors.left: parent.right
            anchors.top: rNested1.bottom
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rNested2.focus = true
                }
            }
            Text {
                id: textChild2
                anchors.centerIn: parent
                text: "Child"
            }
            Rectangle {
                id: rNested2_1
                color: activeFocus ? "red" : "black"
                border.color: "pink"
                border.width: 4
                width: 100
                height: 100
                anchors.left: parent.right
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        rNested2_1.focus = true
                    }
                }
                Text {
                    id: textChild2_1
                    anchors.centerIn: parent
                    text: "Child"
                }
            }
        }
    }
}
