//
//  File.swift
//  
//
//  Created by Tochi on 21/01/2021.
//

import Foundation

public struct Plan{
    public let id: String
    public let createdAt: Date
    public let updatedAt: Date
    public let isActive: Bool
    public let name: String
    public let amount: Double
    public let description: String
    public let reference: String
    public let registrations: Int
    public let documents: Int
    public let sessions: Int
    public let interval: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case createdAt
        case updatedAt
        case isActive = "active"
        case name
        case amount
        case description
        case reference
        case registrations
        case documents
        case sessions
        case interval
    }
}

extension Plan: Decodable{
    public init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try value.decode(String.self, forKey: .id)
        createdAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        updatedAt = try value.decode(String.self, forKey: .updatedAt).toDate()!
        isActive = try value.decode(Bool.self, forKey: .isActive)
        name = try value.decode(String.self, forKey: .name)
        amount = try value.decode(Double.self, forKey: .amount)
        description = try value.decode(String.self, forKey: .description)
        reference = try value.decode(String.self, forKey: .reference)
        registrations = try value.decode(Int.self, forKey: .registrations)
        documents = try value.decode(Int.self, forKey: .documents)
        sessions = try value.decode(Int.self, forKey: .sessions)
        interval = try value.decode(String.self, forKey: .interval)
    }
}
