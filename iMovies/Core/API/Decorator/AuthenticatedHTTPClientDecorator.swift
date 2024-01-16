//
//  AuthenticatedHTTPClientDecorator.swift
//  iMovies
//
//  Created by cefalo on 14/1/24.
//

import Foundation

class AuthenticatedHTTPClientDecorator: HTTPClient {
    
    let httpClient: HTTPClient
    let tokenProvider: TokenProvider
    
    init(httpClient: HTTPClient, tokenProvider: TokenProvider) {
        self.httpClient = httpClient
        self.tokenProvider = tokenProvider
    }
    
    func makeRequest(request: URLRequest, completion: @escaping (HTTPClient.Result) -> Void) {
        let accessToken = tokenProvider.getAccessToken()
        var signedRequest = request
        signedRequest.addValue(accessToken, forHTTPHeaderField: "Authorization")
        httpClient.makeRequest(request: signedRequest, completion: completion)
    }
    
}
