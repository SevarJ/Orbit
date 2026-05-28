//
//  Task.swift
//  Orbit
//
//  Created by Sevar Jafarli on 20.05.26.
//

import Foundation

struct TaskModel: Identifiable, Equatable {
    let id: UUID = UUID()
    var title: String
    var isDone: Bool
    var createdAt: Date = Date()
}
