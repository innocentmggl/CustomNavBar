//
//  NavBarStyleHelper.swift
//  CustomNavBar
//
//  Created by Innocent Magagula on 2024/04/07.
//

import UIKit

final class NavBarStyleHelper {
    
    var customNavBarAppearance: UINavigationBarAppearance {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithDefaultBackground()
        navBarAppearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 22),
            .foregroundColor: UIColor.white
        ]
        navBarAppearance.largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 24),
            .foregroundColor: UIColor.white
        ]
        navBarAppearance.backgroundColor = .blue
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.shadowColor = .clear
        
        return navBarAppearance
    }
    
    let tintColor: UIColor?
    let standardAppearance: UINavigationBarAppearance
    let scrollEdgeAppearance: UINavigationBarAppearance?
    let compactAppearance: UINavigationBarAppearance?
    
    static let shared = NavBarStyleHelper()
    
    private init() {
        // cache the default appearance vaules
        tintColor = UINavigationBar.appearance().tintColor
        standardAppearance = UINavigationBar.appearance().standardAppearance
        scrollEdgeAppearance = UINavigationBar.appearance().scrollEdgeAppearance
        compactAppearance = UINavigationBar.appearance().compactAppearance
    }
}

extension UIViewController {
    
    func restoreDefaultNavBarAppearance() {
        guard let navController = self.navigationController else {
            return
        }
        let appearance = NavBarStyleHelper.shared
        navController.navigationBar.tintColor = appearance.tintColor
        navController.navigationBar.standardAppearance = appearance.standardAppearance
        navController.navigationBar.scrollEdgeAppearance = appearance.scrollEdgeAppearance
        navController.navigationBar.compactAppearance = appearance.compactAppearance
    }

    func setCustomNavBarAppearance() {
        guard let navController = self.navigationController else {
            return
        }
        let appearance = NavBarStyleHelper.shared.customNavBarAppearance
        navController.navigationBar.tintColor = .white
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = appearance
        navController.navigationBar.compactAppearance = appearance
    }
}
