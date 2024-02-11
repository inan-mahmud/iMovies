//
//  FirebaseAuthService.swift
//  iMovies
//
//  Created by cefalo on 11/2/24.
//

import Foundation
import Combine
import FirebaseAuth

final class FirebaseAuthService: AuthService {
    
    let authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func signIn(withEmail email: String, password: String) -> AnyPublisher<User, AuthError> {
        return Deferred {
            Future { promise in
                self.authRepository.signInWithEmailAndPassword(withEmail: email, password: password) { [weak self] result in
                switch result {
                    case .success(let firebaseUser):
                        let user: User? = self?.mapFirebaseUserToUser(firebaseUser: firebaseUser)
                        guard let user = user else {
                            promise(.failure(.userNotFound))
                            return
                        }
                        promise(.success(user))
                    case .failure(let error):
                        promise(.failure(error.mapToAuthError()))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}

extension FirebaseAuthService {
    
    func mapFirebaseUserToUser(firebaseUser: FirebaseAuth.User) -> User {
        return User(
            id: firebaseUser.uid,
            fullName: firebaseUser.displayName ?? "",
            email: firebaseUser.email ?? "")
    }
 }
