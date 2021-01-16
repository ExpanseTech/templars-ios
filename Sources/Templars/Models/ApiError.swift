//
//  ApiError.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 09/01/2021.
//

import Foundation

public struct ApiError: Decodable, Error {
    let message: String
}