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
    func rateViewControllerBack()
}

class RateViewController: UIViewController {
    weak var delegate: RateViewControllerDelegate?
    private var rateView: RateView!
    
    private let course: Course
    
    init(course: Course) {
        self.course = course
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        rateView = RateView()
        view = rateView
        
        rateView.courseCodeLabel.text = course.courseCode.description
        
        rateView.backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
    }
    
    @objc func backTapped() {
        delegate?.rateViewControllerBack()
    }
    
}
