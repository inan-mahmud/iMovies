//
//  RemoteUpcomingMoviesService.swift
//  iMovies
//
//  Created by cefalo on 12/1/24.
//

import Foundation
import Combine

final class RemoteUpcomingMoviesService: UpcomingMoviesService {
    
    let upcomingMoviesRepository: UpcomingMoviesRepository
    
    init(upcomingMoviesRepository: UpcomingMoviesRepository) {
        self.upcomingMoviesRepository = upcomingMoviesRepository
    }
    
    func getUpcomingMovies() -> AnyPublisher<PaginatedEntity,MovieError> {
      return Deferred {
            Future { promise in
                self.upcomingMoviesRepository.fetchUpcomingMovies { result in
                    switch result {
                        case .success(let movieDTO):
                        promise(.success(movieDTO.mapToEntity()))
                        case .failure(let error):
                        promise(.failure(error.mapToMovieError()))
                    }
                }
                
            }
        }.eraseToAnyPublisher()
    }

}

