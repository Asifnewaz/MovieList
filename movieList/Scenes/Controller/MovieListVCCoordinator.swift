//
//  MovieListVCCoordinator.swift
//  movieList
//
//  Created by USER on 5/30/22.
//

import Foundation
import UIKit


class MovieListVCCoordinator: Coordinator {
    
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let movieListVC: MovieListViewController = .instantiate(storyBoard: StoryBoard.main.name)
        navigationController.setNavigationBarHidden(true, animated: false)
        movieListVC.coordinator = self
        navigationController.pushViewController(movieListVC, animated: true)

    }

}
