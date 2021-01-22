//
//  ResponseBody.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 13/01/2021.
//

import Foundation

public struct ResponseBody<T: Decodable>: Decodable {
    public let message: String
    public let data: T
    public let meta: Meta?
}

public struct Meta: Decodable{
    let perPage: Int
    let total: Int
    let count: Int
    let currentPage: Int
    let totalPages: Int
}
