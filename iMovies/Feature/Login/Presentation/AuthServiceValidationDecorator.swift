//
//  SIgnInUseCaseValidationDecorator.swift
//  iMovies
//
//  Created by cefalo on 4/2/24.
//

import Foundation
import Combine

class AuthServiceValidationDecorator: AuthService {
    let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func signIn(withEmail email: String, password: String) -> AnyPublisher<User, AuthError> {
        
        guard email.isValidEmail() else {
            return Fail(error: .invalidEmail).eraseToAnyPublisher()
        }
        
        guard !password.isEmpty else {
            return Fail(error: .weakPassword).eraseToAnyPublisher()
        }
        
        return authService.signIn(withEmail: email, password: password)
        
    }
}



