//
//  Utils.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 27/05/23.
//

import Foundation

func readJSON<T: Decodable>(fileName: String) -> T? {
  if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
    do {
      let data = try Data(contentsOf: url)
      return try JSONDecoder().decode(T.self, from: data)
    } catch let DecodingError.dataCorrupted(context) {
        print(context)
    } catch let DecodingError.keyNotFound(key, context) {
        print("Key '\(key)' not found:", context.debugDescription)
        print("codingPath:", context.codingPath)
    } catch let DecodingError.valueNotFound(value, context) {
        print("Value '\(value)' not found:", context.debugDescription)
        print("codingPath:", context.codingPath)
    } catch let DecodingError.typeMismatch(type, context)  {
        print("Type '\(type)' mismatch:", context.debugDescription)
        print("codingPath:", context.codingPath)
    } catch {
        print("error: ", error)
    }
  }
  return nil
}

