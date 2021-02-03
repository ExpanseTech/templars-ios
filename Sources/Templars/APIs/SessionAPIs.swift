//
//  SessionApis.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 10/01/2021.
//

import Foundation
import Combine

@available(OSX 10.15, *)
@available(iOS 13.0, *)
public extension Templars{
    func getSession(id: String) -> AnyPublisher<ResponseBody<Session>, Error> {
        let urlString = String(format: URLs.Templars.getSession, id)
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        urlRequest.httpMethod = "GET"
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    func getSessions(page: Int, pageSize: Int, status: String, sortBy: Session.SortBy) -> AnyPublisher<ResponseBody<[Session]>, Error>{
        let url = URL(string: URLs.Templars.getSessions)!
        var urlRequest = URLRequest(url: url)
        urlRequest.addPagenation(page: page, pageSize: pageSize, sortBy: sortBy.rawValue)
        urlRequest.addAPIKey(apiKey)
        urlRequest.httpMethod = "GET"
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    func createSession(session: RequestBody.CreateSession) -> AnyPublisher<ResponseBody<Session>, Error>{
        let url = URL(string: URLs.Templars.createSession)!
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        urlRequest.setPostMethod()
        let body = try! JSONEncoder().encode(session)
        urlRequest.httpBody = body
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    func rescheduleSession(id: String, session: RequestBody.RescheduleSession) -> AnyPublisher<ResponseBody<Session>, Error>{
        let urlString = String(format: URLs.Templars.rescheduleSession, id)
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        urlRequest.setPutMethod()
        let body = try! JSONEncoder().encode(session)
        urlRequest.httpBody = body
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
}
