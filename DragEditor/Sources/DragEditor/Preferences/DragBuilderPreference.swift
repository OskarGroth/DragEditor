//
//  DragBuilderPreference.swift
//  DraggyBoi
//
//  Created by Oskar Groth on 2020-07-29.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import SwiftUI

public struct DragBuilderPreferenceData: Equatable {
    let viewId: UUID
    let builder: Binding<DragBuilder>
    
    public static func == (lhs: DragBuilderPreferenceData, rhs: DragBuilderPreferenceData) -> Bool {
        return false
    }
}

struct DragBuilderPreferenceKey: PreferenceKey {
    typealias Value = [DragBuilderPreferenceData]

    static var defaultValue: [DragBuilderPreferenceData] = []

    static func reduce(value: inout [DragBuilderPreferenceData], nextValue: () -> [DragBuilderPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}
