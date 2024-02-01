//
//  RootCoordinator.swift
//  iMovies
//
//  Created by cefalo on 31/1/24.
//

import Foundation
import UIKit

final class RootCoordinator: NSObject, ParentCoordinator {
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        navigateToDashboard()
    }
}

extension RootCoordinator {
    
    func navigateToDashboard() {
        let dashboardController = DashboardController(coordinator: self)
        navigationController.pushViewController(dashboardController, animated: true)
    }
    
    func navigateToLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.parent = self
        addChildCoordinator(loginCoordinator)
        loginCoordinator.start(animated: true)
    }
    
    func loggedIn() {
        navigateToDashboard()
    }
}
