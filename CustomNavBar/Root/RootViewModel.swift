//
//  RootViewModel.swift
//  CustomNavBar
//
//  Created by Innocent Magagula on 2024/04/06.
//

import Foundation

protocol RootViewModelNavigationDelegate: AnyObject {
    
    func routeToDetails(with productId: String)
}

final class RootViewModel {
    
    private weak var navigationDelegate: RootViewModelNavigationDelegate?
    
    init(navigationDelegate: RootViewModelNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
    }
    
    func didTapNextButton() {
        navigationDelegate?.routeToDetails(with: "43245")
    }
}
