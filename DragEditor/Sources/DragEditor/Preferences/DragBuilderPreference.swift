//
//  DragCoordinatorPreference.swift
//  DragEditor
//
//  Created by Oskar Groth on 2020-07-29.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import SwiftUI

public struct DragCoordinatorPreferenceData: Equatable {
    let viewId: UUID
    let coordinator: DragCoordinator
    
    public static func == (lhs: DragCoordinatorPreferenceData, rhs: DragCoordinatorPreferenceData) -> Bool {
        return lhs.viewId == rhs.viewId && lhs.coordinator === rhs.coordinator
    }
}

struct DragCoordinatorPreferenceKey: PreferenceKey {
    typealias Value = [DragCoordinatorPreferenceData]

    static var defaultValue: [DragCoordinatorPreferenceData] = []

    static func reduce(value: inout [DragCoordinatorPreferenceData], nextValue: () -> [DragCoordinatorPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}
