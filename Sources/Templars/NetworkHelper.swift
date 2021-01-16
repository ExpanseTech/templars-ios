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
                return try decoder.decode(T.self, from: result.data)
            }
            .tryCatch{ error -> AnyPublisher<T, Error> in
//                guard let apiError = error as? ApiError
//                      , apiError.statusCode == 401 else{
//                    throw error
//                }

                throw error

            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
