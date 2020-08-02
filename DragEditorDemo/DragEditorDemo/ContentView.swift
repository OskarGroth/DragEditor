//
//  ContentView.swift
//  DragEditorDemo
//
//  Created by Oskar Groth on 2020-07-30.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        CustomTabView(
            tabBarPosition: .top,
            content: [
                (
                    tabText: "Box Drag",
                    tabIconName: "icons.general.home",
                    view: AnyView(BoxDragView())
                ),
                (
                    tabText: "Connect Four",
                    tabIconName: "icons.general.cog",
                    view: AnyView(ConnectFourView())
                )
            ]
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
