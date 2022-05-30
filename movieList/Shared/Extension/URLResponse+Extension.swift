//
//  URLResponse+Extension.swift
//  movieList
//
//  Created by USER on 5/30/22.
//

import Foundation
extension URLResponse {

    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}

