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
    @State var builders: [UUID: DragBuilder] = [:]
    
    @State var dragInfo: (id: UUID, location: CGPoint)? = nil

    let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            VStack {
                content
            }
            .onPreferenceChange(DragBuilderPreferenceKey.self) { prefs in
                for pref in prefs {
                    builders[pref.viewId] = pref.builder
                }
            }
            .onPreferenceChange(BoundsPreferenceKey.self) { prefs in
                for pref in prefs {
                    self.destinations[pref.viewId] = geometry[pref.bounds]
                }
            }
            // This might trigger "tried to update multiple times per frame" warnings, but is considered harmless and SwiftUI internal bug.
            // https://www.openradar.appspot.com/FB7558683
            .onPreferenceChange(DragPreferenceKey.self) { prefs in
                handleDrag(geometry, prefs)
            }
        }
    }
    
    func handleDrag(_ geometry: GeometryProxy, _ preferences: [DragPreferenceData]) {
        if let data = preferences.first(where: { $0.isDragging }) {
            let location = geometry[data.location]
            dragInfo = (data.viewId, location)
            guard let destination = destinations.first(where: { $0.value.contains(location) }) else {
                return
            }
            builders[destination.key]?.drag(id: data.viewId, location: location, destinationRect: destination.value)
        } else {
            guard let dropInfo = dragInfo, preferences.contains(where: { $0.viewId == dropInfo.id }) else { return }
            handleDrop(at: dropInfo.location, id: dropInfo.id)
            dragInfo = nil
        }
    }
    
    func handleDrop(at location: CGPoint, id: UUID) {
        guard let destination = destinations.first(where: { $0.value.contains(location) }) else {
            return
        }
        builders[destination.key]?.drop(id: id, location: location, destinationRect: destination.value)
    }
    
}
