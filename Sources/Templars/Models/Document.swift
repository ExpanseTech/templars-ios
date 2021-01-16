//
//  Document.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 14/01/2021.
//

import Foundation

public struct Document {
    let id: String
    let name: String
    let active: Bool
    let draft: Bool
    let categoryId: String
    let userId: String
    let createdAt: Date
    let updatedAt: Date
    let user: User
    
    public enum SortOrder: String {
        case name = "name"
        case date = "date"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case active
        case draft
        case categoryId
        case userId
        case createdAt
        case updatedAt
        case user
    }
}

extension Document: Decodable{
    public init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        id = try value.decode(String.self, forKey: .id)
        name = try value.decode(String.self, forKey: .name)
        active = try value.decode(Bool.self, forKey: .active)
        draft = try value.decode(Bool.self, forKey: .draft)
        categoryId = try value.decode(String.self, forKey: .categoryId)
        userId = try value.decode(String.self, forKey: .userId)
        createdAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        updatedAt = try value.decode(String.self, forKey: .updatedAt).toDate()!
        user = try value.decode(User.self, forKey: .user)
    }
}
