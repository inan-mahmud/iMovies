//
//  DashboardController.swift
//  iMovies
//
//  Created by cefalo on 30/1/24.
//

import Foundation
import UIKit

class DashboardController: UITabBarController {
    
    weak var coordinator: RootCoordinator?
    
    private let upcomingPageCoordinator = UpcomingTabCoordinator(navigationController: UINavigationController())
    
    private let searchPageCooridinator = SearchTabCoordinator(navigationController: UINavigationController())
    
    private let accountPageCoordinator = AccountTabCoordinator(navigationController: UINavigationController())
    
    init(coordinator: RootCoordinator) {
        self.coordinator = coordinator
        upcomingPageCoordinator.parent = coordinator
        searchPageCooridinator.parent = coordinator
        accountPageCoordinator.parent = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upcomingPageCoordinator.start(animated: false)
        searchPageCooridinator.start(animated: false)
        accountPageCoordinator.start(animated: false)
        
        viewControllers = [
            upcomingPageCoordinator.navigationController,
            searchPageCooridinator.navigationController,
            accountPageCoordinator.navigationController
        ]
    }
}
