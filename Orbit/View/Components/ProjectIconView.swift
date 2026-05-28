//
//  ProjectIconView.swift
//  Orbit
//
//  Created by Sevar Jafarli on 28.05.26.
//

import SwiftUI

struct ProjectIconView: View {
    let icon: String
    let color: Color
    var size: CGFloat = 44

    var body: some View {
        ZStack {
            Circle()
                .fill(color.opacity(0.2))
                .frame(width: size, height: size)
            Image(systemName: icon)
                .font(.system(size: size * 0.4))
                .foregroundStyle(color)
        }
    }
}
