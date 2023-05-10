//
//  AECustomMessageViewController.swift
//  AccessibilityExample
//
//  Created by Nelson Chim on 7/5/2023.
//

import UIKit

class AECustomMessageViewController: UIViewController {

    @IBOutlet weak var buyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buyButton.accessibilityLabel = "Buy"
        buyButton.accessibilityValue = ""
        buyButton.accessibilityHint = "Tap here to submit your buy order"
    }
}
