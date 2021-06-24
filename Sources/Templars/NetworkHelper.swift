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
    
    
    /// A generic Helper function that makes http request
    /// and converts the return data to desired data type <T>
    /// - Parameter urlRequest: get, put, post or any request type we intend to call
    /// - Returns: The return type is publisher of any type <T> and error that conforms to ApiError
    func urlCall<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, Error>{
        URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { result  in
                let decoder: JSONDecoder = JSONDecoder()
                guard let response = result.response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else{
                    var error: Error
                    if let response = result.response as? HTTPURLResponse, (500...599).contains(response.statusCode){
                        error = ApiError(message: "Service Error")
                    }else{
                        error = try decoder.decode(ApiError.self, from: result.data)
                    }
                    throw error
                }
                return try decoder.decode(T.self, from: result.data)
            }
            .tryCatch{ error -> AnyPublisher<T, ApiError> in

                throw error
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
