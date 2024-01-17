//
//  MovieError.swift
//  iMovies
//
//  Created by cefalo on 16/1/24.
//

import Foundation

enum MovieError: LocalizedError {
    
    case invalidData
    case unableToLoadData
    case networkError
    case unauthorized
    case custom(message: String)
    case unknown
    
}


extension MovieError {
    var errorDescription: String? {
        switch self {
        case .invalidData:
            return "Oops! Something went wrong!"
        case .unableToLoadData:
            return "Unable to load data"
        case .networkError:
            return "A network error occured"
        case .unauthorized:
            return "Unauthorized"
        case .custom(let message):
            return message
        case .unknown:
            return "Oops! Something went wrong!"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .invalidData:
            return "Please try again"
        case .unableToLoadData:
            return "Please check your internet connection"
        case .networkError:
            return "Please check your internet connection"
        case .unauthorized:
            return "Please provide correct email and password"
        case .custom(let message):
            return message
        case .unknown:
            return "Please try again later"
        }
    }
}
