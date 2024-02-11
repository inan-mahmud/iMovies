//
//  AuthError.swift
//  iMovies
//
//  Created by cefalo on 4/2/24.
//

import Foundation

enum AuthError: LocalizedError {
    case invalidEmail
    case userNotFound
    case wrongPassword
    case weakPassword
    case emailAlreadyInUse
    case customError(message: String)
    
    init(_ firebaseError: APIAuthError) {
            switch firebaseError {
            case .invalidEmail:
                self = .invalidEmail
            case .userNotFound:
                self = .userNotFound
            case .wrongPassword:
                self = .wrongPassword
            case .weakPassword:
                self = .weakPassword
            case .emailAlreadyInUse:
                self = .emailAlreadyInUse
            case .customError(let message):
                self = .customError(message: message)
            }
        }
}

extension AuthError {
    var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return NSLocalizedString("Invalid email format.", comment: "")
        case .userNotFound:
            return NSLocalizedString("User not found.", comment: "")
        case .wrongPassword:
            return NSLocalizedString("Incorrect password.", comment: "")
        case .weakPassword:
            return NSLocalizedString("Password is too weak.", comment: "")
        case .emailAlreadyInUse:
            return NSLocalizedString("Email is already in use.", comment: "")
        case .customError(let message):
            return NSLocalizedString(message, comment: "")
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .invalidEmail:
            return NSLocalizedString("Please provide a valid email.", comment: "")
        case .userNotFound:
            return NSLocalizedString("User not found. Please check your email.", comment: "")
        case .wrongPassword:
            return NSLocalizedString("Please enter the correct password.", comment: "")
        case .weakPassword:
            return NSLocalizedString("Choose a stronger password.", comment: "")
        case .emailAlreadyInUse:
            return NSLocalizedString("Email is already in use. Try a different one.", comment: "")
        case .customError(let message):
            return NSLocalizedString(message, comment: "")
        }
        
    }
    
}
