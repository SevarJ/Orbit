//
//  OrbitApp.swift
//  Orbit
//
//  Created by Sevar Jafarli on 20.05.26.
//

import SwiftUI

@main
struct OrbitApp: App {
    @State private var projectStore = ProjectStore()

    var body: some Scene {
        WindowGroup {
                ProjectListView()
                .environment(projectStore)
        }
    }
}
