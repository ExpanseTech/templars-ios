//
//  Document.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 14/01/2021.
//

import Foundation

public struct Document {
    public let id: String
    public let name: String
    public let active: Bool
    public let draft: Bool
    public let categoryId: String
    public let userId: String
    public let createdAt: Date
    public let updatedAt: Date
    public let user: User
    
    public enum SortBy: String {
        case dateAccending = "createdAt"
        case dateDescending = "-createdAt"
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
