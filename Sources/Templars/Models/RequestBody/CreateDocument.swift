//
//  CreateDocument.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 10/01/2021.
//

import Foundation

public extension RequestBody{
    
    
    /// Create Document
    struct CreateDocument: Codable {
        let name: String
        let draft: Bool
        let fields: String
        let customerReference: String
        let categoryId: String
        
        
        /// Initializer
        /// - Parameters:
        ///   - name: Name of document
        ///   - draft: Draft
        ///   - fields: Fields
        ///   - customerReference: Email or Id of User
        ///   - categoryId: Id of document type/category
        public init(name: String, draft: Bool, fields: String,
                    customerReference: String, categoryId: String){
            self.name = name
            self.draft = draft
            self.fields = fields
            self.customerReference = customerReference
            self.categoryId = categoryId
        }
    }
}
