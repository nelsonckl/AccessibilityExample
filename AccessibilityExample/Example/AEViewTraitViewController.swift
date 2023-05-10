//
//  AEViewTraitViewController.swift
//  AccessibilityExample
//
//  Created by Nelson Chim on 7/5/2023.
//

import UIKit

class AEViewTraitViewController: UIViewController {

    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        normalButton.accessibilityTraits = .button
        linkButton.accessibilityTraits = .link
    }

}
