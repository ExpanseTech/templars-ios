//
//  Session.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 11/01/2021.
//

import Foundation

public struct Session {
    public let id: String
    public let title: String
    public let description: String
    public let meetingId: String
    public let meetingUrl: String
    public var startDate: Date
    public var endDate: Date
    public let count: Int
    public let duration: Int
    public let reschedules: Int
    public let type: SessionType
    public let status: String
    public let createdAt: Date
    public let updatedAt: Date
    public let isActive: Bool
    public let user: User
    public let customer: Customer?
    public let subscription: Subscription?
    public let assignee: User?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case meetingId
        case meetingUrl
        case startDate
        case endDate
        case count
        case duration
        case reschedules
        case type
        case status
        case createdAt
        case updatedAt
        case isActive = "active"
        case user
        case customer
        case subscription
        case assignee
    }
    
    public enum SessionType: String{
        case audio = "AUDIO"
        case video = "VIDEO"
        case chat = "CHAT"
    }
    
    public enum SortBy: String {
        case title = "title"
        case date = "date"
    }
}

extension Session: Decodable{
    public init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        id = try value.decode(String.self, forKey: .id)
        title = try value.decode(String.self, forKey: .title)
        description = try value.decode(String.self, forKey: .description)
        meetingId = try value.decode(String.self, forKey: .meetingId)
        meetingUrl = try value.decode(String.self, forKey: .meetingUrl)
        startDate = try value.decode(String.self, forKey: .startDate).toDate()!
        endDate = try value.decode(String.self, forKey: .endDate).toDate()!
        count = try value.decode(Int.self, forKey: .count)
        duration = try value.decode(Int.self, forKey: .duration)
        reschedules = try value.decode(Int.self, forKey: .reschedules)
        
        let type = try value.decode(String.self, forKey: .type)
        self.type = SessionType(rawValue: type) ?? .chat
        
        status = try value.decode(String.self, forKey: .status)
        createdAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        updatedAt = try value.decode(String.self, forKey: .updatedAt).toDate()!
        isActive = try value.decode(Bool.self, forKey: .isActive)
        user = try value.decode(User.self, forKey: .user)
        
        customer = try value.decodeIfPresent(Customer.self, forKey: .customer)
        subscription = try value.decodeIfPresent(Subscription.self, forKey: .subscription)
        assignee = try value.decodeIfPresent(User.self, forKey: .assignee)
    }
}
