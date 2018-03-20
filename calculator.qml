import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
 
 Rectangle {
    width: parent.width 
    height: 480 
    color: palette.window
    anchors.fill: parent
    SystemPalette { 
        id: palette 
    }
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
          CalcButton { 
              visible: advancedCheckBox.toggled == true
              operation: "Bksp"; 
              id: bksp; 
          }
        }
        Item {
            height:460; width: 420;
            Item {
                id: basicButtons
                x: advancedCheckBox.toggled == true ? 0 : 55 
                width: 460; height: 400
                Row {
                    id: commonOperations
                    spacing: 0
                    height: 150
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
            Grid {
   	            visible: advancedCheckBox.toggled == true
                id: advancedButtons
                x: 320; y: 0; spacing: 0; columns: 2
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
              visible: advancedCheckBox.toggled == true
              id: trigonometryOperations
              spacing: 0; y: 300; x:0
              CalcButton { operation: "Sin" }
              CalcButton { operation: "Cos" }
              CalcButton { operation: "Tan" }
              CalcButton { operation: "Log" }
              CalcButton { operation: "e^x" }
              CalcButton { operation: "x^y" }
            }
        }
    }
 
    transitions: Transition {
        NumberAnimation { property: "x,y,width"; easing.type: Easing.OutBounce; duration: 500 }
        NumberAnimation { property: "opacity"; easing.type: Easing.InOutQuad; duration: 500 }
    }
 }

