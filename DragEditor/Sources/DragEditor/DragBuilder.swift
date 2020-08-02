//
//  DragBuilder.swift
//  DraggyBoi
//
//  Created by Oskar Groth on 2020-07-29.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import Foundation

public protocol DragBuilder {
    func proposedDragPosition(at point: CGPoint, itemBounds: [CGRect]) -> DragPosition?
    func indicatorRect(for position: DragPosition) -> CGRect
    func performDrop(_ position: DragPosition) -> Bool
}


//open class DragBuilder: ObservableObject {
//    
//    
//    func updateState(for dragPoint: CGPoint, itemBounds: [CGRect]) {
//        print("Implement in subclass")
//    }
//    
//    func performDrop(at position: CGPoint)
//    
//    
//}
