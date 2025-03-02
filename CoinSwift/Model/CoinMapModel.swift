//
//  CoinMapModel.swift
//  CoinSwift
//
//  Created by Ashfak Ahamed Alauddeen on 01/06/24.
//

import Foundation

struct CoinMapModel: Codable{
    let status: Status?
    let data: [Datum]?
}

struct Datum: Codable {
    let id: Int?
    let rank: Int?
    let name: String?
    let symbol: String?
    let slug: String?
    let isActive: Int?
    let firstHistoricalData: String?
    let lastHistoricalData: String?
    let platform: Platform?

    enum CodingKeys: String, CodingKey {
        case id, rank, name, symbol, slug
        case isActive = "is_active"
        case firstHistoricalData = "first_historical_data"
        case lastHistoricalData = "last_historical_data"
        case platform
    }
}

struct Platform: Codable {
    let id: Int?
    let name, symbol, slug: String?
    let tokenAddress: String?

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case tokenAddress = "token_address"
    }
}

struct Status: Codable {
    let timestamp: String?
    let errorCode: Int?
    let errorMessage: String?
    let elapsed, creditCount: Int?
    let notice: String?

    enum CodingKeys: String, CodingKey {
        case timestamp
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case elapsed
        case creditCount = "credit_count"
        case notice
    }
}
