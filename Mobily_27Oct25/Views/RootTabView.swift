//
//  RootTabView.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import SwiftUI

struct RootTabView: View {
    @EnvironmentObject private var container: AppContainer
    
    var body: some View {
        TabView {
            UsageDashboardView(
                viewModel: DashboardViewModel(
                    usageService: container.usageService,
                    promotionService: container.promotionService
                )
            )
                .tabItem {
                    Label(
                        "Dashboard",
                        systemImage: "gauge.with.dots.needle.bottom.100percent"
                    )
                }
            
            PlansListView(
                viewModel: PlansViewModel(
                    planService: container.planService
                )
            )
                .tabItem {
                    Label(
                        "Plans",
                        systemImage: "shippingbox.circle"
                    )
                }
            
            SettingsView(
                viewModel: SettingsViewModel(
                    notifications: container.notificationManager
                )
            )
                .tabItem {
                    Label(
                        "Settings",
                        systemImage: "gearshape"
                    )
                }
        }
    }
}

#Preview("Lightweight") {
    RootTabView()
        .environmentObject(AppContainer.live)
}
