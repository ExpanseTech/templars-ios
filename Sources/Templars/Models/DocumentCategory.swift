//
//  DocumentCategory.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 13/01/2021.
//

import Foundation

public struct DocumentCategory: Identifiable{
    public let id: String
    public let isActive: Bool
    public let createdAt: Date
    public let updatedAt: Date
    public let name: String
    public let slug: String
    public let description: String
    public var template: String?
    public let isPublic: Bool
    public let price: Double
    private let parentList: [DocumentCategory]?
    public var parent: DocumentCategory? {
        parentList?.first
    }

    public lazy var fields: [Field] = {
        var f: [Field] = []
        if let data = template?.data(using: .utf8){
            let template = try? JSONDecoder().decode(Template.self, from: data)
            if let node = template?.nodes{
                f.append(contentsOf: Field.getEditableFields(fields: node))
            }
            if let orphans = template?.orphans {
                f.append(contentsOf: Field.getEditableFields(fields: orphans))
            }
        }
        return f
    }()
    
    enum CodingKeys: String, CodingKey {
        case id
        case isActive = "active"
        case name
        case slug
        case description
        case template
        case isPublic = "public"
        case price
        case createdAt
        case updatedAt
        case parentList = "parent"
    }
    
}

extension DocumentCategory: Decodable{
    public init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try value.decode(String.self, forKey: .id)
        isActive = try value.decode(Bool.self, forKey: .isActive)// == "true" ? true : false
        name = try value.decode(String.self, forKey: .name)
        slug = try value.decode(String.self, forKey: .slug)
        description = try value.decode(String.self, forKey: .description)
        isPublic = try value.decode(Bool.self, forKey: .isPublic)// == "true" ? true : false
        price = try value.decode(Double.self, forKey: .price)
        createdAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        updatedAt = try value.decode(String.self, forKey: .updatedAt).toDate()!
        if let ii = try value.decodeIfPresent(DocumentCategory.self, forKey: .parentList){
            parentList = [ii]
        }else{
            parentList = nil
        }
        template = try value.decodeIfPresent(String.self, forKey: .template)
    }
}
