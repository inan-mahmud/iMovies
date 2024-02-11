//
//  AuthService.swift
//  iMovies
//
//  Created by cefalo on 11/2/24.
//

import Foundation
import Combine

protocol AuthService {
    
    func signIn(withEmail email: String, password: String) -> AnyPublisher<User, AuthError>
}
