//
//  HTTPClient.swift
//  iMovies
//
//  Created by cefalo on 12/1/24.
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    func makeRequest(request: URLRequest, completion: @escaping (Result) -> Void)
}

