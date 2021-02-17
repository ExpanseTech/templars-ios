//
//  Templar.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 10/01/2021.
//

import Foundation
import Combine


@available(OSX 10.15, *)
@available(iOS 13.0, *)
public class Templars {
    
    let apiKey: String
    let networkHelper: NetworkHelper
    
    
    /// Initializer
    /// - Parameter apiKey: API key
    public init(apiKey: String) {
        self.apiKey = apiKey
        networkHelper = NetworkHelper()
    }
    
}
