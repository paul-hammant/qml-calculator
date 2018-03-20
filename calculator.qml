import Qt 4.6
 
 Rectangle {
    width: parent.width; height: 480; color: palette.window
    anchors.fill: parent;
    SystemPalette { id: palette }
    Script { source: "calculator.js" }
    Column {
        x: 2; spacing: 2;
        Row {
          id: numericOperations
          spacing: 2
          Rectangle {
              id: container
              width: 400; height: 55
              border.color: palette.dark; color: palette.base
 
              Text {
                  id: curNum
                  font.bold: true; font.pointSize: 22
                  color: palette.text
                  anchors.right: container.right
                  anchors.rightMargin: 5
                  anchors.verticalCenter: container.verticalCenter
              }
 
              Text {
                  id: currentOperation
                  color: palette.text
                  font.bold: true; font.pointSize: 26
                  anchors.left: container.left
                  anchors.leftMargin: 5
                  anchors.verticalCenter: container.verticalCenter
              }
 
          }
          CalcButton { operation: "Bksp"; id: bksp; opacity: 0 }
        }
        Item {
            height:460; width: 420;
 
            Item {
                id: basicButtons
                x: 55; width: 460; height: 400
                Row {
                    id: commonOperations
                    spacing: 0
                    height:150
 
                    CalcButton { 
                        operation: "Advanced"
                        id: advancedCheckBox
                        width: 160
                        toggable: true
                    }
                    CalcButton { operation: "C"; id: c; }
                    CalcButton { operation: "AC"; id: ac;}
 
                }
                Grid {
                    id: numKeypad; y:60; spacing: 0; columns: 3
                    CalcButton { operation: "7" }
                    CalcButton { operation: "8" }
                    CalcButton { operation: "9" }
                    CalcButton { operation: "4" }
                    CalcButton { operation: "5" }
                    CalcButton { operation: "6" }
                    CalcButton { operation: "1" }
                    CalcButton { operation: "2" }
                    CalcButton { operation: "3" }
                    CalcButton { operation: "0" }
                    CalcButton { operation: "." }
                    CalcButton { operation: "=" }                    
                }
                Column {
                    id: simpleOperations
                    x: 240;  y: 60; spacing: 0
                    CalcButton { operation: "x" }
                    CalcButton { operation: "/" }
                    CalcButton { operation: "-" }
                    CalcButton { operation: "+" }
                }
            }
                id: advancedButtons
                x: 250; spacing: 0; columns: 2; opacity: 0
                CalcButton { operation: "Abs" }
                CalcButton { operation: "Int" }
                CalcButton { operation: "MC" }
                CalcButton { operation: "Sqrt" }
                CalcButton { operation: "MR" }
                CalcButton { operation: "^2" }
                CalcButton { operation: "MS" }
                CalcButton { operation: "1/x" }
                CalcButton { operation: "M+" }
                CalcButton { operation: "+/-" }
            }
            Row {
              id: trigonometryOperations
              spacing: 0;opacity: 0;y: 280;x:40
              CalcButton { operation: "Sin" }
              CalcButton { operation: "Cos" }
              CalcButton { operation: "Tan" }
              CalcButton { operation: "Log" }
              CalcButton { operation: "e^x" }
              CalcButton { operation: "x^y" }
            }
        }
    }
 
    states: State {
        name: "Advanced"; when: advancedCheckBox.toggled == true
        PropertyChanges { target: basicButtons; x: 0 }
        PropertyChanges { target: bksp; opacity: 1 }
        PropertyChanges { target: commonOperations; x: 0;  }
        PropertyChanges { target: advancedButtons; x: 320; opacity: 1 }
        PropertyChanges { target: trigonometryOperations; x:0; y: 300; opacity: 1 }
 
    }
    transitions: Transition {
        NumberAnimation { matchProperties: "x,y,width"; easing: "easeOutBounce"; duration: 500 }
        NumberAnimation { matchProperties: "opacity"; easing: "easeInOutQuad"; duration: 500 }
    }
 }    
        
