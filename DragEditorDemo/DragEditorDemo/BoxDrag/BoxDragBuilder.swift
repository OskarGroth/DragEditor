//
//  BoxDragBuilder.swift
//  DragEditorDemo
//
//  Created by Oskar Groth on 2020-07-30.
//

import DragEditor
import SwiftUI

final class BoxBuilder: DragBuilder {

    @Published var color = Color.white
    @Published var isHovered = false
    
    let library = [Box(color: .green), Box(color: .blue), Box(color: .pink), Box(color: .purple)]

    override func drag(id: UUID, location: CGPoint, destinationRect: CGRect) {
        isHovered = destinationRect.contains(location)
        print("Hovering \(isHovered)")
    }
    
    override func drop(id: UUID, location: CGPoint, destinationRect: CGRect) {
        print("Drop inside")
    }
    
}
