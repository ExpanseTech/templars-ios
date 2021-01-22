//
//  User.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 09/01/2021.
//

import Foundation

public struct User {
    public var id: String
    public var createdAt: Date
    public var updatedAt: Date
    public var active: Bool
    public var firstName: String
    public var lastName : String
    public var email : String
    public var phoneNumber : String
    public var verified : Bool
    public var role : String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt
        case updatedAt
        case active
        case firstName
        case lastName
        case email
        case phoneNumber
        case verified
        case role
    }
    
}

extension User: Decodable{
    
    public init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        id = try value.decode(String.self, forKey: .id)
        createdAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        updatedAt = try value.decode(String.self, forKey: .updatedAt).toDate()!
        active = try value.decode(Bool.self, forKey: .active)
        firstName = try value.decode(String.self, forKey: .firstName)
        lastName = try value.decode(String.self, forKey: .lastName)
        email = try value.decode(String.self, forKey: .email)
        phoneNumber = try value.decode(String.self, forKey: .phoneNumber)
        verified = try value.decode(Bool.self, forKey: .verified)
        role = try value.decode(String.self, forKey: .role)
    }
}
