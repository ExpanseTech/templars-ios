//
//  Registration.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 14/01/2021.
//

import Foundation

public struct Registration {
    public let id: String
    public let template: String
    public let fields: String
    public let draft: Bool
    public let status: String
    public let createdAt: Date
    public let updatedAt: Date
    public let active: Bool
    public let user: User
    public let categoryId: String
    public let userId: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case template
        case fields
        case draft
        case status
        case createdAt
        case updatedAt
        case active
        case user
        case categoryId
        case userId
    }
    
    public enum SortBy: String{
       case active = "ACTIVE"
    }
}

extension Registration: Decodable{
    public init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try value.decode(String.self, forKey: .id)
        template = try value.decode(String.self, forKey: .template)
        fields = try value.decode(String.self, forKey: .fields)
        draft = try value.decode(Bool.self, forKey: .draft)
        status = try value.decode(String.self, forKey: .status)
        createdAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        updatedAt = try value.decode(String.self, forKey: .updatedAt).toDate()!
        active = try value.decode(Bool.self, forKey: .active)
        user = try value.decode(User.self, forKey: .user)
        categoryId = try value.decode(String.self, forKey: .categoryId)
        userId = try value.decode(String.self, forKey: .userId)
    }
}
