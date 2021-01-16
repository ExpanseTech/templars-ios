//
//  Session.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 11/01/2021.
//

import Foundation

public struct Session {
    let id: String
    let title: String
    let description: String
    let meetingId: String
    let meetingUrl: String
    let startDate: String
    let endDate: String
    let count: Int
    let duration: Int
    let reschedules: Int
    let type: SessionType
    let status: String
    let createdAt: Date
    let updatedAt: Date
    let active: Bool
    let user: User
    let assignee: User?
    
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
        case active
        case user
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
        startDate = try value.decode(String.self, forKey: .startDate)
        endDate = try value.decode(String.self, forKey: .endDate)
        count = try value.decode(Int.self, forKey: .count)
        duration = try value.decode(Int.self, forKey: .duration)
        reschedules = try value.decode(Int.self, forKey: .reschedules)
        
        let type = try value.decode(String.self, forKey: .type)
        self.type = SessionType(rawValue: type) ?? .chat
        
        status = try value.decode(String.self, forKey: .status)
        createdAt = try value.decode(String.self, forKey: .createdAt).toDate()!
        updatedAt = try value.decode(String.self, forKey: .updatedAt).toDate()!
        active = try value.decode(Bool.self, forKey: .active)
        user = try value.decode(User.self, forKey: .user)
        assignee = try value.decode(User?.self, forKey: .assignee)
    }
}
