//
//  PlansViewModel.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import Foundation
import Combine

@MainActor
final class PlansViewModel: ObservableObject {
    @Published private(set) var plans: [Plan] = []
    @Published var confirmationMessage: String?
    @Published var error: String?
    
    private let planService: PlanService
    
    init(planService: PlanService) {
        self.planService = planService
    }
    
    func load() async {
        do {
            self.plans = try await planService.fetchPlans()
        } catch {
            self.error = error.localizedDescription
        }
    }
    
    func subscribe(to plan: Plan) {
        confirmationMessage = "Subscribed to \(plan.name) successfully (mock)"
    }
}
