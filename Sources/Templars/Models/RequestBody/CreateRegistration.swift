//
//  CreateRegistration.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 15/01/2021.
//

import Foundation

public extension RequestBody{
    
    
    /// Create Registeration
    struct CreateRegistration: Encodable{
        public let fields: String
        public let draft: Bool
        public let customerReference: String
        public let categoryId: String
        
        
        /// Initializer
        /// - Parameters:
        ///   - fields: Fields
        ///   - draft: Draft
        ///   - customerReference: User Id/Emial
        ///   - categoryId: Registeration Type Id
        public init(fields: String, draft: Bool, customerReference: String, categoryId: String){
            self.fields = fields
            self.draft = draft
            self.customerReference = customerReference
            self.categoryId = categoryId
        }
    }
    
}
