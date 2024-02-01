//
//  ChildCoordinator.swift
//  iMovies
//
//  Created by cefalo on 31/1/24.
//

import Foundation
import UIKit

protocol ChildCoordinator: Coordinator {
    
    func coordinatorDidFinish()
    
    var viewController: UIViewController? { get set }
}
