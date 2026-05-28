//
//  ProjectProgressView.swift
//  Orbit
//
//  Created by Sevar Jafarli on 28.05.26.
//

import SwiftUI

struct ProjectProgressView: View {
    let done: Int
    let total: Int
    let progress: Double
    let tintColor: Color
    var barWidth: CGFloat = 60
    var showLabel: Bool = true

    var body: some View {
        VStack(alignment: .trailing, spacing: 4) {
            if showLabel {
                Text("\(done)/\(total)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .tint(tintColor)
                .frame(width: barWidth)
        }
    }
}
