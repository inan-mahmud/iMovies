//
//  LoginCoordinator.swift
//  iMovies
//
//  Created by cefalo on 31/1/24.
//

import Foundation
import UIKit
import FirebaseAuth
import SwiftUI

final class LoginCoordinator: ChildCoordinator {
    var parent: RootCoordinator?
    
    var viewController: UIViewController?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        let repository: AuthRepository = FirebaseAuthRepository(auth: Auth.auth())
        
        let authService: AuthService = FirebaseAuthService(authRepository: repository)
        let decorator = authService.addValidation()
        let authViewModel: AuthViewModel = AuthViewModel(authService: decorator)
        let loginController = UIHostingController(rootView: LoginView(authViewModel: authViewModel))
        navigationController.pushViewController(loginController, animated: false)
    }
    
    func onLoginSuccess() {
        coordinatorDidFinish()
        parent?.loggedIn()
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}
