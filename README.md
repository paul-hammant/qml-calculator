# qml-calculator

Saved from http://wiki.maemo.org/QML-EnhancedCalcExample as their GForge isnt showing any source repos anymore: https://garage.maemo.org/projects/qmlexamples

Video of its use : https://www.youtube.com/watch?v=BGmw2IjLLv0

TODO:

1. Upgrade to more recent QML / Qt.
2. Make it work on Ubuntu Touch


## QML Calculator Modernization

The QML calculator in this repository has undergone significant modernization and refactoring to improve its structure, maintainability, and clarity. Key enhancements include:

1.  **Single File Consolidation**:
    *   The JavaScript logic originally in `calculator.js` was inlined into `calculator.qml`.
    *   The `CalcButton.qml` component was integrated directly into `calculator.qml` as an internal QML `Component`.
    *   This reduced the calculator's footprint to a single `calculator.qml` file.

2.  **Numpad Refactoring with Repeater**:
    *   The numeric keypad buttons (0-9, ., =) are now dynamically generated using a `Repeater` element in `calculator.qml`. This reduced boilerplate code and improved maintainability of the numpad layout.

3.  **Event Handling Refactoring**:
    *   The `MyCalcButton` component was enhanced with a `customClickHandler` property.
    *   Event handling for most command buttons (e.g., "C", "AC", "MC", "Sqrt", etc.) was moved to direct `onClicked` handlers on the button instances themselves.
    *   This decentralized button-specific logic and significantly streamlined the central `doOp` JavaScript function, which now primarily handles numeric input and pending arithmetic/equals operations.

These changes have resulted in a more organized, concise, and easier-to-understand QML calculator implementation.
