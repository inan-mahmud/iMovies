//
//  Coordinator.swift
//  iMovies
//
//  Created by cefalo on 31/1/24.
//

import UIKit

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
