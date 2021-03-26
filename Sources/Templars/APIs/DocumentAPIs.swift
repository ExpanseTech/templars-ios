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
    
    
    /// Get a Document by it's Id
    /// - Parameter id: Document Id
    /// - Returns: AnyPublisher of type Document and Error
    public func getDocument(id: String) -> AnyPublisher<ResponseBody<Document>, Error> {
        let url = URL(string: String(format: URLs.Templars.getDocument, id) )!
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(Templars.apiKey)
        urlRequest.addValue(id, forHTTPHeaderField: "id")
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    
    /// Get Documents
    /// - Parameters:
    ///   - page: Page
    ///   - pageSize: Page Size
    ///   - sortBy: Sort option
    /// - Returns: AnyPublisher of type of Document List and Error
    public func getDocuments(page: Int, pageSize: Int, sortBy: Document.SortBy) -> AnyPublisher<ResponseBody<[Document]>, Error> {
        let url = URL(string: URLs.Templars.getDocuments)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(Templars.apiKey)
        urlRequest.addValue("\(page)", forHTTPHeaderField: "page")
        urlRequest.addValue("\(pageSize)", forHTTPHeaderField: "pageSize")
        urlRequest.addValue(sortBy.rawValue, forHTTPHeaderField: "sortBy")
        
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    
    /// Get all document Types/Catgory
    /// - Returns: AnyPublisher of type of Document Category List and Error
    public func getDocumentCategories() -> AnyPublisher<ResponseBody<[DocumentCategory]>, Error> {
        let url = URL(string: URLs.Templars.getPublicDocumentCategories)!
        let urlRequest = URLRequest(url: url)
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    public func getDocumentCategory(id: String) -> AnyPublisher<ResponseBody<DocumentCategory>, Error> {
        let urlString = String(format: URLs.Templars.getDocumentCategory, id)
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    
    /// Create a Document
    /// - Parameter document: Document to be created
    /// - Returns: AnyPublisher of type of Document and Error
    public func createDocument(document: RequestBody.CreateDocument) -> AnyPublisher<ResponseBody<Document>, Error> {
        let (validate, message) = document.fields.validate()
        if !validate{
            return Fail(error: ApiError(message: message ?? "validation error")).eraseToAnyPublisher()
        }

        let url = URL(string: URLs.Templars.createDocument)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(Templars.apiKey)
        let body = try! JSONEncoder().encode(document)
        urlRequest.httpBody = body
        urlRequest.setPostMethod()
        
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    
    /// Update a Document
    /// - Parameters:
    ///   - id: Document Id to be updated
    ///   - fields: Fields to be updated
    /// - Returns: AnyPublisher of type of Document and Error
    public func updateDocument(id: String, fields: [Field]) -> AnyPublisher<ResponseBody<Document>, Error> {
        let (validate, message) = fields.validate()
        if !validate{
            return Fail(error: ApiError(message: message ?? "validation error")).eraseToAnyPublisher()
        }

        let fieldsString = fields.jsonString  //DocumentCategory.convertToString(fields)
        let urlString = String(format: URLs.Templars.updateDocument, id)
        let url = URL(string: urlString)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(Templars.apiKey)
        urlRequest.setPutMethod()
        let body = ["fields": fieldsString].jsonStringRepresentation!
        urlRequest.httpBody = body
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
    
    
    /// Delete a Document
    /// Not Implemented
    private func deleteDocument(id: String) -> AnyPublisher<Document, Error> {
        let url = URL(string: String(format: URLs.Templars.deleteDocument, id) )!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addAPIKey(Templars.apiKey)
        
        return networkHelper.urlCall(urlRequest: urlRequest)
    }

    
}
