//
//  ProjectListView.swift
//  Orbit
//
//  Created by Sevar Jafarli on 20.05.26.
//

import SwiftUI
import SwiftData

struct ProjectListView: View {
    @Query var projects: [ProjectModel]
    @Environment(\.modelContext) private var context

    @State private var showAddProject = false
    @State private var projectToEdit: ProjectModel?

    var body: some View {
        NavigationStack {
            Group {
                if projects.isEmpty {
                    ContentUnavailableView(
                        "No Projects",
                        systemImage: "folder",
                        description: Text("Tap + to create your first project.")
                    )
                } else {
                    List {
                        ForEach(projects) { project in
                            NavigationLink {
                                ProjectDetailView(project: project)
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
                                    context.delete(project)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                context.delete(projects[index])
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
