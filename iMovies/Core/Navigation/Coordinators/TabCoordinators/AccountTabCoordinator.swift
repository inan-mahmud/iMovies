//
//  AccountTabCoordinator.swift
//  iMovies
//
//  Created by cefalo on 31/1/24.
//

import Foundation
import UIKit
import SwiftUI

final class AccountTabCoordinator: ChildCoordinator {
    
    var parent: RootCoordinator?
    var viewController: UIViewController?
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        let accountTabController = UIHostingController(rootView: AccountView())
        navigationController.pushViewController(accountTabController, animated: false)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}
