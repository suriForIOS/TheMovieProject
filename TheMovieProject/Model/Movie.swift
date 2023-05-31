//
//  Movie.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 27/05/23.
//

import UIKit


struct Movie: Decodable, Identifiable {
    var id = UUID()
    var name: String
    var posterImage: String
    var posterImageName: String {
        let image = posterImage.components(separatedBy: ".")[0]
        if UIImage(named: image) != nil {
            return image
        } else {
            return "placeholder_for_missing_posters"
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case posterImage = "poster-image"
    }
    
    init() {
        name = "A very long text that is gonna get truncated no matter what. Go big"
        posterImage = "placeholder_for_missing_posters"
    }
}
