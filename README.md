# DragEditor
SwiftUI Drag and Drop editor

This is a library that implements drag & drop handling in SwiftUI.

![Image](https://i.imgur.com/XNAlfTc.gif)

## Core concepts

- Allow the drag view and the destination drop view to be arbitrarily nested in your view hierarchy, as long as there is a DragContainerView enclosing them somewhere further up in the hierarchy.
- Drag view and destination drop view does not require any knowledge about each other.
- Allow multiple drag/destination views that work independently of each other.
- Each destination view will manage the drag/drop closest to it.

## Issues
- There is currently a bug where the conversion of the location anchor does not seem to match the conversion of the destination anchor, causing incorrect hover logic.
- Needs some way to handle the animation of a dragged view if the drop was successful.

PRs welcome.

## Resources
https://swiftui-lab.com/communicating-with-the-view-tree-part-1/

https://swiftwithmajid.com/2020/03/18/anchor-preferences-in-swiftui/
