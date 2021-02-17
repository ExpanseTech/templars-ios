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
    
    
    /// Get a Session by it's Id
    /// - Parameter id: Session Id
    /// - Returns: AnyPublisher of type Session and Error
    func getSession(id: String) -> AnyPublisher<ResponseBody<Session>, Error> {
        let urlString = String(format: URLs.Templars.getSession, id)
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        urlRequest.httpMethod = "GET"
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    
    /// Get Sessions
    /// - Parameters:
    ///   - page: Page
    ///   - pageSize: Page size
    ///   - status: Status
    ///   - sortBy: Sort option
    /// - Returns: Returns: AnyPublisher of type Session List and Error
    func getSessions(page: Int, pageSize: Int, status: String, sortBy: Session.SortBy) -> AnyPublisher<ResponseBody<[Session]>, Error>{
        let url = URL(string: URLs.Templars.getSessions)!
        var urlRequest = URLRequest(url: url)
        urlRequest.addPagenation(page: page, pageSize: pageSize, sortBy: sortBy.rawValue)
        urlRequest.addAPIKey(apiKey)
        urlRequest.httpMethod = "GET"
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    
    /// Create Session
    /// - Parameter session: Session to create
    /// - Returns: Returns: AnyPublisher of type Session and Error
    func createSession(session: RequestBody.CreateSession) -> AnyPublisher<ResponseBody<Session>, Error>{
        let url = URL(string: URLs.Templars.createSession)!
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        urlRequest.setPostMethod()
        let body = try! JSONEncoder().encode(session)
        urlRequest.httpBody = body
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    
    /// Reschedule a session
    /// - Parameters:
    ///   - id: Session Id
    ///   - session: Session Reschedule Object
    /// - Returns: Returns: AnyPublisher of type Session and Error
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
