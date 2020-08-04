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
        //let hoveredDestination = destinations.first(where: { $0.value.contains(location) })?.key
        dragInfo = .init(draggedId: id, location: location, closestDestination: target, isInside: true)
    }
    
    open func drop() {
//        guard let id = dragInfo.draggedId, let location = dragInfo.location, let closest = dragInfo.closestDestination else { return }
//        if destinations[closest]?.contains(location) ?? false {
//            dropped(id: id, inside: closest, at: location)
//        }
        dragInfo = .init(draggedId: nil, location: nil, closestDestination: nil, isInside: false)
    }
    
    open func dropped(id: UUID, inside destinationId: UUID, at: CGPoint) {
        
    }
    
}
