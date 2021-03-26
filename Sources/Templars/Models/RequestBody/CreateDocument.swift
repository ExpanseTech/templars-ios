//
//  CreateDocument.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 10/01/2021.
//

import Foundation

public extension RequestBody{
    
    
    /// Create Document
    struct CreateDocument: Encodable {
        let name: String
        let draft: Bool
        let fields: [Field]
        let customerReference: String
        let categoryId: String
        
        
        /// Initializer
        /// - Parameters:
        ///   - name: Name of document
        ///   - draft: Draft
        ///   - fields: Fields
        ///   - customerReference: Email or Id of User
        ///   - categoryId: Id of document type/category
        public init(name: String, draft: Bool, fields: [Field],
                    customerReference: String, categoryId: String){
            self.name = name
            self.draft = draft
            self.fields = fields
            self.customerReference = customerReference
            self.categoryId = categoryId
        }
        
        enum CodingKeys: CodingKey {
            case name
            case draft
            case fields
            case customerReference
            case categoryId
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
            try container.encode(draft, forKey: .draft)
            try container.encode(fields.jsonString, forKey: .fields)
            try container.encode(customerReference, forKey: .customerReference)
            try container.encode(categoryId, forKey: .categoryId)

            //convert [field] to dictionary
        }
    }
}
