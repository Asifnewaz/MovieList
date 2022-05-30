//
//  Coordinator.swift
//  movieList
//
//  Created by USER on 5/30/22.
//

import Foundation
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get}
    func start()
}
