//
//  MovieEntity.swift
//  iMovies
//
//  Created by cefalo on 10/1/24.
//

import Foundation

struct PaginatedEntity: Hashable {
    let page: Int
    let totalPages: Int
    let movies: [MovieEntity]
}


struct MovieEntity: Hashable, Identifiable {
    let id: Int
    let backDropPath: String
    let posterPath: String
    let releaseDate: String
    let title: String
    let overview: String
    let voteAverage: Double
    
    var posterURL: String {
        "https://image.tmdb.org/t/p/w185" + posterPath
    }
    
    var coverURL: String {
        "https://image.tmdb.org/t/p/w185" + backDropPath
    }
}


struct DemoData {
    
    static let sampleMovie = MovieEntity(id: 1, backDropPath: "/36Lt4NXw5ucLDobs7dvJCIniXCp.jpg", posterPath: "/qVKirUdmoex8SdfUk8WDDWwrcCh.jpg", releaseDate: "2023-10-04", title: "The Exorcist: Believer", overview: "When two girls disappear into the woods and return three days later with no memory of what happened to them, the father of one girl seeks out Chris MacNeil, who's been forever altered by what happened to her daughter fifty years ago.", voteAverage: 6.1)
    
    static let result: PaginatedEntity = PaginatedEntity(page: 1, totalPages: 1, movies: [
        sampleMovie,sampleMovie,sampleMovie,sampleMovie,sampleMovie,sampleMovie,sampleMovie,sampleMovie,sampleMovie
    ])
    
}
