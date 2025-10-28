//
//  SettingsViewModel.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import Foundation
import Combine

@MainActor
final class SettingsViewModel: ObservableObject {
    @Published var notificationsEnabled: Bool = false
    @Published var lastScheduledAt: Date?
    @Published var error: String?
    
    private let notifications: NotificationManaging
    
    init(notifications: NotificationManaging) {
        self.notifications = notifications
    }
    
    func requestNotifications() async {
        do {
            try await notifications.requestAuthorization()
            notificationsEnabled = true
        } catch {
            self.error = error.localizedDescription
        }
    }
    
    func scheduleLowBalanceReminder(after seconds: TimeInterval = 10) async {
        do {
            try await notifications.scheduleLowBalanceReminder(
                in: seconds
            )
            lastScheduledAt = Date()
        } catch {
            self.error = error.localizedDescription
        }
    }
}
