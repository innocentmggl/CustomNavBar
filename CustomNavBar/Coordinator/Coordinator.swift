//
//  Coordinator.swift
//  CustomNavBar
//
//  Created by Innocent Magagula on 2024/04/05.
//

import UIKit

enum RouteDestination {
    
    case details(_ productId: String)
    case confirmation
}

public protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    func start()
    func finish()
}

final class AppCoordinator: NSObject, Coordinator {
    
    var navigationController: UINavigationController
    
    override init() {
        self.navigationController = UINavigationController()
        super.init()
    }
    
    func start() {
        let viewModel = RootViewModel(navigationDelegate: self)
        let root = RootViewController(viewModel: viewModel)
        navigationController.setViewControllers([root], animated: false)
    }
    
    // do any necessary clean ups and hooks
    func finish() { }
    
    func route(to destination: RouteDestination) {
        switch destination {
        case .details(let productId):
            let viewController = DetailsViewController(
                viewModel: DetailsViewModel(productId: productId, navigationDelegate: self)
            )
            navigationController.pushViewController(viewController, animated: true)
        case .confirmation:
            let viewController = ConfirmViewController()
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}

extension AppCoordinator: RootViewModelNavigationDelegate {
    func routeToDetails(with productId: String) {
        route(to: .details(productId))
    }
}

extension AppCoordinator: DetailsViewModelNavigationDelegate {
    func routeToConfirmation() {
        route(to: .confirmation)
    }
}
