//
//  DetailsViewController.swift
//  CustomNavBar
//
//  Created by Innocent Magagula on 2024/04/05.
//

import UIKit

class DetailsViewController: BaseViewController {

    @IBOutlet weak var prodctIdLabel: UILabel!
    
    private let viewModel: DetailsViewModel
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    override func setupSubviews() {
        super.setupSubviews()
        title = "Details"
        prodctIdLabel.text = viewModel.productId
    }
    
    override func applyStyling() {
        super.applyStyling()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCustomNavBarAppearance()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        restoreDefaultNavBarAppearance()
    }
    
    @IBAction func confirmTapped(_ sender: Any) {
        viewModel.didTapConfirmButton()
    }
}
