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
    var wrapperHeight: CGFloat = 0.0
    
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
            self.moreActionsView.bottomWrapperConstraint.constant = self.wrapperHeight
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.removeSelfAsChildViewController()
        })
    }
    
    func presetAnimation() {
        moreActionsView.overallTintView.alpha = 0.0
        
        view.layoutIfNeeded() // trigger an update to get the height
        wrapperHeight = moreActionsView.wrapperView.frame.height
        moreActionsView.bottomWrapperConstraint.constant = wrapperHeight
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.2, animations: {
            self.moreActionsView.overallTintView.alpha = 1.0
            self.moreActionsView.bottomWrapperConstraint.constant = 0.0
            self.view.layoutIfNeeded()
        })
    }
}

