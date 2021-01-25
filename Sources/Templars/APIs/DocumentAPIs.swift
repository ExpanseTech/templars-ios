//
//  NetworkApis.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 10/01/2021.
//

import Foundation
import Combine

@available(OSX 10.15, *)
@available(iOS 13.0, *)
extension Templars{
    
    public func getDocument(id: String) -> AnyPublisher<ResponseBody<DocumentDetail>, Error> {
        let url = URL(string: String(format: URLs.Templars.getDocument, id) )!
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        urlRequest.addValue(id, forHTTPHeaderField: "id")
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    public func getDocuments(page: Int, pageSize: Int, sortBy: DocumentDetail.SortOrder) -> AnyPublisher<ResponseBody<[Document]>, Error> {
        let url = URL(string: URLs.Templars.getDocuments)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        urlRequest.addValue("\(page)", forHTTPHeaderField: "page")
        urlRequest.addValue("\(pageSize)", forHTTPHeaderField: "pageSize")
        urlRequest.addValue(sortBy.rawValue, forHTTPHeaderField: "sortBy")
        
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    public func getDocumentCategories() -> AnyPublisher<ResponseBody<[DocumentCategory]>, Error> {
        let url = URL(string: URLs.Templars.getPublicDocumentCategories)!
        let urlRequest = URLRequest(url: url)
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    public func createDocument(document: RequestBody.CreateDocument) -> AnyPublisher<DocumentDetail, Error> {
        let url = URL(string: URLs.Templars.createDocument)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        let body = try! JSONEncoder().encode(document)
        urlRequest.httpBody = body
        urlRequest.setPostMethod()
        
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    public func updateDocument(id: String, fields: String) -> AnyPublisher<DocumentDetail, Error> {
        let urlString = String(format: URLs.Templars.updateDocument, id)
        let url = URL(string: urlString)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        urlRequest.setPutMethod()
        let body = ["fields": fields].jsonStringRepresentation!
        urlRequest.httpBody = body
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    private func deleteDocument(id: String) -> AnyPublisher<DocumentDetail, Error> {
        let url = URL(string: String(format: URLs.Templars.deleteDocument, id) )!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(apiKey)
        
        return networkHelper.urlCall(urlRequest: urlRequest)
    }

    
}
