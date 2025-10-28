//
//  UsageRow.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import SwiftUI

struct UsageRow: View {
    let title: String
    let value: String
    let progress: Double
    let systemImage: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Label(title, systemImage: systemImage)
                    .font(.headline)
                Spacer()
                Text(value)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            ProgressView(value: progress)
                .animation(.smooth, value: progress)
        }
    }
}

#Preview {
    UsageRow(
        title: "Data Used",
        value: "2.3 GB of 5 GB",
        progress: 0.46,
        systemImage: "antenna.radiowaves.left.and.right"
    )
}
