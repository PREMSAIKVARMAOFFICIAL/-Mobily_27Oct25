//
//  PlansListView.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import SwiftUI

struct PlansListView: View {
    @StateObject var viewModel: PlansViewModel
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 12) {
            if viewModel.plans.isEmpty && viewModel.error == nil { ProgressView("Loading plans…") }
            if let error = viewModel.error {
                Text(
                    error
                ).foregroundStyle(
                    .red
                )
            }
            
            ForEach(viewModel.plans) { plan in
                PlanRow(plan: plan, subscribe: {
                    viewModel.subscribe(to: plan)
                    showAlert = true
                })
            }
        }
        .task {
            await viewModel.load()
        }
        .alert(
            "Subscribed",
            isPresented: $showAlert,
            actions: {
                Button(
                    "OK",
                    role: .cancel
                ) {
                }
            },
            message: {
            Text(viewModel.confirmationMessage ?? "Subscribed successfully")
        })
        .padding(.horizontal)
    }
}


#Preview("Plans") {
    PlansListView(
        viewModel: PlansViewModel(
            planService: MockDataService()
        )
    )
}
