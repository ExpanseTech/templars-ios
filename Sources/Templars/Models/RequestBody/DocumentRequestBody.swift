//
//  DocumentRequestBody.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 10/01/2021.
//

import Foundation

extension RequestBody{
    
    struct CreateDocument: Codable {
        let name: String
        let draft: String
        let fields: String
        let customerReference: String
        let categoryId: String
    }
}
