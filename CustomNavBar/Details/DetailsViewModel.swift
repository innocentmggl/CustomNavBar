//
//  DetailsViewModel.swift
//  CustomNavBar
//
//  Created by Innocent Magagula on 2024/04/06.
//

import Foundation

protocol DetailsViewModelNavigationDelegate: AnyObject {
    
    func routeToConfirmation()
}

final class DetailsViewModel {
    
    private weak var navigationDelegate: DetailsViewModelNavigationDelegate?
    
    let productId: String
    
    init(productId: String, navigationDelegate: DetailsViewModelNavigationDelegate) {
        self.productId = productId
        self.navigationDelegate = navigationDelegate
    }
    
    func didTapConfirmButton() {
        navigationDelegate?.routeToConfirmation()
    }
}
