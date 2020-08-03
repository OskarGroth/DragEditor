//
//  DragDestinationView.swift
//  DraggyBoi
//
//  Created by Oskar Groth on 2020-07-29.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import SwiftUI

public struct DragDestinationView<Content: View>: View {
        
    @EnvironmentObject var builder: BoxBuilder
    
    let id: UUID
    let content: Content
    
    public init(id: UUID = UUID(), @ViewBuilder content: () -> Content) {
        self.id = id
        self.content = content()
    }
    
    public var body: some View {
        content
            .anchorPreference(key: BoundsPreferenceKey.self, value: .bounds, transform: { [BoundsPreferenceData(viewId: id, bounds: $0)] })
            .preference(key: DragBuilderPreferenceKey.self, value: [.init(viewId: id, builder: builder)])
    }
}
