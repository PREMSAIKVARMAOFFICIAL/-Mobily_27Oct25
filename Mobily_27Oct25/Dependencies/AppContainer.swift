//
//  AppContainer.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import Foundation
import Combine

final class AppContainer: ObservableObject {
    let usageService: UsageService
    let planService: PlanService
    let promotionService: PromotionService
    let notificationManager: NotificationManaging
    
    init(usageService: UsageService, planService: PlanService, promotionService: PromotionService, notificationManager: NotificationManaging) {
        self.usageService = usageService
        self.planService = planService
        self.promotionService = promotionService
        self.notificationManager = notificationManager
    }
    
    static var live: AppContainer {
        let mock = MockDataService()
        return AppContainer(
            usageService: mock,
            planService: mock,
            promotionService: mock,
            notificationManager: NotificationManager()
        )
    }
}
