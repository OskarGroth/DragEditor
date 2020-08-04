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
    
    @State var destinations: [UUID: CGRect] = [:]
    @State var coordinators: [UUID: DragCoordinator] = [:]

    let content: Content
    
    @State var lastDestination: UUID?
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            content
            .onPreferenceChange(DragCoordinatorPreferenceKey.self) { prefs in
                for pref in prefs {
                    coordinators[pref.viewId] = pref.coordinator
                }
            }
            .onPreferenceChange(BoundsPreferenceKey.self) { prefs in
                for pref in prefs {
                    self.destinations[pref.viewId] = geometry[pref.bounds]
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
            let location = geometry[data.location] // FIXME: Doesn't seem to be correct.
            guard let target = (destinations.min { [point = SIMD2(location)] in point.getSignedDistance(to: $0.value) }) else { return }
            coordinators[target.key]?.drag(id: data.viewId, target: target.key, targetRect: target.value, location: location)
            lastDestination = target.key
        } else if let target = lastDestination { // If we handled a drag without a dragging view, it was a drop
            coordinators[target]?.drop()
            lastDestination = nil
        }
    }
    
}
