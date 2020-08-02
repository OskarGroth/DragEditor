//
//  DragPosition.swift
//  DraggyBoi
//
//  Created by Oskar Groth on 2020-07-28.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import Foundation

public enum DragPosition: CustomStringConvertible {
    case left(UUID)
    case right(UUID)
    case above(UUID)
    case below(UUID)
    case inside(UUID)
    case outside

    public var description: String {
        switch self {
        case .left(let id):
            return "Drag Left of \(id)"
        case .right(let id):
            return "Drag Right of \(id)"
        case .above(let id):
            return "Drag Above \(id)"
        case .below(let id):
            return "Drag Below \(id)"
        case .inside(let id):
            return "Drag Inside of \(id)"
        case .outside:
            return "Drag is outside"
        }
    }
    
}
