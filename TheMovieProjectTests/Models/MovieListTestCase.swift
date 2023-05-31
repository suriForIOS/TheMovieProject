//
//  MovieListTestCase.swift
//  TheMovieProjectTests
//
//  Created by Surbhi Bagadia on 29/05/23.
//

import XCTest

final class MovieListTestCase: XCTestCase {

    func testListSuccessParser() {
        let json = """
        {
            "page": {
                "title": "Romantic Comedy",
                "total-content-items" : "27",
                "page-num" : "1",
                "page-size" : "10",
                "content-items": {
                    "content": [
                    {
                        "name": "Humming Bird",
                        "poster-image": "poster3.jpg"
                    }
                ]
                }
            }
      }
      """.data(using: .utf8)!
        
        let movieList = try! JSONDecoder().decode(MovieList.self, from: json)
        XCTAssertNotNil(movieList)
    }
}
