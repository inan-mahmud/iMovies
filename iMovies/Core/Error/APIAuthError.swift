//
//  APIAuthError.swift
//  iMovies
//
//  Created by cefalo on 4/2/24.
//

import Foundation

enum APIAuthError: Error {
    case invalidEmail
    case userNotFound
    case wrongPassword
    case weakPassword
    case emailAlreadyInUse
    case customError(message: String)
}

extension APIAuthError {
    func mapToAuthError() -> AuthError {
        return AuthError(self)
    }
}
