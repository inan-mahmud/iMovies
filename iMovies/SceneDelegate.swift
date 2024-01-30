//
//  SceneDelegate.swift
//  iMovies
//
//  Created by cefalo on 31/1/24.
//

import Foundation
import UIKit

final class SceneDelegate: NSObject, UIWindowSceneDelegate {

    private var coordinator: Coordinator?
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let appWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
        appWindow.windowScene = windowScene
        
        let navigationController = UINavigationController()
        navigationController.setToolbarHidden(true, animated: false)
        let coordinator = RootCoordinator(navigationController: navigationController)
        coordinator.start(animated: false)
        
        appWindow.rootViewController = navigationController
        appWindow.makeKeyAndVisible()
        
        window = appWindow
    }
}
