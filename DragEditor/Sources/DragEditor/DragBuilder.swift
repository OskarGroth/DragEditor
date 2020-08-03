//
//  DragBuilder.swift
//  DraggyBoi
//
//  Created by Oskar Groth on 2020-07-29.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import Foundation

public protocol DragBuilderBase: class {
    
    init()
    
    func drag(id: UUID, location: CGPoint, destinationRect: CGRect)
    
    func drop(id: UUID, location: CGPoint, destinationRect: CGRect)
    
}

open class DragBuilder: ObservableObject, DragBuilderBase {
    
    required public init() {
        
    }
    
    open func drag(id: UUID, location: CGPoint, destinationRect: CGRect) {
        fatalError("Implement in subclass!")
    }
    
    open func drop(id: UUID, location: CGPoint, destinationRect: CGRect) {
        fatalError("Implement in subclass!")
    }
    
    
}

public extension DragBuilder {

}

//open class BaseDragBuilder: DragBuilder {
//    
//    public typealias DragData = Any
//    
//    public var dataType: DragData.Type
//
//    
//    public init(dataType: DragData.Type) {
//        self.dataType = dataType
//    }
//    
//    public func drag(_ info: DragInfo) {
//        fatalError("Implement in subclass!")
//    }
//    
//    public func drop(_ info: DragInfo) {
//        fatalError("Implement in subclass!")
//    }
//    
//}

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
