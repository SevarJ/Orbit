//
//  AddProjectView.swift
//  Orbit
//
//  Created by Sevar Jafarli on 20.05.26.
//

import SwiftUI

struct AddProjectView: View {
    @Environment(ProjectStore.self) var store
    @Environment(\.dismiss) var dismiss

    /// Pass an existing project to enter edit mode; leave nil for creation.
    var editingProject: ProjectModel?

    @State private var projectName: String = ""
    @State private var selectedIcon: String = AppDefaults.defaultIcon
    @State private var selectedColorKey: String = AppDefaults.defaultColorKey

    private var isEditing: Bool { editingProject != nil }

    private var selectedColor: Color {
        AppDefaults.colorMap[selectedColorKey] ?? .purple
    }

    var body: some View {
        VStack(spacing: 20) {
            // MARK: - Preview
            ProjectIconView(icon: selectedIcon, color: selectedColor, size: 64)
                .padding(.top, 8)

            // MARK: - Name
            TextField("Project name", text: $projectName)
                .textFieldStyle(.roundedBorder)

            // MARK: - Icon Picker
            VStack(alignment: .leading, spacing: 8) {
                Text("Icon")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6), spacing: 12) {
                    ForEach(AppDefaults.icons, id: \.self) { icon in
                        ZStack {
                            Circle()
                                .fill(selectedIcon == icon ? selectedColor.opacity(0.2) : .white.opacity(0.05))
                                .overlay(
                                    Circle()
                                        .stroke(selectedIcon == icon ? selectedColor : .clear, lineWidth: 2)
                                )
                                .frame(width: 44, height: 44)

                            Image(systemName: icon)
                                .foregroundStyle(selectedIcon == icon ? selectedColor : .secondary)
                        }
                        .onTapGesture {
                            selectedIcon = icon
                        }
                    }
                }
            }

            // MARK: - Color Picker
            VStack(alignment: .leading, spacing: 8) {
                Text("Color")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 12) {
                    ForEach(AppDefaults.colorKeys, id: \.self) { key in
                        let color = AppDefaults.colorMap[key] ?? .purple
                        ZStack {
                            Circle()
                                .fill(color)
                                .frame(width: 36, height: 36)

                            if selectedColorKey == key {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .frame(width: 42, height: 42)
                            }
                        }
                        .onTapGesture {
                            selectedColorKey = key
                        }
                    }
                }
            }

            // MARK: - Save
            Button {
                if var project = editingProject {
                    project.name = projectName
                    project.icon = selectedIcon
                    project.colorKey = selectedColorKey
                    store.update(project)
                } else {
                    store.add(
                        ProjectModel(
                            name: projectName,
                            icon: selectedIcon,
                            colorKey: selectedColorKey,
                            tasks: []
                        )
                    )
                }
                dismiss()
            } label: {
                Text(isEditing ? "Update" : "Save")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(selectedColor)
            .disabled(projectName.isEmpty)
        }
        .padding()
        .onAppear {
            if let project = editingProject {
                projectName = project.name
                selectedIcon = project.icon
                selectedColorKey = project.colorKey
            }
        }
    }
}
