//
//  RateViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-24.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

protocol RateViewControllerDelegate: class {
    func rateViewControllerDoneRating()
}

class RateViewController: UIViewController {
    weak var delegate: RateViewControllerDelegate?
    private var rateView: RateView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        rateView = RateView()
        view = rateView
    }
    
}
