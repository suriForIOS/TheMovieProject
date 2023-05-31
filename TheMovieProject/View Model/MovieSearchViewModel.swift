//
//  MovieSearchViewModel.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 30/05/23.
//

import Foundation

class MovieSearchViewModel: ObservableObject {
    
    @Published var searchedMovies = [Movie]()
    
    func search(for: String){
        
    }
}
