//
//  DragCoordinatorEnvironment.swift
//  
//
//  Created by Oskar Groth on 2020-08-04.
//

import SwiftUI

public struct DragCoordinatorKey: EnvironmentKey {
    public static var defaultValue: DragCoordinator = .init()
}

public extension EnvironmentValues {
    var dragCoordinator: DragCoordinator {
        get { self[DragCoordinatorKey.self] }
        set { self[DragCoordinatorKey.self] = newValue }
    }
}
