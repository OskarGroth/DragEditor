//
//  BoxDragDestinationVIew.swift
//  DragEditorDemo
//
//  Created by Oskar Groth on 2020-08-02.
//

import SwiftUI
import DragEditor

struct BoxDropView: View {
    
    @EnvironmentObject var builder: BoxBuilder
    
    let id = UUID()

    // This is annoying, but not sure how to avoid. EnvironmentObject won't work unless : DragBuilder
    var boxBuilder: BoxBuilder {
        return builder as! BoxBuilder
    }
    
    var body: some View {
        print("Update view")
        return DragDestinationView(id: id) {
            Rectangle()
                .background(Color.white)
                .overlay(Color.black.opacity((builder as! BoxBuilder).isHovered ? 0.5 : 0))
                .frame(width: 100, height: 100)
        }.environmentObject(builder)
    }
    
}
