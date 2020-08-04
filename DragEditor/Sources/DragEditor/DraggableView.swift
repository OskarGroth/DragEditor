//
//  DraggableView.swift
//  DraggyBoi
//
//  Created by Oskar Groth on 2020-07-28.
//  Copyright © 2020 Oskar Groth. All rights reserved.
//

import SwiftUI

public struct DraggableView<Content: View>: View {
    
    @GestureState private var dragLocation = CGPoint.zero
    @GestureState private var dragOffset: CGSize? = nil
    @GestureState private var isDragging = false
        
    let content: Content
    let id: UUID
    
    public init(id: UUID, @ViewBuilder content: () -> Content) {
        self.id = id
        self.content = content()
    }
    
    public var body: some View {
        content
            .contentShape(Rectangle())
            .offset(x: dragOffset?.width ?? 0, y: dragOffset?.height ?? 0)
            .animation(dragLocation == .zero ? .interactiveSpring(response: 0.25) : .none)
            .gesture(
                DragGesture(minimumDistance: 1)
                    .updating(self.$dragLocation, body: { (value, state, transaction) in
                        state = value.location
                    })
                    .updating(self.$dragOffset, body: { (value, state, transaction) in
                        state = value.translation
                    })
                    .updating(self.$isDragging, body: { (value, state, transaction) in
                        state = true
                    })
            )
            .shadow(color: isDragging ? Color.black.opacity(0.75) : .clear, radius: 5, x: 0, y: 2)
            .scaleEffect(isDragging ? 0.75 : 1.0)
            .animation(.interactiveSpring(response: 0.25))
            .background(
                Group {
                    if isDragging {
                        content
                            .opacity(0.35)
                    } else {
                        EmptyView()
                    }
                }
                .animation(isDragging ? .none : .easeIn)
            )
            .anchorPreference(key: DragPreferenceKey.self, value: .point(dragLocation), transform: { [DragPreferenceData(viewId: id, location: $0, isDragging: isDragging)] })
            .zIndex(isDragging ? 1 : 0)
    }
}
