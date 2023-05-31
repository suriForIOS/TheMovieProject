//
//  MovieCardView.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 27/05/23.
//

import SwiftUI

struct MovieCardView: View {
    // MARK: Card View Constants
    struct Constants {
        static let textImageSpacing: CGFloat = 24
        static let animationDuration: CGFloat = 10
    }
    
    @ObservedObject var movieViewModel: MovieViewModel
    @State var isTruncated: Bool = false
    @State private var textoffset = 100.0
    
    let backgroundColor = Color.black
    
    init(movieViewModel: MovieViewModel) {
        self.movieViewModel = movieViewModel
    }
    
    // MARK: Card View Body
    var body: some View {
        GeometryReader { metris in
            VStack(alignment: .center, spacing: Constants.textImageSpacing) {
                Image("\(movieViewModel.movie.posterImageName)")
                    .resizable()
                    .scaledToFill()
                HStack {
                    TruncableText(text: text, lineLimit: 1) {
                        isTruncated = $0
                    }
                    if isTruncated {
                        text
                            .fixedSize()
                            .offset(x: textoffset, y: 0)
                            .animation(.linear(duration: Constants.animationDuration)
                                .repeatForever(autoreverses: false), value: textoffset)
                        
                            .onAppear {
                                textoffset = -100.0
                            }
                    } else {
                        Spacer()
                    }
                }
                .frame(width: metris.size.width)
                .clipped()
            }
            .background(backgroundColor)
        }
    }
    
    var text: Text {
        Text("\(movieViewModel.movie.name)")
            .foregroundColor(.white)
            .font(.custom("TitilliumWeb-Light", size: 18))
    }
}

// MARK: Card View Preview
struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movieViewModel: MovieViewModel(movie: Movie()))
    }
}
