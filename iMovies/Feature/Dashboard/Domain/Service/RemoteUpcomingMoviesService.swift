//
//  RemoteUpcomingMoviesService.swift
//  iMovies
//
//  Created by cefalo on 12/1/24.
//

import Foundation

final class RemoteUpcomingMoviesService: UpcomingMoviesService {
    
    let upcomingMoviesRepository: UpcomingMoviesRepository
    
    init(upcomingMoviesRepository: UpcomingMoviesRepository) {
        self.upcomingMoviesRepository = upcomingMoviesRepository
    }
    
    func getUpcomingMovies() {
        <#code#>
    }
}

