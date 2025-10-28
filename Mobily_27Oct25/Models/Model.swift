//
//  Model.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import Foundation

struct Usage: Codable, Equatable, Identifiable {
    var id: UUID = UUID()
    var dataUsedGB: Double
    var dataLimitGB: Double
    var minutesUsed: Int
    var minutesLimit: Int
    var smsUsed: Int
    var smsLimit: Int
    var renewalDate: Date
}

struct Plan: Codable, Equatable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var priceINR: Int
    var data: String
    var minutes: String
    var sms: String
}

struct Promotion: Codable, Equatable, Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var advertisement: String
}
