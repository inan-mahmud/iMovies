//
//  HomeCoordinator.swift
//  iMovies
//
//  Created by cefalo on 11/1/24.
//

import SwiftUI

struct HomeCoordinator: View {
    var body: some View {
        HomeView(upcomingMoviesViewModel: UpcomingMoviesViewModel()) { movie in
            MovieCard(movie: movie)
        }
    }
}

struct HomeCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        HomeCoordinator()
    }
}
