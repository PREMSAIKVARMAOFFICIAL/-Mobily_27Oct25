//
//  UsageDashboardView.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import SwiftUI

struct UsageDashboardView: View {
    @StateObject var viewModel: DashboardViewModel
    @State private var timer: Timer?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Usage Summary")
                    .font(.title2.bold())
                
                GroupBox {
                    if let usage = viewModel.usage {
                        VStack(alignment: .leading, spacing: 12) {
                            UsageRow(
                                title: "Data Used",
                                value: String(
                                    format: "%.1f GB of %.0f GB",
                                    usage.dataUsedGB,
                                    usage.dataLimitGB
                                ),
                                progress: viewModel.dataProgress,
                                systemImage: "antenna.radiowaves.left.and.right"
                            )
                            UsageRow(
                                title: "Minutes",
                                value: "\(usage.minutesUsed) / \(usage.minutesLimit)",
                                progress: viewModel.minutesProgress,
                                systemImage: "phone"
                            )
                            UsageRow(
                                title: "SMS",
                                value: "\(usage.smsUsed) / \(usage.smsLimit)",
                                progress: viewModel.smsProgress,
                                systemImage: "message"
                            )
                            
                            Divider()
                            
                            HStack {
                                Image(systemName: "calendar")
                                Text("Renewal: \(usage.renewalDate.formatted(date: .abbreviated, time: .omitted))")
                                Spacer()
                                Text("Remaining: \(remainingDaysText(usage.renewalDate))")
                                    .foregroundStyle(.secondary)
                            }
                            .font(.subheadline)
                        }
                        .padding(.vertical, 12)
                    } else if viewModel.isLoading {
                        ProgressView("Loading usage…")
                    } else if let error = viewModel.error {
                        ContentUnavailableView(
                            "Error",
                            systemImage: "exclamationmark.triangle",
                            description: Text(
                                error
                            )
                        )
                    }
                }
                
                Text("Promotions")
                    .font(.title2.bold())
                PromotionsCarouselView(promotions: viewModel.promotions)
                
                Text("Available Plans")
                    .font(.title2.bold())
                PlansPreview()
            }
            .padding()
        }
        .task {
            await viewModel.load()
            startAutoTick()
        }
        .onDisappear {
            stopAutoTick()
        }
        .navigationTitle("Cellular Usage App")
    }
    
    func remainingDaysText(_ renewalDate: Date) -> String {
        let days = Calendar.current.dateComponents(
            [.day],
            from: Date(),
            to: renewalDate
        ).day ?? 0
        return days >= 0 ? "\(days)d left" : "Expired"
    }
    
    func startAutoTick() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            withTimeInterval: 5,
            repeats: true
        ) { _ in
            Task {
                await viewModel.tick()
            }
        }
    }
    
    func stopAutoTick() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview("Dashboard") {
    UsageDashboardView(
        viewModel: DashboardViewModel(
            usageService: MockDataService(),
            promotionService: MockDataService()
        )
    )
}
