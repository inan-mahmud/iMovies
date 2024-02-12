//
//  AuthViewModel.swift
//  iMovies
//
//  Created by cefalo on 4/2/24.
//

import Foundation
import Combine
import Firebase


final class AuthViewModel: ObservableObject {
    
    let authService: AuthService
    
    @Published var user: User?
    
    @Published var hasError = false
    @Published var authError: AuthError?

    
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    
    public func signIn(email: String, password: String) {
        authService.signIn(withEmail: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                    case .failure(let error):
                    self?.hasError = true
                    self?.authError = error
                    case .finished:
                        break;
                    }
                } receiveValue: {[weak self] user in
                    self?.user = user
                    self?.hasError = false
            }.store(in: &cancellables)
        
    }
}
