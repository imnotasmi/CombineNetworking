//
//  APIClient.swift
//  CombineNetworking
//
//  Created by ASMI iOS Dev on 25/03/23.
//

import Foundation
import Combine

struct APIClient{
    struct Response<T>{
        let value:T
        let response:URLResponse
    }

    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> { // 2
            return URLSession.shared
                .dataTaskPublisher(for: request) // 3
                .tryMap { result -> Response<T> in
                    let value = try JSONDecoder().decode(T.self, from: result.data) // 4
                    return Response(value: value, response: result.response) // 5
                }
                .mapError{ error -> Error in
                    return error
                }
        
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
                    
                }
    }



