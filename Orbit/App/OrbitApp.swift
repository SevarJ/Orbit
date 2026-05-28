//
//  OrbitApp.swift
//  Orbit
//
//  Created by Sevar Jafarli on 20.05.26.
//

import SwiftUI
import SwiftData

@main
struct OrbitApp: App {

    var body: some Scene {
        WindowGroup {
                ProjectListView()
        }
        .modelContainer(for: ProjectModel.self)
    }
}
