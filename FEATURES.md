# Orbit — Feature Checklist

A task/project management app for visionOS.

---

## P0 — Core — DONE

- [x] Fix division by zero crash in `taskProgress`
- [x] Replace emoji with SF Symbols (`icon: String`)
- [x] Store color as string key (`colorKey: String`) with computed `color` property
- [x] SF Symbol picker grid in AddProjectView (12 icons)
- [x] Color palette expanded to 10 colors
- [x] Constants centralized in `AppDefaults` enum
- [x] Add tasks to a project (text field + button in detail view)
- [x] Toggle task completion (tappable checkboxes)
- [x] Delete projects (swipe-to-delete + context menu)
- [x] Delete tasks (swipe-to-delete)
- [x] Edit project (context menu → reuses AddProjectView in edit mode)
- [x] Empty states for project list and task list
- [x] `createdAt` added to `TaskModel`
- [x] Full CRUD in `ProjectStore` (add/update/delete projects, add/toggle/delete tasks)
- [x] Sample data removed — app launches empty

---

## P2 — Persistence (next up)

### SwiftData Integration
- Make `ProjectModel` and `TaskModel` into `@Model` classes (SwiftData)
- Replace `ProjectStore`'s in-memory array with SwiftData queries
- Add a `ModelContainer` to `OrbitApp`

---

## P3 — visionOS Features (make it spatial)

### Ornaments
- Add an ornament to `ProjectDetailView` showing the project icon + progress ring

### Volume for Project Overview
- Create a 3D volume view showing projects as floating objects in space

### Immersive Focus Mode
- Offer an immersive space option when inside a project
- Dim the surroundings and show just the task list in a focused environment

---

## Current Data Model

```
ProjectModel: id, name, icon (SF Symbol), colorKey (String), tasks[]
  - Computed: color, doneTaskCount, taskProgress, isAllTasksCompleted
  - Conforms to: Identifiable, Hashable

TaskModel: id, title, isDone, createdAt
  - Conforms to: Identifiable
```

## File Structure

```
Orbit/
├── App/
│   ├── OrbitApp.swift          — Entry point, injects ProjectStore
│   └── AppDefaults.swift       — SF Symbol list, color palette, color map
├── Model/
│   ├── Project.swift           — ProjectModel struct
│   └── Task.swift              — TaskModel struct
├── ViewModel/
│   └── ProjectStore.swift      — @Observable store with full CRUD
├── View/
│   └── Project/
│       ├── ProjectListView.swift     — List + nav + add/edit/delete
│       ├── ProjectRowView.swift      — Row with icon, name, progress
│       ├── ProjectDetailView.swift   — Header, add task, task list with toggle/delete
│       └── AddProjectView.swift      — Create/edit form with icon + color pickers
└── Resources/
    └── Constants.swift         — ⚠️ DELETE THIS (superseded by AppDefaults.swift)
```
