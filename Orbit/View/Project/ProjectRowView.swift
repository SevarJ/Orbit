//
//  ProjectRowView.swift
//  Orbit
//
//  Created by Sevar Jafarli on 20.05.26.
//

import SwiftUI

struct ProjectRowView: View {
    let project: ProjectModel

    var body: some View {
        HStack(spacing: 16) {
            ProjectIconView(icon: project.icon, color: project.color)

            VStack(alignment: .leading, spacing: 4) {
                Text(project.name)
                    .font(.headline)
                Text(project.tasks.isEmpty
                     ? "No tasks"
                     : project.isAllTasksCompleted ? "Completed" : "In progress")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            if !project.tasks.isEmpty {
                ProjectProgressView(
                    done: project.doneTaskCount,
                    total: project.tasks.count,
                    progress: project.taskProgress,
                    tintColor: project.color
                )
            }
        }
        .padding(.vertical, 4)
    }
}
