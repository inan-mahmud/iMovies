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
    
    let getUpcomingMoviesUseCase: GetUpcomingMoviesUseCase
    
    
    init(getUpcomingMoviesUseCase: GetUpcomingMoviesUseCase) {
        self.getUpcomingMoviesUseCase = getUpcomingMoviesUseCase
    }
    
    func fetchMovies() {
        movies = DemoData.result.movies
        homeState = .Done(movies)
    }
}
