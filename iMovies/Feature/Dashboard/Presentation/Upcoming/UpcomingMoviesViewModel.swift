//
//  UpcomingMoviesViewModel.swift
//  iMovies
//
//  Created by cefalo on 11/1/24.
//

import Foundation
import Combine


final class UpcomingMoviesViewModel: ObservableObject {
    
    @Published public var movies: [MovieEntity] = []
    private var cancellables = Set<AnyCancellable>()
    
    let upcomingMoviesService: UpcomingMoviesService
    
    
    init(upcomingMoviesService: UpcomingMoviesService) {
        self.upcomingMoviesService = upcomingMoviesService
    }
    
    func fetchMovies() {
        upcomingMoviesService.getUpcomingMovies()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error.errorDescription!)
                case .finished:
                    print("finished api call")
                }
            } receiveValue: { [weak self] paginatedEntity in
                self?.movies = paginatedEntity.movies
            }
            .store(in: &cancellables)

    }
}
