import QtQuick 2.4 
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
 
import "calculator.js" as Calc
 
 Rectangle {
    property alias operation: label.text
    property bool toggable: false
    property bool toggled: false
    signal clicked
    id: calcButton
    width: 80
    height: 60
    color: "black"
    BorderImage {
      id: img
      width: parent.width
      height: parent.height
      border.left: 14
      border.right: 14
      source:"Button_h.png"
      transformOrigin: Item.Center
    }
 
    BorderImage {
      id: bgimg
      width: parent.width
      height: parent.height
      border.left: 14
      border.right: 14      
      source:"Button.png"  
    }
    Text { id: label; anchors.centerIn: parent; color: palette.buttonText }
    MouseArea {
        id: clickRegion
        anchors.fill: parent
        onClicked: {
            Calc.doOp(operation);
            calcButton.clicked();
            if (!calcButton.toggable) return;
            calcButton.toggled ? calcButton.toggled = false : calcButton.toggled = true
        }
    }
    states: [
        State {
            name: "Pressed"; when: clickRegion.pressed == true
            PropertyChanges { target: img; scale: 2.0 }
            PropertyChanges { target: calcButton; z: 1 }
            PropertyChanges { target: calcButton.parent; z: 1 }
            PropertyChanges { target: calcButton.parent.parent; z: 1 }
            PropertyChanges { target: img; z: 1.1 }
            PropertyChanges { target: img; opacity: 0 }
 
        }
    ]
        transitions: Transition {
            NumberAnimation { property: "z,scale"; easing.type: Easing.OutExpo; duration: 200 }
            NumberAnimation { property: "opacity"; easing.type: Easing.InOutQuad; duration: 300 }
 
        }
}    
