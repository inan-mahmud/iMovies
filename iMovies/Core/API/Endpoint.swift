//
//  Endpoint.swift
//  iMovies
//
//  Created by cefalo on 14/1/24.
//

import Foundation

struct Endpoint<Kind: EndpointType, Response: Decodable> {
    var path: String
    var method: HTTPMethod = .get([])
}


extension Endpoint {
    func makeRequest(with data: Kind.RequestData) -> URLRequest {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/" + path
        
        
        guard let url = components.url else {
            return URLRequest(url: URL(string: "https://api.themoviedb.org/3")!)
        }
        var request = URLRequest(url: url)
        
        switch method {
        case .post(let data), .patch(let data), .put(let data), .delete(let data):
            request.httpMethod = method.name
            request.httpBody = data
        case .get(let queryItems):
            components.queryItems = queryItems
            
        }
        
        Kind.prepare(&request, with: data)
        
        return request
    }
}

extension Endpoint where Kind == EndpointTypes.Private, Response == MovieDTO {
    static var upcoming: Self {
        Endpoint(path: "movie/upcoming")
    }
    static func details(withID id: Int) -> Self {
        Endpoint(path: "movie/\(id)")
    }
}


enum AccessToken: String {
    case accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNDI1OTYwNTU3ZTNhNzgyMjg5NDVkYjg5NzJiZTc3MiIsInN1YiI6IjY1ODVjZDc2ZmNhZGI0MjVlMTMzZmU3YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FLHnmsaHp_V2VHmZbWBJEC6Om2pR1wRWCjmFa7KU8SQ"
    
    case apiKey = "1425960557e3a78228945db8972be772"
}

protocol EndpointType  {
    associatedtype RequestData
    
    static func prepare(_ request: inout URLRequest, with data: RequestData)
}

enum EndpointTypes {
    enum Public: EndpointType {
        static func prepare(_ request: inout URLRequest, with _: Void) {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        }
    }
    
    enum Private: EndpointType {
        static func prepare(_ request: inout URLRequest, with token: AccessToken) {
            request.addValue("Bearer \(token.rawValue)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        }
    }
}
