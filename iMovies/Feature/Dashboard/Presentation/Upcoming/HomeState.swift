//
//  HomeState.swift
//  iMovies
//
//  Created by cefalo on 11/1/24.
//

import Foundation

enum HomeState {
    case loading
    case Done([MovieEntity])
    case Error(String)
}
