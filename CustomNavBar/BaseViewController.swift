//
//  BaseViewController.swift
//  CustomNavBar
//
//  Created by Innocent Magagula on 2024/04/05.
//

import UIKit

open class BaseViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        applyStyling()
    }


    open func setupSubviews() {
        navigationItem.backBarButtonItem = BackBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
    }
    
    open func applyStyling() { }
}

extension BaseViewController: LargeTitleDisplayable { }

open class BackBarButtonItem: UIBarButtonItem {

    open override var menu: UIMenu? {
        get {
            return super.menu
        }
        set {
            // Don't set the menu here
        }
    }
}
