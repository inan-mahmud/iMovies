////
////  AppCoordinator.swift
////  iMovies
////
////  Created by cefalo on 22/1/24.
////
//
//import Foundation
//import UIKit
//
//protocol AppCoordinator: Coordinator {
//    func showLoginFlow()
//    func showDashboardFlow()
//}
//
//class MainCoordinator: AppCoordinator {
//    
//    weak var finishDelegate: CoordinatorFinishDelegate? = nil
//    
//    var navigationController: UINavigationController
//    
//    var childCoordinators: [Coordinator]
//    
//    var type: CoordinatorType { .app }
//    
//    required init(_ navigationController: UINavigationController) {
//        self.navigationController = navigationController
//        navigationController.setNavigationBarHidden(true, animated: false)
//    }
//    
//    func start() {
//        showLoginFlow()
//    }
//    
//    func showLoginFlow() {
//        let loginCoordinator = LoginCoordinator.init(navigationController)
//        loginCoordinator.finishDelegate = self
//        loginCoordinator.start()
//        childCoordinators.append(loginCoordinator)
//    }
//    
//    func showDashboardFlow() {
//            let tabCoordinator = TabCoordinator.init(navigationController)
//            tabCoordinator.finishDelegate = self
//            tabCoordinator.start()
//            childCoordinators.append(tabCoordinator)
//        }
//}
//
//extension MainCoordinator: CoordinatorFinishDelegate {
//    func coordinatorDidFinish(childCoordinator: Coordinator) {
//        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
//
//        switch childCoordinator.type {
//        case .tab:
//            navigationController.viewControllers.removeAll()
//            showLoginFlow()
//        case .login:
//            navigationController.viewControllers.removeAll()
//            showDashboardFlow()
//        default:
//            break
//        }
//    }
//}
