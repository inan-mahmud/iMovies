//
//  HTTPClient.swift
//  iMovies
//
//  Created by cefalo on 12/1/24.
//

import Foundation

protocol HTTPClient {
    typealias CompletionHandler = (Swift.Result<Data,APIError>) -> Void
    
    func makeRequest(request: URLRequest, completion: @escaping CompletionHandler)
}

