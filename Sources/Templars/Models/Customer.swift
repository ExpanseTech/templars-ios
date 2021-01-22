//
//  File.swift
//  
//
//  Created by Tochi on 21/01/2021.
//

import Foundation

public struct Customer{
    public let id: String
    public let createdAt: Date
    public let updatedAt: Date
    public let isActive: Bool
    public let reference: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case updatedAt
        case isActive = "active"
        case reference
    }
}

extension Customer: Decodable{
    public init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        id = try value.decode(String.self, forKey: .id)
        createdAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        updatedAt = try value.decode(String.self, forKey: .updatedAt).toDate()!
        isActive = try value.decode(Bool.self, forKey: .isActive)
        reference = try value.decode(String.self, forKey: .reference)
    }
}
