//
//  Service.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import Foundation

protocol UsageService {
    func fetchUsage() async throws -> Usage
    func simulateUsageTick() async throws -> Usage
}

protocol PlanService {
    func fetchPlans() async throws -> [Plan]
}

protocol PromotionService {
    func fetchPromotions() async throws -> [Promotion]
}

protocol NotificationManaging {
    func requestAuthorization() async throws
    func scheduleLowBalanceReminder(in seconds: TimeInterval) async throws
}
