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
        let errorMessage = "cannot be empty"
        
        switch (courseCode.isEmpty, courseName.isEmpty) {
        case (true, true):
            requestCourseView.courseCode.setError(message: errorMessage)
            requestCourseView.courseName.setError(message: errorMessage)
        case (true, _):
            requestCourseView.courseCode.setError(message: errorMessage)
            requestCourseView.courseName.setNormal()
        case (_, true):
            requestCourseView.courseCode.setNormal()
            requestCourseView.courseName.setError(message: errorMessage)
        default:
            requestCourseView.courseCode.setNormal()
            requestCourseView.courseName.setNormal()
            
            requestCourseView.showSuccess {
                self.dismiss(animated: true, completion: {})
            }
        }
    }
}

