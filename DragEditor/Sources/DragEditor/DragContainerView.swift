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
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            VStack {
                content
            }
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
            let location = geometry[data.location]
            guard let target = destinations.first(where: { $0.value.contains(location) }) else { return }
            coordinators[target.key]?.drag(id: data.viewId, target: target.key, targetRect: target.value, location: location)
        } else {
            //builder.drop()
        }
    }
    
}
