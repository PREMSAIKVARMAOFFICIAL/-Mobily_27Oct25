//
//  DashboardViewModel.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import Foundation
import Combine

@MainActor
final class DashboardViewModel: ObservableObject {
    @Published private(set) var usage: Usage?
    @Published private(set) var promotions: [Promotion] = []
    @Published var isLoading: Bool = false
    @Published var error: String?
    
    private let usageService: UsageService
    private let promotionService: PromotionService
    
    init(usageService: UsageService, promotionService: PromotionService) {
        self.usageService = usageService
        self.promotionService = promotionService
    }
    
    var dataProgress: Double {
        guard let usage = usage else {
            return 0
        }
        return usage.dataUsedGB / max(
            0.001,
            usage.dataLimitGB
        )
    }
    
    var minutesProgress: Double {
        guard let usage = usage else {
            return 0
        }
        return Double(
            usage.minutesUsed
        ) / max(
            1,
            Double(
                usage.minutesLimit
            )
        )
    }
    
    var smsProgress: Double {
        guard let usage = usage else {
            return 0
        }
        return Double(
            usage.smsUsed
        ) / max(
            1,
            Double(
                usage.smsLimit
            )
        )
    }
    
    func load() async {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            async let usage = try usageService.fetchUsage()
            async let promo = try promotionService.fetchPromotions()
            self.usage = try await usage
            self.promotions = try await promo
        } catch {
            self.error = error.localizedDescription
        }
    }
    
    func tick() async {
        do {
            self.usage = try await usageService.simulateUsageTick()
        } catch {
            self.error = error.localizedDescription
        }
    }
}
