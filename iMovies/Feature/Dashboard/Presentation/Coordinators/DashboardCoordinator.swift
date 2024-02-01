//
//  DashboardCoordinator.swift
//  iMovies
//
//  Created by cefalo on 11/1/24.
//

import SwiftUI

struct DashboardCoordinator: View{
    
    weak var coordinator: RootCoordinator?
    
    
    var body: some View {
        TabView {
            HomeCoordinator(httpClient: URLSessionHTTPClient(session: URLSession.shared))
                .tabItem {
                    Label("Discover",systemImage: "globe")
                }
            
            SearchCoordinator()
                .tabItem {
                    Label("Search",systemImage: "magnifyingglass")
                }
            
            AccountCoordinator()
                .tabItem {
                    Label("Account",systemImage: "person.crop.circle")
                }
        }
    }
    
}



struct DashboardCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCoordinator()
    }
}
