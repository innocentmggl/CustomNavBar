//
//  ConfirmViewController.swift
//  CustomNavBar
//
//  Created by Innocent Magagula on 2024/04/09.
//

import UIKit

class ConfirmViewController: BaseViewController {
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }

    override func setupSubviews() {
        super.setupSubviews()
        title = "Confirmation"
    }
}
