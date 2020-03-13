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
        
    }
}

