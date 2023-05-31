//
//  WelcomeScreen.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 29/05/23.
//

import SwiftUI

struct WelcomeView: View {
    // MARK: Welcome view constants
    struct Constants {
        static let welcomeMessage: String = "Welcome Back User"
        static let chooseCategoryMessage: String = "Choose a category your would like to explore"
        static let category1 = "Romantic Comedy"
        static let topPadding: CGFloat = 50
    }
    
    let backgroundColor = Color.black
    
    // MARK: Welcome view body
    var body: some View {
        NavigationView {
            VStack {
                Text(Constants.welcomeMessage)
                    .font(.title)
                    .foregroundColor(.white)
                Text(Constants.chooseCategoryMessage)
                    .font(.subheadline)
                    .foregroundColor(.white)
                NavigationLink {
                    MovieListView()
                } label: {
                    Text(Constants.category1)
                        .foregroundColor(.blue)
                }
                .padding(.top, Constants.topPadding)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor)
        }
    }
}

// MARK: Welcome view previews
struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
