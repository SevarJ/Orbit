//
//  ProjectStore.swift
//  Orbit
//
//  Created by Sevar Jafarli on 20.05.26.
//

import SwiftUI

@Observable class ProjectStore {
    var projects: [ProjectModel] = []

    // MARK: - Project CRUD

    func add(_ project: ProjectModel) {
        projects.append(project)
    }

    func update(_ project: ProjectModel) {
        guard let index = projects.firstIndex(where: { $0.id == project.id }) else { return }
        projects[index] = project
    }

    func delete(_ project: ProjectModel) {
        projects.removeAll(where: { $0.id == project.id })
    }

    // MARK: - Task CRUD

    func addTask(to projectID: UUID, title: String) {
        guard let index = projects.firstIndex(where: { $0.id == projectID }) else { return }
        let task = TaskModel(title: title, isDone: false)
        projects[index].tasks.append(task)
    }

    func toggleTask(_ taskID: UUID, in projectID: UUID) {
        guard let pIndex = projects.firstIndex(where: { $0.id == projectID }),
              let tIndex = projects[pIndex].tasks.firstIndex(where: { $0.id == taskID })
        else { return }
        projects[pIndex].tasks[tIndex].isDone.toggle()
    }

    func deleteTask(_ taskID: UUID, from projectID: UUID) {
        guard let pIndex = projects.firstIndex(where: { $0.id == projectID }) else { return }
        projects[pIndex].tasks.removeAll(where: { $0.id == taskID })
    }
}
