//
//  UpcomingTabCoordinator.swift
//  iMovies
//
//  Created by cefalo on 31/1/24.
//

import UIKit
import SwiftUI

final class UpcomingTabCoordinator: ChildCoordinator {
    var parent: RootCoordinator?
    var viewController: UIViewController?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        let repository: UpcomingMoviesRepository = RemoteUpcomingMoviesRepository(httpClient: URLSessionHTTPClient(session: URLSession.shared))
        let movieService: UpcomingMoviesService = RemoteUpcomingMoviesService(upcomingMoviesRepository: repository)
        let viewModel = UpcomingMoviesViewModel(upcomingMoviesService: movieService)
        
        let upcomingMovieTabController = UIHostingController(rootView: HomeView(upcomingMoviesViewModel: viewModel, cardView: { movie in
             MovieCard(movie: movie)
        }))
        
        navigationController.pushViewController(upcomingMovieTabController, animated: false)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}
