//
//  HomeCoordinator.swift
//  iMovies
//
//  Created by cefalo on 11/1/24.
//

import SwiftUI

struct HomeCoordinator: View {
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    var body: some View {
        HomeFactory.create(httpClient: httpClient)
    }
    
}

enum HomeFactory {
    static func create(httpClient: HTTPClient) -> HomeView {
    
        let repository = RemoteUpcomingMoviesRepository(httpClient: httpClient)
        let service = RemoteUpcomingMoviesService(upcomingMoviesRepository: repository)
        let viewModel = UpcomingMoviesViewModel(upcomingMoviesService: service)
        return HomeView(upcomingMoviesViewModel: viewModel) { movie in
            MovieCard(movie: movie)
        }
    }
}

struct HomeCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        HomeCoordinator(httpClient: URLSessionHTTPClient(session: URLSession.shared))
    }
}
