//
//  RootViewController.swift
//  CustomNavBar
//
//  Created by Innocent Magagula on 2024/04/05.
//

import UIKit

class RootViewController: BaseViewController {
    
    private let viewModel: RootViewModel
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    override func setupSubviews() {
        super.setupSubviews()
        title = "Main"
    }
    
    override func applyStyling() {
        super.applyStyling()
        view.backgroundColor = .white
    }
    
    @IBAction private func nextButtonTapped(_ sender: Any) {
        viewModel.didTapNextButton()
    }
}
