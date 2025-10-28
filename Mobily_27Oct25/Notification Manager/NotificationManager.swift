//
//  NotificationManager.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import UserNotifications

final class NotificationManager: NotificationManaging {
    func requestAuthorization() async throws {
        try await UNUserNotificationCenter
            .current()
            .requestAuthorization(
            options: [
                .alert,
                .sound,
                .badge
            ]
        )
    }
    
    func scheduleLowBalanceReminder(in seconds: TimeInterval) async throws {
        let content = UNMutableNotificationContent()
        content.title = "Low balance alert"
        content.body = "You're close to usage limits! Consider recharging or changing your plan"
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: max(
                5,
                seconds
            ),
            repeats: false
        )
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        try await UNUserNotificationCenter.current().add(request)
    }
}
