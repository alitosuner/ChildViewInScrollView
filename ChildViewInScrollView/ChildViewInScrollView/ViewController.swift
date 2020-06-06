//
//  ViewController.swift
//  ChildViewInScrollView
//
//  Created by Ali Tosuner on 6.06.2020.
//  Copyright © 2020 Ali Tosuner. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    //MARK: - Privates
    @IBOutlet private weak var customView: UIView!
    @IBOutlet private weak var customViewHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController()
    }
    
    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        super.preferredContentSizeDidChange(forChildContentContainer: container)
        switch container {
        case is ChildViewController:
            customViewHeightConstraint.constant = container.preferredContentSize.height
        default:
            break
        }
    }
    
    private func addChildViewController() {
        guard let childViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ChildViewController") as? ChildViewController
            else { return }
        addChild(childViewController)
        customView.addSubview(childViewController.view)
        activateRequiredConstraints(for: childViewController.view)
        childViewController.didMove(toParent: self)
    }
    
    private func activateRequiredConstraints(for childView: UIView) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 0),
            childView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: 0),
            childView.topAnchor.constraint(equalTo: customView.topAnchor, constant: 0),
            childView.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: 0)
        ])
    }
}


