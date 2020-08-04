//
//  BoxBuilder.swift
//  DragEditorDemo
//
//  Created by Oskar Groth on 2020-07-30.
//

import DragEditor
import SwiftUI

class BoxBuilder: DragCoordinator {
        
    let library = [Box(color: .green), Box(color: .blue), Box(color: .pink), Box(color: .purple)]
    
    @Published var colorWells = [Box(color: .white), Box(color: .white)]

//    override func drag(id: UUID, location: CGPoint) {
//        super.drag(id: id, location: location)
//    }
    
    override func drop() {
        super.drop()
    }
    
//    override func dropped(id: UUID, inside destinationId: UUID, at: CGPoint) {
//        guard let wellIndex = colorWells.firstIndex(where: { $0.id == destinationId }) else { return }
//        colorWells[wellIndex].color = library.first(where: { $0.id == id })?.color ?? .white
//    }
    
}
