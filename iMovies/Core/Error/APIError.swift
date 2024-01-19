//
//  APIError.swift
//  iMovies
//
//  Created by cefalo on 16/1/24.
//

import Foundation

enum APIError: Error {
    case networkError
    case cancelled
    case invalidResponse
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    case unauthorized
    case custom(error: Error)
}

extension APIError {
    
     func mapToMovieError() -> MovieError {
        switch self {
        case .cancelled:
            return MovieError.unableToLoadData
        case .networkError:
            return MovieError.networkError
        case .invalidResponse:
            return MovieError.invalidData
        case .jsonParsingFailure:
            return MovieError.custom(message: "Something went wrong")
        case .requestFailed:
            return MovieError.unauthorized
        case .invalidStatusCode:
            return MovieError.unknown
        case .unknownError:
            return MovieError.unknown
        case .unauthorized:
            return MovieError.unauthorized
        case .custom(let error):
            return MovieError.custom(message: error.localizedDescription)
        }
    }
}
