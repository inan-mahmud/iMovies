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
            case .success(let (data, response)):
                let (movie,apiError) = MovieDTOMapper.map(data: data, response: response)
                
                if let apiError {
                    completion(.failure(apiError))
                } else if let movie = movie {
                    completion(.success(movie))
                } else {
                    let unknownError = APIError.unknownError(error: NSError(domain: "", code: 0))
                    completion(.failure(unknownError))
                }
            case .failure(_):
                completion(.failure(APIError.invalidResponse))
            }
        }
    }
    
}
