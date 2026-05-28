//
//  Task.swift
//  Orbit
//
//  Created by Sevar Jafarli on 20.05.26.
//

import Foundation
import SwiftData

@Model class TaskModel {
    var title: String
    var isDone: Bool
    var createdAt: Date
    
    init(
        title: String,
        isDone: Bool,
        createdAt: Date = Date()
    ) {
        self.title = title
        self.isDone = isDone
        self.createdAt = createdAt
    }
    
    var project: ProjectModel?
}
