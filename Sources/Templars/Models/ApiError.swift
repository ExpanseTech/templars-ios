//
//  ApiError.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 09/01/2021.
//

import Foundation


/// API Error Respose
public struct ApiError: Decodable, Error, LocalizedError {
    public let message: String
    
    public var errorDescription: String? {
        message
    }

    init(message: String){
        self.message = message
    }
}
