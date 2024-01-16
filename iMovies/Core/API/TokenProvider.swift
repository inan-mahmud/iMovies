//
//  TokenProvider.swift
//  iMovies
//
//  Created by cefalo on 14/1/24.
//

import Foundation

class TokenProvider {
 
    public func getAccessToken() -> String {
        return AccessToken.accessToken.rawValue
    }
}
