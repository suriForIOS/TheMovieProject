//
//  ContentView.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 27/05/23.
//

import SwiftUI

struct MovieListView: View {
    
    struct Constants {
        static let navigationBarTitle: String = "Romantic Comedy"
        static let frameTopOffset: CGFloat = 104
        static let gridVerticalSpacing: CGFloat = 45
        static let gridHorizontalSpacing: CGFloat = 15
        static let gridItemCount: Int = 3
        static let viewBottomPadding: CGFloat = 30
        static let viewHorizontalPadding: CGFloat = 15
    }
    @State var searchedTerm = ""
    @StateObject var movieListViewModel = MovieListViewModel()
    let columns = Array(repeating: GridItem(.flexible(), spacing: Constants.gridHorizontalSpacing), count: Constants.gridItemCount)
    let backgroundColor = Color.black
    
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

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}

//extension View {
//    func Print(_ vars: Any...) -> some View {
//        for v in vars { print(v) }
//        return EmptyView()
//    }
//}
