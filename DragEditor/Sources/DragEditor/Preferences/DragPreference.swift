//
//  DragPreferenceData.swift
//  DraggyBoi
//
//  Created by Oskar Groth on 2020-07-28.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import SwiftUI

struct DragPreferenceData: Equatable {
    let viewId: UUID
    let location: Anchor<CGPoint>
    let isDragging: Bool
    
    static func == (lhs: DragPreferenceData, rhs: DragPreferenceData) -> Bool {
        return false
    }
}

struct DragPreferenceKey: PreferenceKey {
    typealias Value = [DragPreferenceData]

    static var defaultValue: [DragPreferenceData] = []

    static func reduce(value: inout [DragPreferenceData], nextValue: () -> [DragPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}
