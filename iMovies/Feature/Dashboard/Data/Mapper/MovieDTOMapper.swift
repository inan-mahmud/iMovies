//
//  MovieDTOMapper.swift
//  iMovies
//
//  Created by cefalo on 16/1/24.
//

import Foundation

struct MovieDTOMapper {
    static func map(data:Data, response: HTTPURLResponse) -> (MovieDTO?,APIError?) {
       
        guard (200..<300).contains(response.statusCode) else {
            let statusCodeError = APIError.invalidStatusCode(statusCode: response.statusCode)
            return(nil,statusCodeError)
        }
        
        do {
            let movieDTO = try JSONDecoder().decode(MovieDTO.self, from: data)
            return (movieDTO,nil)
        } catch {
            return (nil, APIError.jsonParsingFailure)
        }
    }
}
