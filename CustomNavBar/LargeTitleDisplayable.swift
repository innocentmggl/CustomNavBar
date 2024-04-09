//
//  LargeTitleDisplayable.swift
//  CustomNavBar
//
//  Created by Innocent Magagula on 2024/04/05.
//

import UIKit

public protocol LargeTitleDisplayable {

    func setLargeTitleDisplayMode(_ largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode)
}

public extension LargeTitleDisplayable where Self: UIViewController {

    func setLargeTitleDisplayMode(_ largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode) {
        switch largeTitleDisplayMode {
        case .automatic:
            guard let navigationController = navigationController else { break }
            if let index = navigationController.children.firstIndex(of: self) {
                setLargeTitleDisplayMode(index == 0 ? .always : .never)
            } else {
                setLargeTitleDisplayMode(.always)
            }
        case .always, .never, .inline:
            // Always override to be .never if large title isn't available (contentSizeCategory, device size..)
            navigationItem.largeTitleDisplayMode = isLargeTitleAvailable ? largeTitleDisplayMode : .never
            // Even when .never, needs to be true otherwise animation will be broken on iOS 13
            navigationController?.navigationBar.prefersLargeTitles = true
        @unknown default:
            assertionFailure("\(#function): Missing handler for \(largeTitleDisplayMode)")
        }
    }

    /// Exclude 4" screen or 4.7" with zoomed
    private var isLargeTitleAvailable: Bool {
        switch traitCollection.preferredContentSizeCategory {
        case .accessibilityExtraExtraExtraLarge,
             .accessibilityExtraExtraLarge,
             .accessibilityExtraLarge,
             .accessibilityLarge,
             .accessibilityMedium,
             .extraExtraExtraLarge:
            return false
        default:
            return UIScreen.main.bounds.height > 568
        }
    }
}
