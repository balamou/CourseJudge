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
    }
    
    @objc func cancelTapped() {
        // TODO: Hide
    }
}

