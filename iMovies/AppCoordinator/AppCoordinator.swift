//
//  AppCoordinator.swift
//  iMovies
//
//  Created by cefalo on 12/1/24.
//

import Foundation
import SwiftUI

struct AppCoordinator: View {
    
    let dependencies = AppDependencies()
    
    var body: some View {
        DashboardCoordinator(httpClient: dependencies.createHTTPClient())
    }
}
