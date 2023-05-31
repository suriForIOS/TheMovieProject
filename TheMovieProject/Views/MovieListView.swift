//
//  ContentView.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 27/05/23.
//

import SwiftUI

struct MovieListView: View {
    
    // MARK: List view constants
    struct Constants {
        static let navigationBarTitle: String = "Romantic Comedy"
        static let frameTopOffset: CGFloat = 104
        static let gridVerticalSpacing: CGFloat = 45
        static let gridHorizontalSpacing: CGFloat = 15
        static let gridItemCount: Int = 3
        static let viewBottomPadding: CGFloat = 30
        static let viewHorizontalPadding: CGFloat = 15
    }

    @StateObject var movieListViewModel = MovieListViewModel()
    @State var searchedTerm = ""
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: Constants.gridHorizontalSpacing), count: Constants.gridItemCount)
    let backgroundColor = Color.black
    
    // MARK: List View Body
    var body: some View {
        GeometryReader { metrics in
            VStack {
                ScrollView {
                    Rectangle()
                        .frame(height: Constants.frameTopOffset)
                    LazyVGrid (columns: columns, spacing: Constants.gridVerticalSpacing) {
                        ForEach(movieListViewModel.movies.filter({"\($0.name)".lowercased().contains("\(searchedTerm)".lowercased()) || "\(searchedTerm)".isEmpty})) { movie in
                            
                            MovieCardView(movieViewModel: movieListViewModel.getMovieModel(for: movie))
                                .frame(height: 0.26 * metrics.size.height)
                                .onAppear {
                                    movieListViewModel.shouldLoadMoreContent(after: movie)
                                }
                        }
                    }
                    .padding(.bottom, Constants.viewBottomPadding)
                }
            }
            .padding(.horizontal, Constants.viewHorizontalPadding)
            .overlay {
                NavigationBar(title: Constants.navigationBarTitle, searchString: $searchedTerm)
            }
            .background(backgroundColor)
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
        }
    }
}

// Mark: List View Preview
struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
