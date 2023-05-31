//
//  MovieSearchView.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 30/05/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var cancelAction: () -> Void
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $text)
                }
                .foregroundColor(Color(.systemGray5))
                .padding(5)
                .background(Color(.systemFill))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemFill), lineWidth: 1)
                )
                Button("Cancel", action: {
                    cancelAction()
                })
                .foregroundColor(Color(.systemGray5))
            }
        }
        .padding(.horizontal, 15)
    }
}
