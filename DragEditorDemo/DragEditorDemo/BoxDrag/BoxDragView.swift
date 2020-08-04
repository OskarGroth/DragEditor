//
//  BoxDragView.swift
//  DragEditorDemo
//
//  Created by Oskar Groth on 2020-07-30.
//

import SwiftUI
import DragEditor

struct BoxDragView: View {
    
    let builder = BoxBuilder()
    
    var body: some View {
        DragContainerView() {
            HStack {
                Spacer()
                VStack(spacing: 60) {
                    Spacer()
                    HStack(spacing: 50) {
                        ForEach(builder.colorWells) { box in
                            BoxDropView(id: box.id)
                        }
                    }
                    HStack(spacing: 20) {
                        ForEach(builder.library) { box in
                            BoxView(box: box)
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
            .environmentObject(builder)
        }.environment(\.dragCoordinator, builder)
    }
    
}
