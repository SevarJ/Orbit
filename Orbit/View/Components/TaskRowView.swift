//
//  TaskRowView.swift
//  Orbit
//
//  Created by Sevar Jafarli on 28.05.26.
//

import SwiftUI

struct TaskRowView: View {
    let task: TaskModel
    let tintColor: Color
    var onToggle: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Button {
                onToggle()
            } label: {
                Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                    .font(.title3)
                    .foregroundStyle(task.isDone ? tintColor : .secondary)
            }
            .buttonStyle(.plain)

            Text(task.title)
                .strikethrough(task.isDone)
                .foregroundStyle(task.isDone ? .secondary : .primary)
        }
    }
}
