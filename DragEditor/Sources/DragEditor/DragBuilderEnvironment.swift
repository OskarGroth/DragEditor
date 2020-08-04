//
//  DragBuilderEnvironment.swift
//  
//
//  Created by Oskar Groth on 2020-08-04.
//

import SwiftUI

public struct DragBuilderKey: EnvironmentKey {
    public static var defaultValue: DragBuilder = .init()
}

public extension EnvironmentValues {
    var dragBuilder: DragBuilder {
        get { self[DragBuilderKey.self] }
        set { self[DragBuilderKey.self] = newValue }
    }
}
