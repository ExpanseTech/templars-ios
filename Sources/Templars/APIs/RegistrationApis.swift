//
//  RegistrationApis.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 14/01/2021.
//

import Foundation
import Combine

@available(OSX 10.15, *)
@available(iOS 13.0, *)
extension Templars{
    
    func getRegisteration(_ id: String) -> AnyPublisher<ResponseBody<Registration>, Error>{
        let urlString = String(format: URLs.Templars.getRegistration, id)
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    func getRegistrations(page: Int, pageSize: Int, sortBy: Registration.SortBy, draft: Bool) -> AnyPublisher<ResponseBody<[Registration]>, Error> {
        let url = URL(string: URLs.Templars.getRegistrations)!
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        urlRequest.addPagenation(page: page, pageSize: pageSize, sortBy: sortBy.rawValue)
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    func getRegistrationCategories() -> AnyPublisher<ResponseBody<[RegistrationCategory]>, Error>{
        let url = URL(string: URLs.Templars.getRegistrationCategories)!
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    func createRegistration(_ registration: RequestBody.CreateRegistration) -> AnyPublisher<ResponseBody<Registration>, Error>{
        let url = URL(string: URLs.Templars.createRegistration)!
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        urlRequest.setPostMethod()
        let body = try? JSONEncoder().encode(registration)
        urlRequest.httpBody = body
        
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
}
