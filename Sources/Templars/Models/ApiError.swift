//
//  ApiError.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 09/01/2021.
//

import Foundation


/// API Error Respose
public struct ApiError: Decodable, Error {
    public let message: String
}
