//
//  Subscription.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 10/01/2021.
//

import Foundation

public struct Subscription {
    public let id: String
    public let amount: Double
    public let reference: String
    public let startDate: Date
    public let endDate: Date
    public let createdAt: Date
    public let updatedAt: Date
    public let isActive: Bool
    public let plan: Plan
    
    enum CodingKeys: String, CodingKey{
        case id
        case amount
        case reference
        case startDate
        case endDate
        case createdAt
        case updatedAt
        case isActive = "active"
        case plan
    }
}

extension Subscription: Decodable{
    public init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        
        id =  try value.decode(String.self, forKey: .id)
        amount = try value.decode(Double.self, forKey: .amount)
        reference = try value.decode(String.self, forKey: .reference)
        startDate = try value.decode(String.self, forKey: .startDate).toDate()!
        endDate = try value.decode(String.self, forKey: .endDate).toDate()!
        createdAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        updatedAt = try value.decode(String.self, forKey: .updatedAt).toDate()!
        isActive = try value.decode(Bool.self, forKey: .isActive)
        plan = try value.decode(Plan.self, forKey: .plan)
    }
}
