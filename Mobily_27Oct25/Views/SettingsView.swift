//
//  SettingsView.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    
    var body: some View {
        Form {
            Section("Notifications") {
                Toggle(
                    "Enable notifications",
                    isOn: $viewModel.notificationsEnabled
                )
                .onChange(
                    of: viewModel.notificationsEnabled
                ) {
                        _,
                        new in
                        if new {
                            Task {
                                await viewModel.requestNotifications()
                            }
                        }
                    }
                Button(
                    "Schedule low balance reminder in 10s"
                ) {
                    Task {
                        await viewModel.scheduleLowBalanceReminder(
                            after: 10
                        )
                    }
                }
                .disabled(
                    !viewModel.notificationsEnabled
                )
                if let ts = viewModel.lastScheduledAt {
                    Text("Last scheduled: \(ts.formatted(date: .abbreviated, time: .standard))")
                        .font(
                            .footnote
                        )
                        .foregroundStyle(
                            .secondary
                        )
                }
            }
            
            Section("About") {
                LabeledContent(
                    "App"
                ) {
                    Text(
                        "Cellular Usage Demo"
                    )
                }
                LabeledContent(
                    "Version"
                ) {
                    Text(
                        "1.0"
                    )
                }
            }
        }
        .navigationTitle("Settings")
        .overlay(alignment: .bottom) {
            if let error = viewModel.error {
                Text(
                    error
                ).padding(
                    8
                ).background(
                    .red.opacity(
                        0.1
                    )
                ).clipShape(
                    RoundedRectangle(
                        cornerRadius: 8
                    )
                )
            }
        }
    }
}

#Preview("Settings") {
    SettingsView(
        viewModel: SettingsViewModel(
            notifications: NotificationManager()
        )
    )
}
