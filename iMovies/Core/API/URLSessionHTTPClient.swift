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
    
    private struct UnexpectedValuesRepresentation: Error {}
    
    
    public func makeRequest(request: URLRequest, completion: @escaping (HTTPClient.Result) -> Void) {
        
        let task = session.dataTask(with: request) { data, response, error in
            completion(Result {
                if let error = error {
                    throw error
                } else if let data = data, let response = response as? HTTPURLResponse {
                    return (data, response)
                } else {
                    throw UnexpectedValuesRepresentation()
                }
            })
        }
        task.resume()
        
    }
    
}
