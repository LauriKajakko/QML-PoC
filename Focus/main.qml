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
        rNested: ${rNested.focus} ${rNested.activeFocus}
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
    Rectangle {
        id: r2
        color: activeFocus ? "red" : "black"
        border.color: "pink"
        border.width: 4
        width: 200
        height: 200
        anchors.left: r1.right
        MouseArea {
            anchors.fill: parent
            onClicked: {
                r2.focus = true
                console.log("Clicked2", r1.focus, r1.activeFocus, r2.focus, r2.activeFocus, rNested.focus, rNested.activeFocus)
            }
        }
        Text {
            id: textSibling2
            anchors.centerIn: parent
            text: "Sibling2"
        }
        Rectangle {
            id: rNested
            color: activeFocus ? "red" : "black"
            border.color: "pink"
            border.width: 4
            width: 200
            height: 200
            anchors.left: parent.right
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rNested.focus = true
                    console.log("Clicked3", r1.focus, r1.activeFocus, r2.focus, r2.activeFocus, rNested.focus, rNested.activeFocus)
                }
            }
            Text {
                id: textChild
                anchors.centerIn: parent
                text: "Child"
            }
        }
    }
}
