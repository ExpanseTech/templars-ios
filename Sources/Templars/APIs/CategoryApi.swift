//
//  CategoryApi.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 13/01/2021.
//

import Foundation
import Combine

@available(OSX 10.15, *)
@available(iOS 13.0, *)
public extension Templars {
    
    func getPublicCategories() -> AnyPublisher<ResponseBody<[DocumentCategory]>, Error> {
        let url = URL(string: URLs.Templars.getPublicDocumentCategories)!
        let urlRequest = URLRequest(url: url)
        return networkHelper.urlCall(urlRequest: urlRequest)
    }
}
