//
//  ProjectDetailView.swift
//  Orbit
//
//  Created by Sevar Jafarli on 21.05.26.
//

import SwiftUI
import SwiftData

struct ProjectDetailView: View {
    @Environment(\.modelContext) private var context

    let project: ProjectModel

    @State private var newTaskTitle: String = ""

    var body: some View {
        VStack(spacing: 16) {
            // MARK: - Header
            ProjectIconView(icon: project.icon, color: project.color, size: 56)

            if !project.tasks.isEmpty {
                Text("\(project.doneTaskCount) of \(project.tasks.count) tasks completed")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                ProjectProgressView(
                    done: project.doneTaskCount,
                    total: project.tasks.count,
                    progress: project.taskProgress,
                    tintColor: project.color,
                    barWidth: 200,
                    showLabel: false
                )
            }

            // MARK: - Add Task
            HStack {
                TextField("New task...", text: $newTaskTitle)
                    .textFieldStyle(.roundedBorder)
                Button {
                    guard !newTaskTitle.trimmingCharacters(in: .whitespaces).isEmpty else { return }
                    let task = TaskModel(title: newTaskTitle, isDone: false)
                    project.tasks.append(task)
                    try? context.save()
                    newTaskTitle = ""
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(project.color)
                }
                .buttonStyle(.plain)
                .disabled(newTaskTitle.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding(.horizontal)

            // MARK: - Task List
            if project.tasks.isEmpty {
                Spacer()
                ContentUnavailableView(
                    "No tasks yet",
                    systemImage: "checklist",
                    description: Text("Add your first task above to get started.")
                )
                Spacer()
            } else {
                List {
                    ForEach(project.tasks) { task in
                        TaskRowView(
                            task: task,
                            tintColor: project.color,
                            onToggle: { task.isDone.toggle() }
                        )
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            context.delete(project.tasks[index])
                        }
                        try? context.save()
                    }
                }
            }
        }
        .navigationTitle(project.name)
    }
}
