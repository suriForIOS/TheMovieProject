//
//  MovieList.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 27/05/23.
//

import Foundation

struct MovieList: Decodable {
    let page: Page
}

struct Page: Decodable {
    let title, totalContentItems, pageNum, pageSize: String
    let contentItems: MovieItems

    enum CodingKeys: String, CodingKey {
        case title
        case totalContentItems = "total-content-items"
        case pageNum = "page-num"
        case pageSize = "page-size"
        case contentItems = "content-items"
    }
}

struct MovieItems: Decodable {
    let content: [Movie]
}

extension MovieList {
    static func fetchRomanticComedy(pageNumber: Int) -> MovieList? {
        return readJSON(fileName: "CONTENTLISTINGPAGE-PAGE\(pageNumber)")
    }
}
