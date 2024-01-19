//
//  UpcomingMoviesRepository.swift
//  iMovies
//
//  Created by cefalo on 12/1/24.
//

import Foundation

protocol UpcomingMoviesRepository {
    func fetchUpcomingMovies(completion: @escaping (Swift.Result<MovieDTO, APIError>) -> Void)
}

