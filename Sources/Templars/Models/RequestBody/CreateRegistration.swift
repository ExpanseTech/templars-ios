//
//  CreateRegistration.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 15/01/2021.
//

import Foundation

extension RequestBody{
    
    struct CreateRegistration: Encodable{
        let fields: String
        let draft: Bool
        let customerReference: String
        let categoryId: String
    }
    
}
