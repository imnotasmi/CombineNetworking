//
//  ContentView.swift
//  CombineNetworking
//
//  Created by ASMI iOS Dev on 25/03/23.
//

import SwiftUI

struct MoviesView: View {
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
        List(viewModel.movies){ movies in
            HStack {
                VStack(alignment: .leading){
                    Text(movies.title)
                        .font(.headline)
                    Text(movies.originalTitle)
                        .font(.subheadline)
                }
                
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
