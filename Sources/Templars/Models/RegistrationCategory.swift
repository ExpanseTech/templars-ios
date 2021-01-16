//
//  RegistrationCategory.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 15/01/2021.
//

import Foundation

public struct RegistrationCategory {
    let id: String
    let createdAt: Date
    let updatedAt: Date
    let active: Bool
    let name: String
    let slug: String
    let description: String?
    let isPublic: Bool
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case updatedAt
        case active
        case name
        case slug
        case description
        case isPublic = "public"
        case price
    }
}

extension RegistrationCategory: Decodable{
    public init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try value.decode(String.self, forKey: .id)
        createdAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        updatedAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        active = try value.decode(Bool.self, forKey: .active)
        name = try value.decode(String.self, forKey: .name)
        slug = try value.decode(String.self, forKey: .slug)
        description = try value.decode(String?.self, forKey: .description)
        isPublic = try value.decode(Bool.self, forKey: .isPublic)
        price = try value.decode(Double.self, forKey: .price)
    }
}
