//
//  AppDependencies.swift
//  iMovies
//
//  Created by cefalo on 12/1/24.
//

import Foundation


final class AppDependencies {
    
    public lazy var httpClient: HTTPClient = {
        let httpClient = URLSessionHTTPClient(session: URLSession.shared)
        return httpClient
    }()
    
    
    public lazy var upcomingMoviesRepository: UpcomingMoviesRepository  = {
        RemoteUpcomingMoviesRepository(httpClient: httpClient)
    }()
    
    public lazy var upcomingMoviesService: UpcomingMoviesService =  {
       RemoteUpcomingMoviesService(upcomingMoviesRepository: upcomingMoviesRepository)
    }()
}
