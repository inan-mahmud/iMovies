//
//  URLSessionHTTPClient.swift
//  iMovies
//
//  Created by cefalo on 12/1/24.
//

import Foundation
import Combine


public final class URLSessionHTTPClient: HTTPClient {

    private let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
    
    func makeRequest(request: URLRequest, completion: @escaping CompletionHandler) {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                var apiError: APIError
                if let _ = response as? HTTPURLResponse {
                    apiError = .invalidResponse
                } else {
                    apiError = self.resolve(error: error)
                }
                completion(.failure(apiError))
            } else {
                guard let data = data else {
                    completion(.failure(.invalidResponse))
                    return
                }
                completion(.success(data))
            }
        }
        task.resume()
    }
}

extension URLSessionHTTPClient {
    func resolve(error: Error) -> APIError {
          let code = URLError.Code(rawValue: (error as NSError).code)
          switch code {
            case .notConnectedToInternet: return .networkError
            case .cancelled: return .cancelled
            default: return .custom(error: error)
          }
      }
}
