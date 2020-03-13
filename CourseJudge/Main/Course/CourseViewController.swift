//
//  CourseViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-13.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

protocol CourseViewControllerDelegate: class {
    func courseViewControllerBack()
}

class CourseViewController: UIViewController {
    weak var delegate: CourseViewControllerDelegate?
    private var courseView: CourseView!
    
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
        
        courseView = CourseView()
        view = courseView
        
        courseView.backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        courseView.courseNameLabel.text = course.courseName
        courseView.courseCodeLabel.text = course.courseCode.description
        courseView.overallRatingsLabel.text = "Rated \(course.rating.rawValue) out of 5"
    }
    
    @objc func backTapped() {
        delegate?.courseViewControllerBack()
    }
    
}
