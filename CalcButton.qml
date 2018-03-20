import Qt 4.6
 
 
 Rectangle {
    property alias operation: label.text
    property bool toggable: false
    property bool toggled: false
    signal clicked
    id: button; width: 80; height: 60
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
    MouseRegion {
        id: clickRegion
        anchors.fill: parent
        onClicked: {
            doOp(operation);
            button.clicked();
            if (!button.toggable) return;
            button.toggled ? button.toggled = false : button.toggled = true
        }
    }
    states: [
        State {
            name: "Pressed"; when: clickRegion.pressed == true
            PropertyChanges { target: img; scale: 2.0 }
            PropertyChanges { target: button; z: 1 }
            PropertyChanges { target: button.parent; z: 1 }
            PropertyChanges { target: button.parent.parent; z: 1 }
            PropertyChanges { target: img; z: 1.1 }
            PropertyChanges { target: img; opacity: 0 }
 
        }
    ]
        transitions: Transition {
            NumberAnimation { matchProperties: "z,scale"; easing: "easeOutExpo"; duration: 200 }
            NumberAnimation { matchProperties: "opacity"; easing: "easeInQuad"; duration: 300 }
 
        }
}    
