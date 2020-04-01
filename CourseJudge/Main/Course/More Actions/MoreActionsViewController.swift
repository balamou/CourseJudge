//
//  MoreActionsViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-24.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit


class MoreActionsViewController: UIViewController {
    
    var moreActionsView: MoreActionsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreActionsView = MoreActionsView()
        view = moreActionsView
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cancelTapped))
        view.addGestureRecognizer(tap)
        
        moreActionsView.cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
    }
    
    @objc func cancelTapped() {
        UIView.animate(withDuration: 0.2, animations: {
            self.moreActionsView.overallTintView.alpha = 0.0
        }, completion: { _ in
            self.removeSelfAsChildViewController()
        })
    }
    
    func presetAnimation() {
        self.moreActionsView.overallTintView.alpha = 0.0
        
        UIView.animate(withDuration: 0.2, animations: {
            self.moreActionsView.overallTintView.alpha = 1.0
        })
    }
}

