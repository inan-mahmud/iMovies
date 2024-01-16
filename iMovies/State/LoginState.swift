//
//  LoginState.swift
//  iMovies
//
//  Created by cefalo on 13/1/24.
//

import Foundation

enum TokenState: String {
    case none, validAccess, validRefresh, expired
    case loggedIn
    case profileFinished
}

enum LoginState {
    case loggedIn
    case loggedOut
}

class ViewState: ObservableObject {
    
    @Published var loginState: LoginState = .loggedOut
    
    func logOut() {
        loginState = .loggedOut
    }
    
    func logIn() {
        loginState = .loggedIn
    }
}


