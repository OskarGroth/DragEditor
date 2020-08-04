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
        DragContainerView(builder: builder) {
            HStack {
                Spacer()
                VStack(spacing: 60) {
                    Spacer()
                    HStack(spacing: 50) {
                        BoxDropView()
                        BoxDropView()
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
        }//.environmentObject(builder as DragBuilder) // Casting is important, otherwise Environment can't find it
    }
    
}
