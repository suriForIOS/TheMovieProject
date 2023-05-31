//
//  NavigationBar.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 28/05/23.
//

import SwiftUI

struct NavigationBar: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var title = ""
    @State var isSearching: Bool = false
    @Binding var searchString: String
    
    var body: some View {
        ZStack {
            Image("nav_bar")
                .resizable()
                .frame(height: 130)
            if isSearching {
                SearchBar(text: $searchString) {
                    isSearching = false
                }
            } else {
                HStack {
                    HStack(spacing: 20) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("back")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20, alignment: .leading)
                            
                        }
                        Text(title)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        isSearching = true
                    } label: {
                        Image("search")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20, alignment: .leading)
                    }
                }
                .padding(.horizontal, 15)
                
            }
        }
        .edgesIgnoringSafeArea(.top)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Featured", searchString: Binding.constant("abc"))
    }
}
