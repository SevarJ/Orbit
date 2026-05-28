//
//  AppDefaults.swift
//  Orbit
//
//  Created by Sevar Jafarli on 28.05.26.
//

import SwiftUI

enum AppDefaults {

    // MARK: - SF Symbols

    static let icons: [String] = [
        "person.fill",
        "folder.fill",
        "star.fill",
        "book.fill",
        "lightbulb.fill",
        "hammer.fill",
        "leaf.fill",
        "heart.fill",
        "gamecontroller.fill",
        "music.note",
        "camera.fill",
        "globe"
    ]

    static let defaultIcon = "person.fill"

    // MARK: - Colors

    static let colorKeys: [String] = [
        "purple",
        "pink",
        "red",
        "orange",
        "yellow",
        "green",
        "mint",
        "teal",
        "blue",
        "indigo"
    ]

    static let defaultColorKey = "purple"

    static let colorMap: [String: Color] = [
        "purple": .purple,
        "pink": .pink,
        "red": .red,
        "orange": .orange,
        "yellow": .yellow,
        "green": .green,
        "mint": .mint,
        "teal": .teal,
        "blue": .blue,
        "indigo": .indigo
    ]
}
