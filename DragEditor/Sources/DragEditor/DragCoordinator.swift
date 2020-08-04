//
//  DragCoordinator.swift
//  DragEditor
//
//  Created by Oskar Groth on 2020-07-29.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import SwiftUI

open class DragCoordinator: ObservableObject {
    
    public struct DragInfo {
        public var draggedId: UUID?
        public var location: CGPoint?
        public var closestDestination: UUID?
        public var isInside: Bool
    }
    
    @Published public var dragInfo: DragInfo = DragInfo(draggedId: nil, location: nil, closestDestination: nil, isInside: false)

    required public init() {
        
    }
    
    open func drag(id: UUID, target: UUID, targetRect: CGRect, location: CGPoint) {
        dragInfo = .init(draggedId: id, location: location, closestDestination: target, isInside: targetRect.contains(location))
    }
    
    open func drop() {
        guard let id = dragInfo.draggedId, let location = dragInfo.location, let target = dragInfo.closestDestination else { return }
        if dragInfo.isInside {
            dropped(id: id, inside: target, at: location)
        }
        dragInfo = .init(draggedId: nil, location: nil, closestDestination: nil, isInside: false)
    }
    
    open func dropped(id: UUID, inside destinationId: UUID, at: CGPoint) {
        // Implement in subclass
    }
    
}
