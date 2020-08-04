//
//  DragContainerView.swift
//  DraggyBoi
//
//  Created by Oskar Groth on 2020-07-28.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import SwiftUI

public struct DragContainerView<Content: View>: View {
    
    @GestureState private var dragOffset = CGSize.zero
    
    @Environment(\.dragBuilder) var builder

    let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            VStack {
                content
            }
            .onPreferenceChange(BoundsPreferenceKey.self) { prefs in
                for pref in prefs {
                    self.builder.destinations[pref.viewId] = geometry[pref.bounds]
                }
            }
            // FIXME: This triggers "tried to update multiple times per frame" warnings
            // https://www.openradar.appspot.com/FB7558683
            .onPreferenceChange(DragPreferenceKey.self) { prefs in
                handleDrag(geometry, prefs)
            }
        }
    }
    
    func handleDrag(_ geometry: GeometryProxy, _ preferences: [DragPreferenceData]) {
        if let data = preferences.first(where: { $0.isDragging }) {
            builder.drag(id: data.viewId, location: geometry[data.location])
        } else {
            builder.drop()
        }
    }
    
}
