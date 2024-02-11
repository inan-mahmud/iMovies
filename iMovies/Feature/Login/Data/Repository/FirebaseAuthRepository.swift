//
//  FirebaseAuthRepository.swift
//  iMovies
//
//  Created by cefalo on 4/2/24.
//

import Foundation
import FirebaseAuth

class FirebaseAuthRepository: AuthRepository {
    
    typealias ResultType = FirebaseAuth.User
    
    let auth: Auth
    
    init(auth: Auth) {
        self.auth = auth
    }
    
    func signInWithEmailAndPassword(withEmail email: String, password: String, completion: @escaping (Swift.Result<FirebaseAuth.User, APIAuthError>) -> Void) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            
            if let error {
                completion(.failure(.customError(message: error.localizedDescription)))
                return
            }
            
            guard let user = authResult?.user else {
                completion(.failure(.userNotFound))
                return
            }
            completion(.success(user))
            
        }
    }
    
}
