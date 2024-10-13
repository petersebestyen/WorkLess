//
//  WorkLessApp.swift
//  WorkLess
//  Hacking with Swift
//

import SwiftUI

@main
struct WorkLessApp: App {
    @StateObject private var data = DataController()

    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Activities", systemImage: "figure.play")
                    }

                AboutView()
                    .tabItem {
                        Label("How it Works", systemImage: "questionmark.circle")
                    }
            }
            .environmentObject(data)
        }
    }
}

#Preview {
        TabView {
            ContentView()
                .tabItem {
                    Label("Activities", systemImage: "figure.play")
                }

            AboutView()
                .tabItem {
                    Label("How it Works", systemImage: "questionmark.circle")
                }
        }
        .environmentObject(DataController())
}
