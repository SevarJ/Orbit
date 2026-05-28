//
//  ProjectListView.swift
//  Orbit
//
//  Created by Sevar Jafarli on 20.05.26.
//

import SwiftUI

struct ProjectListView: View {
    @Environment(ProjectStore.self) var store

    @State private var showAddProject = false
    @State private var projectToEdit: ProjectModel?

    var body: some View {
        NavigationStack {
            Group {
                if store.projects.isEmpty {
                    ContentUnavailableView(
                        "No Projects",
                        systemImage: "folder",
                        description: Text("Tap + to create your first project.")
                    )
                } else {
                    List {
                        ForEach(store.projects) { project in
                            NavigationLink {
                                ProjectDetailView(projectID: project.id)
                            } label: {
                                ProjectRowView(project: project)
                            }
                            .contextMenu {
                                Button {
                                    projectToEdit = project
                                } label: {
                                    Label("Edit", systemImage: "pencil")
                                }
                                Button(role: .destructive) {
                                    store.delete(project)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                store.delete(store.projects[index])
                            }
                        }
                    }
                }
            }
            .navigationTitle("Orbit")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddProject = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddProject) {
                AddProjectView()
            }
            .sheet(item: $projectToEdit) { project in
                AddProjectView(editingProject: project)
            }
        }
        .padding()
    }
}
