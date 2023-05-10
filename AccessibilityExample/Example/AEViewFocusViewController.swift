//
//  AEViewFocusViewController.swift
//  AccessibilityExample
//
//  Created by Nelson Chim on 7/5/2023.
//

import UIKit

class AEViewFocusViewController: UIViewController {

    @IBOutlet weak var btcImageView: UIImageView!
    @IBOutlet weak var ethImageView: UIImageView!
    @IBOutlet weak var LabelA1: UILabel!
    @IBOutlet weak var LabelA2: UILabel!
    @IBOutlet weak var LabelA3: UILabel!
    @IBOutlet weak var LabelB1: UILabel!
    @IBOutlet weak var LabelB2: UILabel!
    @IBOutlet weak var LabelB3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btcImageView.isAccessibilityElement = true
        ethImageView.isAccessibilityElement = true
        
        let accessibleViews: [UIView] = [btcImageView, LabelA1, LabelA2, LabelA3,
                               LabelB1, LabelB2, LabelB3]
        view.accessibilityElements = accessibleViews
    }
}
