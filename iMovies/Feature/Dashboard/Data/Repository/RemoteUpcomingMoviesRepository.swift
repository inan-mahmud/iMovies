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
    
    func fetchUpcomingMovies(completion: @escaping (Swift.Result<MovieDTO, Error>) -> Void) {
        
        let upcomingMoviesEndpoint = Endpoint<EndpointTypes.Private,MovieDTO>.upcoming
        let request = upcomingMoviesEndpoint.makeRequest(with: AccessToken.accessToken)
        
        httpClient.makeRequest(request: request) { result in
            switch result {
            case .success(let (data,_)):
                do {
                    let decodedData = try JSONDecoder().decode(MovieDTO.self, from: data)
                  
                    completion(.success(decodedData))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
