//
//  SessionRequestBody.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 15/01/2021.
//

import Foundation

public extension RequestBody{
    struct CreateSession {
        public let title: String
        public let description: String
        public let startDate: Date
        public let count: Int
        public let type: Session.SessionType
        public let customerReference: String
        
        public init(title: String, description: String, startDate: Date, count: Int,
                    type: Session.SessionType, customerReference: String) {
            self.title = title
            self.description = description
            self.startDate = startDate
            self.count = count
            self.type = type
            self.customerReference = customerReference
        }
        
        enum CodingKeys: String, CodingKey {
            case title
            case description
            case startDate
            case count
            case type
            case customerReference
        }
      }
}

extension RequestBody.CreateSession: Encodable{
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(startDate.toString(), forKey: .startDate)
        try container.encode(count, forKey: .count)
        try container.encode(type.rawValue, forKey: .type)
        try container.encode(customerReference, forKey: .customerReference)
    }
    
}
