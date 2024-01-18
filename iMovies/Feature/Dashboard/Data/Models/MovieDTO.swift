//
//  MovieDTO.swift
//  iMovies
//
//  Created by cefalo on 10/1/24.
//

import Foundation

struct MovieDTO: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Result: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


extension MovieDTO {
    
    public func mapToEntity() -> PaginatedEntity {
        PaginatedEntity(page: self.page, totalPages: self.totalPages, movies: self.results.map({ result in
            return MovieEntity(backDropPath: result.backdropPath, posterPath: result.posterPath, releaseDate: result.releaseDate, title: result.title, overview: result.overview, voteAverage: result.voteAverage)
        }))
    }
}
