# DragEditor
SwiftUI Drag and Drop editor

This is a library that implements drag & drop handling in SwiftUI

Why
The existing drag & drop support (via NSItemProvider) is partly broken (glitching preview images), very inflexible and clearly meant for inter-process communication.
I built this to create a better alternative for visual drag-drop editing within the same app.

These are the core concepts of the Drag Editor system:

- Allow the drag view and the destination drop view to be arbitrarily nested in your view hierarchy, as long as there is a DragContainerView enclosing them somewhere further up in the hierarchy.
- Drag view and destination drop view does not require any knowledge about each other.
- Allow multiple drag/destination views that work independently of each other.
- Each destination view will manage the drag/drop closest to it.
