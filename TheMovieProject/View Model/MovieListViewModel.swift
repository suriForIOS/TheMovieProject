//
//  MovieListViewModel.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 27/05/23.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies = [Movie]()
    @Published var searchTerm = ""
    
    var totalPages = 3
    var page : Int = 1
    
    //MARK: - INITIALISATION
    init() {
        movies = fetchMovies()
    }
    
    func getMovieModel(for movie: Movie) -> MovieViewModel {
        return MovieViewModel(movie: movie)
    }
    
    //MARK: - PAGINATION
    func shouldLoadMoreContent(after currentMovie: Movie){
        if let indexOfCurrentItem = movies.firstIndex(where: { movie in
            movie.id == currentMovie.id
        }), indexOfCurrentItem == movies.count - 4, page <= totalPages {
            page += 1
            movies.append(contentsOf: fetchMovies())
        }
    }
    
    func fetchMovies() -> [Movie] {
        if let movieList = MovieList.fetchRomanticComedy(pageNumber: page) {
            return movieList.page.contentItems.content
        } else {
            return []
        }
    }
}
