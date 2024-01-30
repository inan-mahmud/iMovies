//
//  Route.swift
//  iMovies
//
//  Created by cefalo on 19/1/24.
//

import Foundation
import UIKit
import SwiftUI


enum Route {
    case dashboard
    case login
}

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start(animated: Bool)
    
    func popViewController(animated: Bool)
}

extension Coordinator {
    func popViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = navigationController.viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            navigationController.popToViewController(vc, animated: animated)
        }
    }
    
    func popViewController(to viewController: UIViewController, animated: Bool) {
        navigationController.popToViewController(viewController, animated: animated)
    }
}

protocol ParentCoordinator: Coordinator {
    var childCoordinators: [Coordinator] { get set }
    
    func addChildCoordinator(_ child: Coordinator?)
    
    func childDidFinish(_ child: Coordinator?)
}

extension ParentCoordinator {
    
    func addChildCoordinator(_ child: Coordinator?) {
        if let child {
            childCoordinators.append(child)
        }
    }
    
    func childDidFinish(_ child: Coordinator?) {
        if let index = childCoordinators.firstIndex(where: { $0 === child }) {
                    childCoordinators.remove(at: index)
        }
    }
}

protocol ChildCoordinator: Coordinator {
    
    func coordinatorDidFinish()
    
    var viewController: UIViewController? { get set }
}

final class RootCoordinator: NSObject, ParentCoordinator {
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        navigateToLogin()
    }
}

extension RootCoordinator {
    
    func navigateToDashboard() {
        let dashboardController = DashboardController(coordinator: self)
        //dashboardController.coordinator = self
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

final class UpcomingTabCoordinator: ChildCoordinator {
    var parent: RootCoordinator?
    var viewController: UIViewController?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}


final class SearchTabCoordinator: ChildCoordinator {
    
    var parent: RootCoordinator?
    var viewController: UIViewController?
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}

final class AccountTabCoordinator: ChildCoordinator {
    
    var parent: RootCoordinator?
    var viewController: UIViewController?
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}

enum TabRoute {
    case upcoming
    case search
    case account
}
