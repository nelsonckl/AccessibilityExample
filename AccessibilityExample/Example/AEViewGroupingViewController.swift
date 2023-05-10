//
//  AEViewGroupingViewController.swift
//  AccessibilityExample
//
//  Created by Nelson Chim on 7/5/2023.
//

import UIKit

class AEViewGroupingViewController: UIViewController {
    
    @IBOutlet weak var btcContainerView: UIView!
    @IBOutlet weak var ethContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ethContainerView.isAccessibilityElement = true
        ethContainerView.accessibilityValue = "Ethereum coin, increased by 0.2 percent, amount 0.0001"
    }

}
