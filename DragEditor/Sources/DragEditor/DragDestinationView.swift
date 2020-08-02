//
//  DragDestinationView.swift
//  DraggyBoi
//
//  Created by Oskar Groth on 2020-07-29.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import SwiftUI

public struct DragDestinationView<Content: View, Builder: DragBuilder>: View {
    
    @Binding var builder: Builder
    
    let id: UUID
    let content: Content
    
    public init(id: UUID = UUID(), builder: Binding<Builder>, @ViewBuilder content: () -> Content) {
        self.id = id
        self._builder = builder
        self.content = content()
    }
    
    public var body: some View {
        content
            .anchorPreference(key: BoundsPreferenceKey.self, value: .bounds, transform: { [BoundsPreferenceData(viewId: id, bounds: $0)] })
    }
}
