//
//  MovieViewModel.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 27/05/23.
//

import Foundation


class MovieViewModel: ObservableObject {
    @Published var movie = Movie()
    
    //MARK: - INITIALISATION
    init(movie: Movie) {
        self.movie = movie
    }
}
