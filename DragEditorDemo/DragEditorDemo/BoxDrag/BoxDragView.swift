//
//  BoxDragView.swift
//  DragEditorDemo
//
//  Created by Oskar Groth on 2020-07-30.
//

import SwiftUI
import DragEditor

struct BoxDragView: View {
    
    @State var builder: BoxBuilder = BoxBuilder()
    
    // This is annoying, but not sure how to avoid. EnvironmentObject won't work unless : DragBuilder
    var boxBuilder: BoxBuilder {
        return builder as! BoxBuilder
    }

    var body: some View {
        DragContainerView {
            HStack {
                Spacer()
                VStack(spacing: 60) {
                    Spacer()
                    HStack(spacing: 50) {
                        BoxDropView().environmentObject(builder)
                        BoxDropView().environmentObject(builder)
                    }
                    HStack(spacing: 20) {
                        ForEach(boxBuilder.library) { box in
                            BoxView(box: box)
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
}
