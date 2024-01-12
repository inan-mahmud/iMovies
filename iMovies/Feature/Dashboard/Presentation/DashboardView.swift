//
//  DashboardView.swift
//  iMovies
//
//  Created by cefalo on 8/1/24.
//

import SwiftUI

struct DashboardView: View {
   
    var body: some View {
        TabView {
            HomeCoordinator()
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

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
