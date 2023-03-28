//
//  MovieViewModel.swift
//  CombineNetworking
//
//  Created by ASMI iOS Dev on 25/03/23.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject{
    
    @Published var movies:[Movie] = []
    var cancelltionToken: AnyCancellable?
    
    /*
     When a subscriber subscribes to a publisher, the publisher returns an instance of AnyCancellable, which the subscriber can store for later use. The subscriber can then call the cancel() method on this instance when it is no longer interested in receiving values from the publisher.
     */
    
}

extension MovieViewModel{
    
    func getMovies(){
        cancelltionToken = MovieDB.request(apiPath: "trending/movie/week")
            .mapError{ error -> Error in
                print (error)
                return error
            }
            .sink(receiveCompletion: { _ in},
                  receiveValue: {
                self.movies = $0.movies
            })
    }
    
}
