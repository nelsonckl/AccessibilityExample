//
//  AEAdhocAnnounceViewController.swift
//  AccessibilityExample
//
//  Created by Nelson Chim on 7/5/2023.
//

import UIKit

class AEAdhocAnnounceViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var elementToBeFocus: UIView!
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
           refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        scrollView.refreshControl = refreshControl
    }
    
    @objc func refresh(_ sender: AnyObject) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            UIAccessibility.post(notification: UIAccessibility.Notification.announcement,
                                 argument: "Refresh finished")
            self.refreshControl.endRefreshing()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
            UIAccessibility.post(notification: UIAccessibility.Notification.layoutChanged,
                                 argument: self.elementToBeFocus)
        })
    }
}
