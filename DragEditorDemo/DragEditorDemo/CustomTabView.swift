//
//  CustomTabView.swift
//  DragEditorDemo
//
//  Created by Oskar Groth on 2020-07-30.
//

import SwiftUI

// https://stackoverflow.com/questions/60674035/swiftui-custom-tab-view-for-macos-ios

public extension Color {

    static var backgroundColor: Color {
        #if os(macOS)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color(UIColor.systemBackground)
        #endif
    }
    static var secondaryBackgroundColor: Color {
        #if os(macOS)
        return Color(NSColor.controlBackgroundColor)
        #else
        return Color(UIColor.secondarySystemBackground)
        #endif
    }
}

public struct CustomTabView: View {

    public enum TabBarPosition { // Where the tab bar will be located within the view
        case top
        case bottom
    }

    private let tabBarPosition: TabBarPosition
    private let tabText: [String]
    private let tabIconNames: [String]
    private let tabViews: [AnyView]

    @State private var selection = 0

    public init(tabBarPosition: TabBarPosition, content: [(tabText: String, tabIconName: String, view: AnyView)]) {
        self.tabBarPosition = tabBarPosition
        self.tabText = content.map{ $0.tabText }
        self.tabIconNames = content.map{ $0.tabIconName }
        self.tabViews = content.map{ $0.view }
    }

    public var tabBar: some View {
        HStack {
            Spacer()
            ForEach(0..<tabText.count) { index in
                HStack {
                    Image(self.tabIconNames[index])
                    Text(self.tabText[index])
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
                .padding()
                .foregroundColor(self.selection == index ? Color.accentColor : Color.primary)
                .background(Color.secondaryBackgroundColor)
                .onTapGesture {
                    self.selection = index
                }
            }
            Spacer()
        }
        .padding(0)
        .background(Color.secondaryBackgroundColor) // Extra background layer to reset the shadow and stop it applying to every sub-view
        .shadow(color: Color.clear, radius: 0, x: 0, y: 0)
        .background(Color.secondaryBackgroundColor)
        .shadow(
            color: Color.black.opacity(0.25),
            radius: 3,
            x: 0,
            y: tabBarPosition == .top ? 1 : -1
        )
        .zIndex(99) // Raised so that shadow is visible above view backgrounds
    }
    public var body: some View {

        VStack(spacing: 0) {

            if (self.tabBarPosition == .top) {
                tabBar
            }

            tabViews[selection]
                .padding(0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            if (self.tabBarPosition == .bottom) {
                tabBar
            }
        }
        .padding(0)
    }
}
