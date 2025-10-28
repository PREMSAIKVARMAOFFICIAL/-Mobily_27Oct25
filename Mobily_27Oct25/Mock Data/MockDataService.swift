//
//  MockDataService.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import Foundation

final class MockDataService: UsageService, PlanService, PromotionService {
    private var usage: Usage
    private let plans: [Plan]
    private let promotions: [Promotion]
    
    init() {
        self.usage = Usage(
            dataUsedGB: 2.3,
            dataLimitGB: 5,
            minutesUsed: 340,
            minutesLimit: 1000,
            smsUsed: 120,
            smsLimit: 500,
            renewalDate: Calendar.current.date(
                from: DateComponents(
                    year: 2025,
                    month: 11,
                    day: 1
                )
            ) ?? Date()
        )
        
        self.plans = [
            Plan(
                name: "Super 299",
                priceINR: 299,
                data: "3GB/day",
                minutes: "1000",
                sms: "100"
            ),
            Plan(
                name: "Max 499",
                priceINR: 499,
                data: "5GB/day",
                minutes: "Unlimited",
                sms: "500"
            ),
            Plan(
                name: "Power 799",
                priceINR: 799,
                data: "10GB/day",
                minutes: "Unlimited",
                sms: "1000"
            )
        ]
        
        self.promotions = [
            Promotion(
                title: "Super Saver 499",
                description: "Save more on 5GB/day with unlimited calls",
                advertisement: "Know More"
            ),
            Promotion(
                title: "Weekend Data Boost",
                description: "Extra 10GB every weekend for binge sessions!",
                advertisement: "Subscribe"
            )
        ]
    }
    
    func fetchUsage() async throws -> Usage {
        usage
    }
    
    func simulateUsageTick() async throws -> Usage {
        var next = usage
        next.dataUsedGB = min(
            next.dataLimitGB,
            next.dataUsedGB + Double.random(
                in: 0.05...0.15
            )
        )
        next.minutesUsed = min(
            next.minutesLimit,
            next.minutesUsed + Int.random(
                in: 5...30
            )
        )
        next.smsUsed = min(
            next.smsLimit,
            next.smsUsed + Int.random(
                in: 1...8
            )
        )
        usage = next
        return next
    }
    
    func fetchPlans() async throws -> [Plan] {
        plans
    }
    func fetchPromotions() async throws -> [Promotion] {
        promotions
    }
}
