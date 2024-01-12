//
//  HomeView.swift
//  iMovies
//
//  Created by cefalo on 10/1/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var upcomingMoviesViewModel: UpcomingMoviesViewModel
    private let cardView: (MovieEntity) -> MovieCard
    
    init(upcomingMoviesViewModel: UpcomingMoviesViewModel, cardView: @escaping (MovieEntity) -> MovieCard) {
        self.upcomingMoviesViewModel = upcomingMoviesViewModel
        self.cardView = cardView
    }
    
    var body: some View {
        NavigationStack {
            VStack {
               switch upcomingMoviesViewModel.homeState {
               case .loading:
                   ProgressView()
               case .Error(let error):
                   Text(error)
               case .Done(let movies):
                   List(movies) { movie in
                       cardView(movie)
                   }
               }
            }.onAppear {
                upcomingMoviesViewModel.fetchMovies()
            }
            .navigationTitle("Upcoming")
        }
    }
}

struct MovieCard: View {
    private let movie: MovieEntity
    
    init(movie: MovieEntity) {
        self.movie = movie
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25,style: .continuous)
                .fill(.white)
                .shadow(radius: 5)
            
            VStack {
                Text(movie.title)
                    .font(.title2)
                    .foregroundColor(.black)
                
                Text(movie.overview)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            .multilineTextAlignment(.leading)
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(upcomingMoviesViewModel: UpcomingMoviesViewModel())
//    }
//}
