////
////  Coordinator.swift
////  iMovies
////
////  Created by cefalo on 22/1/24.
////
//
//import Foundation
//import UIKit
//
//protocol Coordinator: AnyObject {
//    var finishDelegate: CoordinatorFinishDelegate? { get set }
//    
//    var navigationController: UINavigationController { get set }
//    
//    var childCoordinators: [Coordinator] { get set }
//    
//    var type: CoordinatorType { get }
//    
//    func start()
//    
//    func finish()
//    
//    init(_ navigationController: UINavigationController)
//}
//
//extension Coordinator {
//    func finish() {
//        childCoordinators.removeAll()
//        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
//    }
//}
//
//
//
//protocol CoordinatorFinishDelegate: AnyObject {
//    func coordinatorDidFinish(childCoordinator: Coordinator)
//}
//
//
//enum CoordinatorType {
//    case app, login, tab
//}
