//
//  RemoteUpcomingMoviesRepository.swift
//  iMovies
//
//  Created by cefalo on 12/1/24.
//

import Foundation

final class RemoteUpcomingMoviesRepository: UpcomingMoviesRepository {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func fetchUpcomingMovies(completion: @escaping (Swift.Result<MovieDTO, APIError>) -> Void) {
        
        let signedRequest = Endpoint.upcoming.makeRequest(with: AccessToken.accessToken)
        
        
        httpClient.makeRequest(request: signedRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let movie: MovieDTO = try data.decode()
                    completion(.success(movie))
                } catch {
                    completion(.failure(APIError.jsonParsingFailure))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
