//
//  extensions.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 10/01/2021.
//

import Foundation


extension String{
    func toDate(format: String = "YYYY-MM-DD'T'HH:mm:ss.SSSXXX") -> Date?{
        let isoDate = "2016-04-14T10:44:00+0000"

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}

public extension Date{
    func toString(format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> String? {
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
