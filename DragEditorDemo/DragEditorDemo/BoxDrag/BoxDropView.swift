//
//  BoxDragDestinationVIew.swift
//  DragEditorDemo
//
//  Created by Oskar Groth on 2020-08-02.
//

import SwiftUI
import DragEditor

struct BoxDropView: View {
    
    @EnvironmentObject var boxBuilder: BoxBuilder
    
    let id = UUID()
    
    var body: some View {
        DragDestinationView(id: id) {
            Rectangle()
                .background(Color.white)
                .overlay(Color.black.opacity(boxBuilder.dragInfo.isInside && boxBuilder.dragInfo.closestDestination == id ? 0.5 : 0))
                .frame(width: 100, height: 100)
        }
    }
    
}
