//
//  BoxDragBuilder.swift
//  DragEditorDemo
//
//  Created by Oskar Groth on 2020-07-30.
//

import DragEditor
import SwiftUI

class BoxBuilder: DragBuilder {
    
    @Published var color = Color.white
    
    let library = [Box(color: .green), Box(color: .blue), Box(color: .pink), Box(color: .purple)]

    override func drag(id: UUID, location: CGPoint) {
        super.drag(id: id, location: location)
    }
    
    override func drop() {
        super.drop()
    }
    
}

//class BoxBuilder: DragBuilder {
//
//    @Published var color = Color.white
//    @Published var isHovered = false {
//        willSet { objectWillChange.send() }
//    }
//
//    let library = [Box(color: .green), Box(color: .blue), Box(color: .pink), Box(color: .purple)]
//
//    override func drag(id: UUID, location: CGPoint, destinationRect: CGRect) {
//        isHovered = destinationRect.contains(location)
//        print("Hovering \(isHovered)")
//    }
//
//    override func drop(id: UUID, location: CGPoint, destinationRect: CGRect) {
//        print("Drop inside")
//    }
//
//}
