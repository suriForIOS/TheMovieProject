//
//  MovieTestCase.swift
//  TheMovieProjectTests
//
//  Created by Surbhi Bagadia on 29/05/23.
//

import XCTest

final class MovieTestCase: XCTestCase {
    
    func testSuccessParser() {
        let json = """
      {
       "name": "Humming Bird",
        "poster-image": "poster3.jpg"
      }
      """.data(using: .utf8)!
        
        let movie = try! JSONDecoder().decode(Movie.self, from: json)
        XCTAssertNotNil(movie)
    }
}
