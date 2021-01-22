//
//  RequestBody.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 09/01/2021.
//

import Foundation

public struct RequestBody {
    
    //MARK: Profile Request Body
    public struct UpdateProfile: Codable {
        let firstName: String
        let lastName: String
        let phoneNumber: String
    }
    
    
}
