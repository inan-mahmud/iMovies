//
//  APIError.swift
//  iMovies
//
//  Created by cefalo on 16/1/24.
//

import Foundation

enum APIError: Error {
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

/**
 extension APIError {
     var errorDescription: String?{
         switch self {
             case .invalidResponse: return "Invaid Response"
             case .jsonParsingFailure: return "Failed to parse JSON"
             case let .requestFailed(description): return "Request Failed: \(description)"
             case let .invalidStatusCode(statusCode): return "Invalid status code: \(statusCode)"
             case .unauthorized: return "Token expired or not provided"
             case let .unknownError(error): return "An unknown error occured \(error.localizedDescription)"
         case .custom(let error):
             return "Something went wrong \(error.localizedDescription)"
         }
     }
 }
 */
