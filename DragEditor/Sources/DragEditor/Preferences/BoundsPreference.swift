//
//  BoundsPreference.swift
//  DraggyBoi
//
//  Created by Oskar Groth on 2020-07-29.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import SwiftUI

public struct BoundsPreferenceData: Equatable {
    public static func == (lhs: BoundsPreferenceData, rhs: BoundsPreferenceData) -> Bool {
        return false
    }
    
    let viewId: UUID
    let bounds: Anchor<CGRect>
}

struct BoundsPreferenceKey: PreferenceKey {
    typealias Value = [BoundsPreferenceData]

    static var defaultValue: [BoundsPreferenceData] = []

    static func reduce(value: inout [BoundsPreferenceData], nextValue: () -> [BoundsPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}
