//
//  extensions.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 10/01/2021.
//

import Foundation


extension String{
    
    /// Convert String to Date
    /// - Parameter format: (optional) data conversion formart
    /// - Returns: Date is returned
    public func toDate(format: String = "YYYY-MM-dd'T'HH:mm:ss.SSSXXX") -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}

public extension Date{
    
    /// Convert Date to String
    /// - Parameter format: (optional) data conversion formart
    /// - Returns: Readable String for display
    func toString(format: String = "YYYY-MM-dd'T'HH:mm:ss.SSSXXX") -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}


extension Dictionary {
    
    /// Computed property, returns a dictionary as Data
    var jsonStringRepresentation: Data? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: []){
            return jsonData
        }
        return nil
    }
}

extension URLRequest{
    
    /// Add API key to a request
    /// - Parameter apiKey: API key
    mutating func addAPIKey(_ apiKey: String){
        self.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    }
    
    
    /// set a URLRequest as a POST request
    mutating func setPostMethod(){
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
        self.httpMethod = "POST"
    }
    
    
    /// set a URLRequest as a PUT request
    mutating func setPutMethod(){
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
        self.httpMethod = "PUT"
    }
    
    
    /// add pagination to a url rquest
    /// - Parameters:
    ///   - page: Current page
    ///   - pageSize: Page size
    ///   - sortBy: Sort option
    mutating func addPagenation(page: Int, pageSize: Int, sortBy: String){
        self.addValue("\(page)", forHTTPHeaderField: "page")
        self.addValue("\(pageSize)", forHTTPHeaderField: "pageSize")
        self.addValue(sortBy, forHTTPHeaderField: "sortBy")
    }
}
