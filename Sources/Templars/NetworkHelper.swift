//
//  NetworkHelper.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 09/01/2021.
//

import Foundation
import Combine

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct NetworkHelper {
    
    //func refereshToken()
    
    
    func urlCall<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, Error>{
        URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { result  in
                let decoder: JSONDecoder = JSONDecoder()
                guard let response = result.response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else{
                    let error = try decoder.decode(ApiError.self, from: result.data)
                    throw error
                }
                let ss = String(data: result.data, encoding: .utf8)
                return try decoder.decode(T.self, from: result.data)
            }
            .tryCatch{ error -> AnyPublisher<T, ApiError> in

                throw error //ApiError(property: "", message: error.localizedDecription)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
