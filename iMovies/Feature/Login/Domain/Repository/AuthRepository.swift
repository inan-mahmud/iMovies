//
//  AuthRepository.swift
//  iMovies
//
//  Created by cefalo on 4/2/24.
//

import Foundation
import FirebaseAuth


protocol AuthRepository {
    
    func signInWithEmailAndPassword(withEmail email: String, password: String, completion: @escaping (Swift.Result<FirebaseAuth.User,APIAuthError>) -> Void);
}
