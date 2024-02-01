//
//  ParentCoordinator.swift
//  iMovies
//
//  Created by cefalo on 31/1/24.
//

import Foundation

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
