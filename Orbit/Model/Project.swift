//
//  Project.swift
//  Orbit
//
//  Created by Sevar Jafarli on 20.05.26.
//

import SwiftUI
import SwiftData

@Model class ProjectModel {
    var name: String
    var icon: String
    var colorKey: String
    @Relationship(deleteRule: .cascade, inverse: \TaskModel.project)
    var tasks: [TaskModel]

    init(
        name: String,
        icon: String,
        colorKey: String,
        tasks: [TaskModel]
    ) {
        self.name = name
        self.icon = icon
        self.colorKey = colorKey
        self.tasks = tasks
    }
    var color: Color {
        AppDefaults.colorMap[colorKey] ?? .purple
    }

    var doneTaskCount: Int {
        tasks.count(where: { $0.isDone })
    }

    var taskProgress: Double {
        guard !tasks.isEmpty else { return 0.0 }
        return Double(doneTaskCount) / Double(tasks.count)
    }

    var isAllTasksCompleted: Bool {
        taskProgress == 1.0
    }
}
