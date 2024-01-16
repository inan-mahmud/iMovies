//
//  UpcomingMoviesViewModel.swift
//  iMovies
//
//  Created by cefalo on 11/1/24.
//

import Foundation


final class UpcomingMoviesViewModel: ObservableObject {
    
    @Published private var movies: [MovieEntity] = []
    @Published var homeState: HomeState = .loading
    
    let upcomingMoviesService: UpcomingMoviesService
    
    
    init(upcomingMoviesService: UpcomingMoviesService) {
        self.upcomingMoviesService = upcomingMoviesService
    }
    
    func fetchMovies() {
        self.upcomingMoviesService.getUpcomingMovies()
        movies = DemoData.result.movies
        homeState = .Done(movies)
    }
}
