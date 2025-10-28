//
//  Mobily_27Oct25Tests.swift
//  Mobily_27Oct25Tests
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import XCTest
@testable import Mobily_27Oct25

@MainActor
final class DashboardViewModelTests: XCTestCase {
    
    func testProgressesComputeCorrectly() async throws {
        let mock = MockDataService()
        let viewModel = await MainActor.run {
            DashboardViewModel(
                usageService: mock,
                promotionService: mock
            )
        }
        await viewModel.load()
        
        let dataProgress = viewModel.dataProgress
        let minutesProgress = viewModel.minutesProgress
        let smsProgress = viewModel.smsProgress
        
        XCTAssertGreaterThan(dataProgress, 0)
        XCTAssertGreaterThan(minutesProgress, 0)
        XCTAssertGreaterThan(smsProgress, 0)
        XCTAssertLessThanOrEqual(dataProgress, 1)
        XCTAssertLessThanOrEqual(minutesProgress, 1)
        XCTAssertLessThanOrEqual(smsProgress, 1)
    }
}
