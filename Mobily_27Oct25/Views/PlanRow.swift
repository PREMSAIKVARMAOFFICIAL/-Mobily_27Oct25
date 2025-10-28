//
//  PlanRow.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import SwiftUI

struct PlanRow: View {
    let plan: Plan
    let subscribe: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                Text(plan.name).font(.headline)
                    Label(
                        "\(plan.priceINR)",
                        systemImage: "indianrupeesign.circle"
                    )
                    Label(
                        plan.data,
                        systemImage: "wifi"
                    )
                    Label(
                        plan.minutes,
                        systemImage: "phone"
                    )
                    Label(
                        "\(plan.sms) SMS",
                        systemImage: "message"
                    )
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
            }
            Spacer()
            Button("Subscribe", action: subscribe)
                .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 14).fill(Color(.secondarySystemBackground)))
    }
}


#Preview("Plans") {
    PlansListView(
        viewModel: PlansViewModel(
            planService: MockDataService()
        )
    )
}
