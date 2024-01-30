//
//  NavigationRoot.swift
//  iMovies
//
//  Created by cefalo on 19/1/24.
//

import Foundation

public protocol NavigationRoot {
    func setTabs(to navigationContexts: [NavigationContext])
    func switchTo(tab: Int)
    func present(navContext: NavigationContext, animated: Bool)
}
