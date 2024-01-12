//
//  DashboardCoordinator.swift
//  iMovies
//
//  Created by cefalo on 11/1/24.
//

import SwiftUI

struct DashboardCoordinator: View {
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    var body: some View {
        DashboardView()
    }
}

struct DashboardCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCoordinator(httpClient: URLSessionHTTPClient(session: URLSession(configuration: .default)))
    }
}
