# DragEditor
SwiftUI Drag and Drop editor

This is a library that implements drag & drop handling in SwiftUI.

![Image](https://i.imgur.com/XNAlfTc.gif)

## Why
The existing drag & drop support (via NSItemProvider) is partly broken (glitching preview images), very inflexible and clearly meant for inter-process communication.

I built this to create a better alternative for visual drag-drop editing within the same app.

## Core concepts

- Allow the drag view and the destination drop view to be arbitrarily nested in your view hierarchy, as long as there is a DragContainerView enclosing them somewhere further up in the hierarchy.
- Drag view and destination drop view does not require any knowledge about each other.
- Allow multiple drag/destination views that work independently of each other.
- Each destination view will manage the drag/drop closest to it.

## Issues
There is currently a bug where the conversion of the location anchor does not seem to match the conversion of the destination anchor. PR's welcome.

## Resources
https://swiftui-lab.com/communicating-with-the-view-tree-part-1/

https://swiftwithmajid.com/2020/03/18/anchor-preferences-in-swiftui/
