//
//  AppCoordinator.swift
//  movieList
//
//  Created by USER on 5/30/22.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let navigationController = UINavigationController()
        let movieListCoordinator = MovieListVCCoordinator(navigationController: navigationController)
        movieListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

    }
}
