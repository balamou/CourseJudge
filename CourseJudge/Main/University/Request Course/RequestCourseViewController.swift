//
//  RequestCourseViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-12.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class RequestCourseViewController: UIViewController {

    private var requestCourseView: RequestCourseView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestCourseView = RequestCourseView()
        view = requestCourseView
        
        requestCourseView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        requestCourseView.requestButton.addTarget(self, action: #selector(requestButtonTapped), for: .touchUpInside)
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: {})
    }
    
    @objc func requestButtonTapped() {
        let courseCode = requestCourseView.courseCode.textField.text!
        let courseName = requestCourseView.courseName.textField.text!
        
        switch (courseCode.isEmpty, courseName.isEmpty) {
        case (true, true):
            break
        case (true, _):
            break
        case (_, true):
            break
        default:
            requestCourseView.showSuccess {
                self.dismiss(animated: true, completion: {})
            }
        }
    }
}

