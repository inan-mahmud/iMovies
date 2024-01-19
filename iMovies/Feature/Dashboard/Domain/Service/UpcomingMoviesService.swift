//
//  UpcomingMoviesService.swift
//  iMovies
//
//  Created by cefalo on 12/1/24.
//

import Foundation
import Combine

protocol UpcomingMoviesService {
    func getUpcomingMovies() -> AnyPublisher<PaginatedEntity,MovieError>
}


