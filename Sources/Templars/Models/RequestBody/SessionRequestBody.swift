//
//  SessionRequestBody.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 15/01/2021.
//

import Foundation

extension RequestBody{
    struct CreateSession {
        let title: String
        let description: String
        let startDate: Date
        let count: Int
        let type: Session.SessionType
        let customerReference: String
        
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
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(startDate.toString(), forKey: .startDate)
        try container.encode(count, forKey: .count)
        try container.encode(type.rawValue, forKey: .type)
        try container.encode(customerReference, forKey: .customerReference)
    }
    
}
