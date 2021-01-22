//
//  Document.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 10/01/2021.
//

import Foundation

public struct DocumentDetail {
    public let template: String
    public let name: String
    public let fields: String
    public let draft: Bool
    public let createdAt: Date
    public let updatedAt: Date
    public let active: Bool
    public let category: DocumentCategory
    public let categoryId: String
    public let user: User
    public let userId: String
    
    public enum SortOrder: String {
        case name = "name"
        case date = "date"
    }
    
    enum CodingKeys: String, CodingKey {
        case template
        case name
        case fields
        case draft
        case createdAt
        case updatedAt
        case active
        case category
        case categoryId
        case user
        case userId
    }
}

extension DocumentDetail: Decodable{
    public init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        template = try value.decode(String.self, forKey: .template)
        name = try value.decode(String.self, forKey: .name)
        fields = try value.decode(String.self, forKey: .fields)
        draft = try value.decode(Bool.self, forKey: .draft)
        active = try value.decode(Bool.self, forKey: .active)
        createdAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        updatedAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        category = try value.decode(DocumentCategory.self, forKey: .category)
        categoryId = try value.decode(String.self, forKey: .categoryId)
        user = try value.decode(User.self, forKey: .user)
        userId = try value.decode(String.self, forKey: .userId)
    }
}
