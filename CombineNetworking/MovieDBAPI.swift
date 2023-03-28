//
//  MovieDBAPI.swift
//  CombineNetworking
//
//  Created by ASMI iOS Dev on 25/03/23.
//

import Foundation
import Combine

struct MovieDB{
    static let apiClient = APIClient()
    static let baseURL = URL(string: "https://api.themoviedb.org/3/")!
}

enum APIPath: String{
    case trendingMoviesWeekly = "trending/movie/week"
}

extension MovieDB{
    
    static func request(apiPath:String)-> AnyPublisher<MovieResponse, Error> {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(apiPath), resolvingAgainstBaseURL: true)
        else {
            fatalError("Couldn't create URLComponents")
        }
        components.queryItems = [URLQueryItem(name: "api_key", value: "ff5c7eeb5a8870efe3cd7fc5c282cffd26800ecd")]
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request)
                    .map(\.value)
                    .eraseToAnyPublisher()
        
    }
}
