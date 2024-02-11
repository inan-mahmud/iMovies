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
    @Published var errorMessage: String?
    @Published var recoveryMessage: String?
    
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
                        self?.errorMessage = error.errorDescription
                        self?.recoveryMessage = error.recoverySuggestion
                    case .finished:
                        print("finished api call")
                    }
                } receiveValue: {[weak self] user in
                    self?.user = user
            }.store(in: &cancellables)
        
    }
}
