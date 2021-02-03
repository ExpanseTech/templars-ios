//
//  extensions.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 10/01/2021.
//

import Foundation


extension String{
    public func toDate(format: String = "YYYY-MM-dd'T'HH:mm:ss.SSSXXX") -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}

public extension Date{
    func toString(format: String = "YYYY-MM-dd'T'HH:mm:ss.SSSXXX") -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}


extension Dictionary {
    var jsonStringRepresentation: Data? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: []){
            return jsonData
        }
        return nil
    }
}

extension URLRequest{
    mutating func addAPIKey(_ apiKey: String){
        self.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    }
    
    mutating func setPostMethod(){
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
        self.httpMethod = "POST"
    }
    
    mutating func setPutMethod(){
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
        self.httpMethod = "PUT"
    }
    
    mutating func addPagenation(page: Int, pageSize: Int, sortBy: String){
        self.addValue("\(page)", forHTTPHeaderField: "page")
        self.addValue("\(pageSize)", forHTTPHeaderField: "pageSize")
        self.addValue(sortBy, forHTTPHeaderField: "sortBy")
    }
}
