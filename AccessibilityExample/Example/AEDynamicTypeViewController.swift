//
//  AEDynamicTypeViewController.swift
//  AccessibilityExample
//
//  Created by Nelson Chim on 7/5/2023.
//

import UIKit

class AEDynamicTypeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        titleLabel.adjustsFontForContentSizeCategory = true
    }
}
