//
//  LoginCoordinator.swift
//  iMovies
//
//  Created by cefalo on 31/1/24.
//

import Foundation
import UIKit

final class LoginCoordinator: ChildCoordinator {
    var parent: RootCoordinator?
    
    var viewController: UIViewController?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        
    }
    
    func onLoginSuccess() {
        coordinatorDidFinish()
        parent?.loggedIn()
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}
