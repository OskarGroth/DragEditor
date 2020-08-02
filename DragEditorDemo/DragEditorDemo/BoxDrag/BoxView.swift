//
//  BoxView.swift
//  DragEditorDemo
//
//  Created by Oskar Groth on 2020-08-02.
//

import SwiftUI
import DragEditor

struct BoxView: View {
    
    let box: Box
        
    var body: some View {
        DraggableView(id: box.id) {
            Rectangle()
                .fill(box.color)
                .frame(width: 50, height: 50)
        }
    }
    
}
