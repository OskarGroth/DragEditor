//
//  DragBuilder.swift
//  DraggyBoi
//
//  Created by Oskar Groth on 2020-07-29.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import SwiftUI

open class DragBuilder: ObservableObject {
    
    public struct DragInfo {
        public var draggedId: UUID?
        public var location: CGPoint?
        public var closestDestination: UUID?
        public var isInside: Bool
    }
    // Needs at least one Published value for subclasses publishers to fire. FB8256902
    
    @Published public var dragInfo: DragInfo = DragInfo(draggedId: nil, location: nil, closestDestination: nil, isInside: false)
    @Published public var destinations: [UUID: CGRect] = [:]

    required public init() {
        
    }
    
    open func drag(id: UUID, location: CGPoint) {
        let hoveredDestination = destinations.first(where: { $0.value.contains(location) })?.key
        dragInfo = .init(draggedId: id, location: location, closestDestination: hoveredDestination, isInside: hoveredDestination != nil)
    }
    
    open func drop() {
        guard let id = dragInfo.draggedId, let location = dragInfo.location else { return }
        print("Dropped")
        dragInfo = .init(draggedId: nil, location: nil, closestDestination: nil, isInside: false)
    }
    
}
