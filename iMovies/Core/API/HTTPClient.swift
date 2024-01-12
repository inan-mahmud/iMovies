//
//  HTTPClient.swift
//  iMovies
//
//  Created by cefalo on 12/1/24.
//

import Foundation
import Combine


public protocol HTTPClientTask {
    func cancel()
}

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    @discardableResult
    func makeRequest(url: URL, completion: @escaping (Result) -> Void) -> HTTPClientTask
}

