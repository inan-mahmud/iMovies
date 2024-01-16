//
//  HTTPMethod.swift
//  iMovies
//
//  Created by cefalo on 16/1/24.
//

import Foundation

enum HTTPMethod {
    case get([URLQueryItem])
    case post(Data?)
    case put(Data?)
    case delete(Data?)
    case patch(Data?)
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .patch:
            return "PATCH"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
}
