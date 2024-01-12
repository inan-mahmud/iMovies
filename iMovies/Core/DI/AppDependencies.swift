//
//  AppDependencies.swift
//  iMovies
//
//  Created by cefalo on 12/1/24.
//

import Foundation


final class AppDependencies {
    
    public func createHTTPClient() -> HTTPClient {
        let httpClient = URLSessionHTTPClient(session: URLSession(configuration: .default))
        return httpClient
    }
}
