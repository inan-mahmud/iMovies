//
//  MoviesNavigationController.swift
//  iMovies
//
//  Created by cefalo on 19/1/24.
//

import Foundation
import SwiftUI

public protocol NavigationContext {
    func setInitialView<T: View>(view: T)
    func push<T: View>(view: T, animated: Bool)
    func pop(animated: Bool)
    func present<T: View>(view: T, animated: Bool)
    func dismiss(animated: Bool)
}


public class MoviesAppNavController: UINavigationController, NavigationContext {
    
    public func setInitialView<T>(view: T) where T : View {
        let vc = UIHostingController(rootView: view)
        viewControllers = [vc]
    }
    
    public func push<T>(view: T, animated: Bool) where T : View {
        let vc = UIHostingController(rootView: view)
        pushViewController(vc, animated: animated)
    }
    
    public func pop(animated: Bool) {
        popViewController(animated: true)
    }
    
    public func present<T>(view: T, animated: Bool) where T : View {
        let vc = UIHostingController(rootView: view)
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .automatic
        present(vc, animated: animated)
    }
    
    public func dismiss(animated: Bool) {
        dismiss(animated: true)
    }
}

